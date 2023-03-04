package service.impl;

import dao.IRoleDao;
import dao.IUserDao;
import model.Role;
import model.User;
import paging.IPagble;
import service.IUserService;

import javax.inject.Inject;
import java.util.List;

public class UserService implements IUserService {
    @Inject
    private IUserDao userDao;
    @Inject
    private IRoleDao roleDao;

    @Override
    public User save(User user) {
        Role role = roleDao.findOneByCode(user.getRoleCode());
        user.setRole_id(role.getId());
        Long userId = userDao.save(user);
        return userDao.findOne(userId);
    }

    @Override
    public User update(User user) {
        Role role = roleDao.findOneByCode(user.getRoleCode());
        user.setRole_id(role.getId());
        userDao.update(user);
        return userDao.findOne(user.getId());
    }

    @Override
    public void delete(Long[] ids) {
        for (Long id : ids) {
            userDao.delete(id);
        }
    }

    @Override
    public List<User> findAll(String keyword, IPagble pagble) {
        return userDao.findAll(keyword, pagble);
    }

    @Override
    public int getTotalItem(String keyword) {
        return userDao.getTotalItem(keyword);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findByEmailAndPasswordAndStatusid(String email, String password, int status_id) {
        return userDao.findByEmailAndPasswordAndStatusid(email, password, status_id);
    }

    @Override
    public User findOne(Long id) {
        User user = userDao.findOne(id);
        Role role = roleDao.findOne(user.getRole_id());
        user.setRoleCode(role.getCode());
        return user;
    }
}
