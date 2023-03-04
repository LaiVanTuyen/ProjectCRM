package dao.impl;

import dao.IUserDao;
import mapper.UserMapper;
import model.User;
import org.apache.commons.lang3.StringUtils;
import paging.IPagble;

import java.util.List;

public class UserDao extends AbstractDao<User> implements IUserDao {
    @Override
    public Long save(User user) {
        StringBuilder sql = new StringBuilder("insert into user (email, password, fullname, ");
        sql.append("address, phone, role_id, status_id) ");
        sql.append("values (?, ?, ?, ?, ?, ?, ?)");
        return insert(sql.toString(), user.getEmail(), user.getPassword(), user.getFullname(),
                user.getAddress(), user.getPhone(), user.getRole_id(), user.getStatus_id());
    }

    @Override
    public void update(User user) {
        StringBuilder sql = new StringBuilder("update user set email = ?, password = ?, fullname = ?, ");
        sql.append("address = ?, phone = ?, role_id = ?, status_id = ? ");
        sql.append("where id = ?");
        update(sql.toString(), user.getEmail(), user.getPassword(), user.getFullname(),
                user.getAddress(), user.getPhone(), user.getRole_id(), user.getStatus_id(),
                user.getId());
    }

    @Override
    public void delete(Long id) {
        String sql = "delete from user where id = ?";
        update(sql, id);
    }

    @Override
    public User findOne(Long id) {
        String sql = "select * from user where id = ?";
        List<User> user = query(sql, new UserMapper(), id);
        return user.isEmpty() ? null : user.get(0);
    }

    @Override
    public List<User> findAll(String keyword, IPagble pagble) {
        StringBuilder sql = new StringBuilder("select * from user where email like \"%"+keyword+"%\"");
        if (pagble.getSorter()!=null&& StringUtils.isNotBlank(pagble.getSorter().getSortBy())&& StringUtils.isNotBlank(pagble.getSorter().getSortName())) {
            sql.append(" order by "+pagble.getSorter().getSortName()+" "+pagble.getSorter().getSortBy()+"");
        }
        if (pagble.getOffset()!=null&&pagble.getLimit()!=null) {
            sql.append(" limit "+pagble.getOffset()+", "+pagble.getLimit()+"");
        }
        return query(sql.toString(), new UserMapper());
    }

    @Override
    public List<User> findAll() {
        String sql = "select * from user";
        return query(sql, new UserMapper());
    }

    @Override
    public int getTotalItem(String keyword) {
        String sql = "select count(*) from user where email like \"%"+keyword+"%\"";
        return count(sql);
    }

    @Override
    public User findByEmailAndPasswordAndStatusid(String email, String password, int status_id) {
        StringBuilder sql = new StringBuilder("select * from user as u ");
        sql.append("inner join role as r on r.id = u.role_id ");
        sql.append("where email = ? and password = ? and status_id = ?");
        List<User> user = query(sql.toString(),new UserMapper(),email,password,status_id);
        return user.isEmpty() ? null : user.get(0);
    }
}
