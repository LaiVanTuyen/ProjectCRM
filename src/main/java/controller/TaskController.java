package controller;

import constant.SystemConstant;
import model.Task;
import paging.IPagble;
import paging.PageRequest;
import service.IProjectService;
import service.IStatusService;
import service.ITaskService;
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

@WebServlet(urlPatterns = {"/admin/task"})
public class TaskController extends HttpServlet {
    @Inject
    private ITaskService taskService;
    @Inject
    private IUserService userService;
    @Inject
    private IStatusService statusService;
    @Inject
    private IProjectService projectService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String views= "";
        Task model = FormUtils.toModel(Task.class, req);
        if (model.getType().equals(SystemConstant.LIST)){
            String keyword = req.getParameter("keyword");
            if (keyword == null) {
                keyword = "";
            }

            IPagble pagble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(),model.getSortBy()));
            model.setListResult(taskService.findAll(keyword,pagble));
            model.setTotalItem(taskService.getTotalItem(keyword));
            model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            views = "/views/task/ListTask.jsp";
        } else if (model.getType().equals(SystemConstant.EDIT)) {
            if (model.getId()!= null){
                model = taskService.findOne(model.getId());
            }
            req.setAttribute("taskstatus", statusService.findAll());
            req.setAttribute("taskusers", userService.findAll());
            req.setAttribute("taskprojects", projectService.findAll());
            views = "/views/task/EditTask.jsp";
        }
        MessageUtils.showMessage(req);
        req.setAttribute("statusModel", statusService.findAll());
        req.setAttribute("userModel", userService.findAll());
        req.setAttribute("projectModel", projectService.findAll());
        req.setAttribute("taskModel",model);
        RequestDispatcher rd = req.getRequestDispatcher(views);
        rd.forward(req, resp);
    }
}
