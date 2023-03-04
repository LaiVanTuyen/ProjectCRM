package api;

import com.fasterxml.jackson.databind.ObjectMapper;
import model.User;
import service.IUserService;
import utils.HttpUtils;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api/v1/user"})
public class UserRestController extends HttpServlet {
    @Inject
    private IUserService userService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        User user = HttpUtils.of(req.getReader()).toModel(User.class);
        user = userService.save(user);
        mapper.writeValue(resp.getOutputStream(),user);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        User updateUser = HttpUtils.of(req.getReader()).toModel(User.class);
        updateUser = userService.update(updateUser);
        mapper.writeValue(resp.getOutputStream(),updateUser);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        User updateUser = HttpUtils.of(req.getReader()).toModel(User.class);
        userService.delete(updateUser.getIds());
        mapper.writeValue(resp.getOutputStream(), "{}");
    }
}
