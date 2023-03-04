package api;

import com.fasterxml.jackson.databind.ObjectMapper;
import model.Task;
import service.ITaskService;
import utils.HttpUtils;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api/v1/task"})
public class TaskRestController extends HttpServlet {
    @Inject
    private ITaskService taskService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Task task = HttpUtils.of(req.getReader()).toModel(Task.class);
        task = taskService.save(task);
        mapper.writeValue(resp.getOutputStream(),task);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Task updateTask = HttpUtils.of(req.getReader()).toModel(Task.class);
        updateTask = taskService.update(updateTask);
        mapper.writeValue(resp.getOutputStream(),updateTask);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Task updateTask = HttpUtils.of(req.getReader()).toModel(Task.class);
        taskService.delete(updateTask.getIds());
        mapper.writeValue(resp.getOutputStream(), "{}");
    }
}
