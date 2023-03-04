package dao.impl;

import dao.IProjectDao;
import mapper.ProjectMapper;
import model.Project;
import org.apache.commons.lang3.StringUtils;
import paging.IPagble;

import java.util.List;

public class ProjectDao extends AbstractDao<Project> implements IProjectDao{
    @Override
    public Long save(Project project) {
        StringBuilder sql = new StringBuilder("insert into project (name, descriptions, user_id, ");
        sql.append("start_date, end_date)");
        sql.append("values (?, ?, ?, ?, ?)");
        return insert(sql.toString(), project.getName(), project.getDescriptions(), project.getUser_id(),
                project.getStart_date(), project.getEnd_date());
    }

    @Override
    public void update(Project project) {
        StringBuilder sql = new StringBuilder("update project set name = ?, descriptions = ?, user_id = ?, ");
        sql.append("start_date = ?, end_date = ?");
        sql.append("where id = ?");
        update(sql.toString(), project.getName(), project.getDescriptions(), project.getUser_id(),
                project.getStart_date(), project.getEnd_date(), project.getId());
    }

    @Override
    public void delete(Long id) {
        String sql = "delete from project where id = ?";
        update(sql, id);
    }

    @Override
    public Project findOne(Long id) {
        String sql = "select * from project where id = ?";
        List<Project> projects = query(sql, new ProjectMapper(), id);
        return projects.isEmpty() ? null : projects.get(0);
    }

    @Override
    public List<Project> findAll(String keyword, IPagble pagble) {
        StringBuilder sql = new StringBuilder("select * from project where name like \"%"+keyword+"%\"");
        if (pagble.getSorter()!=null&& StringUtils.isNotBlank(pagble.getSorter().getSortBy())&& StringUtils.isNotBlank(pagble.getSorter().getSortName())) {
            sql.append(" order by "+pagble.getSorter().getSortName()+" "+pagble.getSorter().getSortBy()+"");
        }
        if (pagble.getOffset()!=null&&pagble.getLimit()!=null) {
            sql.append(" limit "+pagble.getOffset()+", "+pagble.getLimit()+"");
        }
        return query(sql.toString(), new ProjectMapper());
    }

    @Override
    public List<Project> findAll() {
        String sql = "select * from project";
        return query(sql, new ProjectMapper());
    }

    @Override
    public int getTotalItem(String keyword) {
        String sql = "select count(*) from project where name like \"%"+keyword+"%\"";
        return count(sql);
    }

}
