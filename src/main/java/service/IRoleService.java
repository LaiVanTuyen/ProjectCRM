package service;


import model.Role;

import java.util.List;

public interface IRoleService {
    Role findOne(Long id);
    List<Role> findAll();
}
