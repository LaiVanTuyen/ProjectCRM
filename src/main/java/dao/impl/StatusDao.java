package dao.impl;

import dao.IStatusDao;
import mapper.StatusMapper;
import model.Status;

import java.util.List;

public class StatusDao extends AbstractDao<Status> implements IStatusDao {
    @Override
    public List<Status> findAll() {
        String sql = "SELECT * FROM status";
        return query(sql,new StatusMapper());
    }
}
