package mapper;


import model.Role;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleMapper implements IRowMapper<Role> {
    @Override
    public Role mapRow(ResultSet rs) {
        Role role = new Role();
        try {
            role.setId(rs.getLong("id"));
            role.setName(rs.getString("name"));
            role.setCode(rs.getString("code"));
            return role;
        }catch (SQLException e){
            return null;
        }
    }
}

