package dao.impl;



import dao.IRoleDao;
import mapper.RoleMapper;
import model.Role;

import java.util.List;

public class RoleDao extends AbstractDao<Role> implements IRoleDao {
    @Override
    public Role findOne(Long id) {
        String sql = "SELECT * FROM role WHERE id = ?";
        List<Role> roles = query(sql, new RoleMapper(), id);
        return roles.isEmpty() ? null : roles.get(0);
    }

    @Override
    public List<Role> findAll() {
        String sql = "SELECT * FROM role";
        return query(sql, new RoleMapper());
    }

    @Override
    public Role findOneByCode(String code) {
        String sql = "SELECT * FROM role WHERE code = ?";
        List<Role> roles = query(sql, new RoleMapper(), code);
        return roles.isEmpty() ? null : roles.get(0);
    }
}
