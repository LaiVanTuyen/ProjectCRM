package service;

import model.Task;
import paging.IPagble;

import java.util.List;

public interface ITaskService {
    Task save(Task task);
    Task update(Task task);
    void delete(Long[] id);
    Task findOne(Long id);
    List<Task> findAll(String keyword, IPagble pagble);
    int getTotalItem(String keyword);
}
