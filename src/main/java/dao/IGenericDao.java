package dao;

import mapper.IRowMapper;

import java.util.List;

public interface IGenericDao<T> {
    <T> List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters);
    Long insert(String sql, Object... parameters);
    void update(String sql, Object... parameters);
    int count(String sql, Object... parameters);
}

