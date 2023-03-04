package dao;

import model.User;
import paging.IPagble;

import java.util.List;

public interface IUserDao extends IGenericDao<User> {
    Long save(User user);
    void update(User user);
    void delete(Long id);
    User findOne(Long id);
    List<User> findAll(String keyword, IPagble pagble);
    List<User> findAll();
    int getTotalItem(String keyword);
    User findByEmailAndPasswordAndStatusid(String email,String password,int status_id);
}
