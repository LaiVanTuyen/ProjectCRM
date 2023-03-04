package service.impl;

import dao.IProjectDao;
import model.Project;
import paging.IPagble;
import service.IProjectService;

import javax.inject.Inject;
import java.util.List;

public class ProjectService implements IProjectService {
    @Inject
    private IProjectDao projectDao;


    @Override
    public Project save(Project project) {
       Long id = projectDao.save(project);
       return projectDao.findOne(id);
    }

    @Override
    public Project update(Project project) {
        projectDao.update(project);
        return projectDao.findOne(project.getId());
    }

    @Override
    public void delete(Long[] id) {
        for (Long item : id) {
            projectDao.delete(item);
        }
    }

    @Override
    public Project findOne(Long id) {
        return projectDao.findOne(id);
    }

    @Override
    public List<Project> findAll(String keyword, IPagble pagble) {
        return projectDao.findAll(keyword,pagble);
    }

    @Override
    public List<Project> findAll() {
        return projectDao.findAll();
    }

    @Override
    public int getTotalItem(String keyword) {
        return projectDao.getTotalItem(keyword);
    }
}
