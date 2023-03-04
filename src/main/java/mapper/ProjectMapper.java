package mapper;

import model.Project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProjectMapper implements IRowMapper<Project>{

    @Override
    public Project mapRow(ResultSet rs) {
        Project project = new Project();
        try {
            project.setId(rs.getLong("id"));
            project.setName(rs.getString("name"));
            project.setDescriptions(rs.getString("descriptions"));
            project.setUser_id(rs.getLong("user_id"));
            project.setStart_date(rs.getDate("start_date"));
            project.setEnd_date(rs.getDate("end_date"));
            return project;
        }catch (SQLException e){
            return null;
        }
    }
}
