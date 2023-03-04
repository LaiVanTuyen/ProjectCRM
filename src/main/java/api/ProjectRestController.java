package api;

import com.fasterxml.jackson.databind.ObjectMapper;
import model.Project;
import service.IProjectService;
import utils.HttpUtils;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api/v1/project"})
public class ProjectRestController extends HttpServlet {
    @Inject
    private IProjectService projectService;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Project project = HttpUtils.of(req.getReader()).toModel(Project.class);
        project = projectService.save(project);
        mapper.writeValue(resp.getOutputStream(),project);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Project updateProject = HttpUtils.of(req.getReader()).toModel(Project.class);
        updateProject = projectService.update(updateProject);
        mapper.writeValue(resp.getOutputStream(),updateProject);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Project updateProject = HttpUtils.of(req.getReader()).toModel(Project.class);
        projectService.delete(updateProject.getIds());
        mapper.writeValue(resp.getOutputStream(), "{}");
    }
}
