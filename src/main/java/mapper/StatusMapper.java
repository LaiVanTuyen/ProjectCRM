package mapper;


import model.Status;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StatusMapper implements IRowMapper<Status> {
    @Override
    public Status mapRow(ResultSet rs) {
        Status status = new Status();
        try {
            status.setId(rs.getLong("id"));
            status.setName(rs.getString("name"));
            status.setDescriptions(rs.getString("descriptions"));
            return status;
        } catch (SQLException e) {
           return null;
        }
    }
}
