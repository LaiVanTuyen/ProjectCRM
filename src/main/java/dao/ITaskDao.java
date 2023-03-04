package dao;

import model.Task;
import paging.IPagble;

import java.util.List;

public interface ITaskDao extends IGenericDao<Task> {
    Long save(Task task);
    void update(Task task);
    void delete(Long id);
    Task findOne(Long id);
    List<Task> findAll(String keyword, IPagble pagble);
    int getTotalItem(String keyword);

}
