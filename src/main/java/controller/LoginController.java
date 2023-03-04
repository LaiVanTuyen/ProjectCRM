package controller;

import model.User;
import service.IRoleService;
import service.IUserService;
import utils.FormUtils;
import utils.SessionUtils;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/login","/logout"})
public class LoginController extends HttpServlet {

    @Inject
    private IUserService userService;
    @Inject
    private IRoleService roleService;
    ResourceBundle rb = ResourceBundle.getBundle("message");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action!=null && action.equals("login")) {
            String alert = req.getParameter("alert");
            String message = req.getParameter("message");
            if (message != null && alert != null) {
                req.setAttribute("message", rb.getString(message));
                req.setAttribute("alert", alert);
            }
            req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
        }else if (action!=null && action.equals("logout")) {
            req.getSession().removeAttribute("USERMODEL");
            resp.sendRedirect(req.getContextPath()+"login?action=login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("login")){
            User model = FormUtils.toModel(User.class, req);
            model= userService.findByEmailAndPasswordAndStatusid(model.getEmail(), model.getPassword(), 3);
            req.setAttribute("roles", roleService.findAll());
            if(model!=null){
                SessionUtils.getInstance().putValue(req, "USERMODEL", model);
                if (model.getRole().getCode().equals("ADMIN")){
                    resp.sendRedirect(req.getContextPath()+"/admin/home");
                }else if (model.getRole().getCode().equals("MANAGER")){
                    resp.sendRedirect(req.getContextPath()+"/admin/home");
                } else if (model.getRole().getCode().equals("EMPLOYEE")){
                    resp.sendRedirect(req.getContextPath()+"/admin/home");
                }
            }else {
                resp.sendRedirect(req.getContextPath()+"login?action=login&message=username_password_invalid&alert=danger");
            }
        }
    }
}
