package dao;


import model.Role;

import java.util.List;

public interface IRoleDao extends IGenericDao<Role> {
    Role findOne(Long id);
    List<Role> findAll();
    Role findOneByCode(String code);
}
