package filter;

import constant.SystemConstant;
import model.User;
import utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthenticationFilter implements Filter{
    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        String url = servletRequest.getRequestURI();
        if (url.startsWith("/admin")) {
            User model = (User) SessionUtils.getInstance().getValue(servletRequest, "USERMODEL");
            if (model != null) {
                if (model.getRole().getCode().equals(SystemConstant.ADMIN)) {
                    chain.doFilter(request, response);
                } else if (model.getRole().getCode().equals(SystemConstant.MANAGER)) {
                    chain.doFilter(request, response);
                } else if (model.getRole().getCode().equals(SystemConstant.EMPLOYEE)) {
                    chain.doFilter(request, response);
                } else {
                    servletResponse.sendRedirect(servletRequest.getContextPath() + "/login?action=login");
                }

            } else {
                servletResponse.sendRedirect(servletRequest.getContextPath()+"/login?action=login&message=not_login&alert=danger");
            }
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
