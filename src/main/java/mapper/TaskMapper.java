package mapper;

import model.Task;

import java.sql.ResultSet;

public class TaskMapper implements IRowMapper<Task> {
    @Override
    public Task mapRow(ResultSet rs) {
        try {
            Task task = new Task();
            task.setId(rs.getLong("id"));
            task.setName(rs.getString("name"));
            task.setDescriptions(rs.getString("descriptions"));
            task.setStart_date(rs.getDate("start_date"));
            task.setEnd_date(rs.getDate("end_date"));
            task.setUser_id(rs.getLong("user_id"));
            task.setProject_id(rs.getLong("project_id"));
            task.setStatus_id(rs.getLong("status_id"));
            return task;
        } catch (Exception e) {
            return null;
        }
    }
}
