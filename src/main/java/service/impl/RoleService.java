
package service.impl;



import dao.IRoleDao;
import model.Role;
import service.IRoleService;

import javax.inject.Inject;
import java.util.List;


public class RoleService implements IRoleService {

    @Inject
    private IRoleDao roleDao;


    @Override
    public Role findOne(Long id) {
        return roleDao.findOne(id);
    }

    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }
}

