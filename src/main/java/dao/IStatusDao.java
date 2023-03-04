package dao;

import model.Status;

import java.util.List;

public interface IStatusDao extends IGenericDao<Status>{
    List<Status> findAll();
}
