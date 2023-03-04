package controller;

import constant.SystemConstant;
import model.Project;
import paging.IPagble;
import paging.PageRequest;
import service.IProjectService;
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

@WebServlet(urlPatterns = {"/admin/project"})
public class ProjectController extends HttpServlet {
    @Inject
    private IProjectService projectService;
    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String views ="";
        Project model = FormUtils.toModel(Project.class, req);
        if (model.getType().equals(SystemConstant.LIST)){
            String keyword = req.getParameter("keyword");
            if (keyword == null) {
                keyword = "";
            }
            IPagble pagble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(),model.getSortBy()));
            model.setListResult(projectService.findAll(keyword,pagble));
            model.setTotalItem(projectService.getTotalItem(keyword));
            model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            views = "/views/project/ListProject.jsp";
        } else if (model.getType().equals(SystemConstant.EDIT)) {
            if (model.getId()!= null){
                model = projectService.findOne(model.getId());
            }
            req.setAttribute("users", userService.findAll());
            views = "/views/project/EditProject.jsp";
        }
        MessageUtils.showMessage(req);
        req.setAttribute("userModel",userService.findAll());
        req.setAttribute("projectModel",model);
        RequestDispatcher rd = req.getRequestDispatcher(views);
        rd.forward(req, resp);
    }
}
