package service.impl;

import dao.ITaskDao;
import model.Task;
import paging.IPagble;
import service.ITaskService;

import javax.inject.Inject;
import java.util.List;

public class TaskService implements ITaskService {

    @Inject
    private ITaskDao taskDao;
    @Override
    public Task save(Task task) {
        Long id = taskDao.save(task);
        return taskDao.findOne(id);
    }

    @Override
    public Task update(Task task) {
        taskDao.update(task);
        return taskDao.findOne(task.getId());
    }

    @Override
    public void delete(Long[] id) {
        for (Long item : id) {
            taskDao.delete(item);
        }
    }

    @Override
    public Task findOne(Long id) {
        return taskDao.findOne(id);
    }

    @Override
    public List<Task> findAll(String keyword, IPagble pagble) {
        return taskDao.findAll(keyword, pagble);
    }

    @Override
    public int getTotalItem(String keyword) {
        return taskDao.getTotalItem(keyword);
    }
}
