package service;

import model.User;
import paging.IPagble;

import java.util.List;

public interface IUserService {
    User save(User user);
    User update(User user);
    void delete(Long[] ids);
    List<User> findAll(String keyword, IPagble pagble);
    int getTotalItem(String keyword);

    List<User> findAll();

    User findByEmailAndPasswordAndStatusid(String email,String password,int status_id);
    User findOne(Long id);
}
