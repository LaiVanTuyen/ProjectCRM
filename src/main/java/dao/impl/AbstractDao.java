package dao.impl;

import dao.IGenericDao;
import mapper.IRowMapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

public class AbstractDao<T> implements IGenericDao<T> {
    ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
    public Connection getConnection() {
        try {
            Class.forName(resourceBundle.getString("driverName"));
            String url = resourceBundle.getString("url");
            String user = resourceBundle.getString("username");
            String password = resourceBundle.getString("password");
            return DriverManager.getConnection(url, user, password);
        }catch (ClassNotFoundException | SQLException e) {
            return null;
        }
    }

    @Override
    public <T1> List<T1> query(String sql, IRowMapper<T1> rowMapper, Object... parameters) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        List<T1> results = new ArrayList<>();
        try {
            conn = getConnection();
            statement = conn.prepareStatement(sql);
            // set parameter()
            setParameter(statement, parameters);
            rs = statement.executeQuery();
            while (rs.next()) {
                results.add(rowMapper.mapRow(rs));
            }
            return results;
        }catch (SQLException e) {
    }
        finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                return null;
            }
        }
        return null;
    }

    @Override
    public Long insert(String sql, Object... parameters) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        Long id = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false);
            statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            setParameter(statement, parameters);
            statement.executeUpdate();
            rs = statement.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getLong(1);
            }
            conn.commit();
            return id;
        }catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }return null;
        }finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                return null;
            }
        }
    }

    @Override
    public void update(String sql, Object... parameters) {
        Connection conn = null;
        PreparedStatement statement = null;
        try{
            conn = getConnection();
            conn.setAutoCommit(false);
            statement = conn.prepareStatement(sql);
            setParameter(statement, parameters);
            statement.executeUpdate();
            conn.commit();
        }catch (SQLException e){
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
        }finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public int count(String sql, Object... parameters) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            int count =0;
            conn = getConnection();
            statement = conn.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            return count;
        } catch (SQLException e) {
            return 0;
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return 0;
            }

        }
    }
    private void setParameter(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof Long) {
                    statement.setLong(index, (Long) parameter);
                } else if (parameter instanceof String) {
                    statement.setString(index, (String) parameter);
                }else if (parameter instanceof Integer) {
                    statement.setInt(index, (Integer) parameter);
                }else if (parameter instanceof Boolean) {
                    statement.setBoolean(index, (Boolean) parameter);
                }else if (parameter instanceof Timestamp) {
                    statement.setTimestamp(index, (Timestamp) parameter);
                } else if (parameter instanceof Date) {
                    statement.setDate(index, (Date) parameter);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    }
