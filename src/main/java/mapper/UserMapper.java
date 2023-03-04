package mapper;



import model.User;

import java.sql.ResultSet;

public class UserMapper implements IRowMapper<User> {
    @Override
    public User mapRow(ResultSet rs) {
        User user = new User();
        try {
            user.setId(rs.getLong("id"));
            user.setEmail(rs.getString("email"));
            user.setFullname(rs.getString("fullname"));
            user.setPassword(rs.getString("password"));
            user.setAddress(rs.getString("address"));
            user.setPhone(rs.getString("phone"));
            user.setRole_id(rs.getLong("role_id"));
            user.setStatus_id(rs.getLong("status_id"));
            try {
                model.Role role = new model.Role();
                role.setCode(rs.getString("code"));
                role.setName(rs.getString("name"));
                user.setRole(role);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return user;
        } catch (Exception e) {
            return null;
        }
    }
}
