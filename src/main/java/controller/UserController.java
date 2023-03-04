package controller;

import constant.SystemConstant;
import model.User;
import paging.IPagble;
import paging.PageRequest;
import service.IRoleService;
import service.IStatusService;
import service.IUserService;
import sort.Sorter;
import utils.FormUtils;
import utils.MessageUtils;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/user"})
public class UserController extends HttpServlet {
    @Inject
    private  IUserService userService;
    @Inject
    private IRoleService roleService;
    @Inject
    private IStatusService statusService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String views= "";
        User model = FormUtils.toModel(User.class, req);
        if (model.getType().equals(SystemConstant.LIST)){
            String keyword = req.getParameter("keyword");
            if (keyword == null) {
                keyword = "";
            }

            IPagble pagble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(),model.getSortBy()));
            model.setListResult(userService.findAll(keyword,pagble));
            model.setTotalItem(userService.getTotalItem(keyword));
            model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            views = "/views/user/ListUser.jsp";
        } else if (model.getType().equals(SystemConstant.EDIT)) {
            if (model.getId()!= null){
                model = userService.findOne(model.getId());
            }
            req.setAttribute("status", statusService.findAll());

            views = "/views/user/EditUser.jsp";
        }
        MessageUtils.showMessage(req);
        req.setAttribute("roles", roleService.findAll());
        req.setAttribute("statusModel", statusService.findAll());
        req.setAttribute(SystemConstant.MODEL,model);
        RequestDispatcher rd = req.getRequestDispatcher(views);
        rd.forward(req, resp);
    }

}
