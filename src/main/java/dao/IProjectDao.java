package dao;

import model.Project;
import paging.IPagble;

import java.util.List;

public interface IProjectDao extends IGenericDao<Project>{
    Long save(Project project);
    void update(Project project);
    void delete(Long id);
    Project findOne(Long id);
    List<Project> findAll(String keyword, IPagble pagble);
    List<Project> findAll();
    int getTotalItem(String keyword);
}
