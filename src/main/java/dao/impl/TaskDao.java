package dao.impl;

import dao.ITaskDao;
import mapper.TaskMapper;
import model.Task;
import org.apache.commons.lang3.StringUtils;
import paging.IPagble;

import java.util.List;

public class TaskDao extends AbstractDao<Task> implements ITaskDao {
    @Override
    public Long save(Task task) {
        StringBuilder sql = new StringBuilder("insert into task (name, descriptions, project_id, ");
        sql.append("status_id, user_id, start_date, end_date) ");
        sql.append("values (?, ?, ?, ?, ?, ?, ?)");
        return insert(sql.toString(), task.getName(), task.getDescriptions(), task.getProject_id(),
                task.getStatus_id(), task.getUser_id(), task.getStart_date(), task.getEnd_date());
    }

    @Override
    public void update(Task task) {
        StringBuilder sql = new StringBuilder("update task set name = ?, descriptions = ?, project_id = ?, ");
        sql.append("status_id = ?, user_id = ?, start_date = ?, end_date = ? ");
        sql.append("where id = ?");
        update(sql.toString(), task.getName(), task.getDescriptions(), task.getProject_id(),
                task.getStatus_id(), task.getUser_id(), task.getStart_date(), task.getEnd_date(), task.getId());
    }

    @Override
    public void delete(Long id) {
        String sql = "delete from task where id = ?";
        update(sql, id);
    }

    @Override
    public Task findOne(Long id) {
        String sql = "select * from task where id = ?";
        List<Task> task = query(sql, new TaskMapper(), id);
        return task.isEmpty() ? null : task.get(0);
    }

    @Override
    public List<Task> findAll(String keyword, IPagble pagble) {
        StringBuilder sql = new StringBuilder("select * from task where name like \"%"+keyword+"%\"");
        if (pagble.getSorter()!=null&& StringUtils.isNotBlank(pagble.getSorter().getSortBy())&& StringUtils.isNotBlank(pagble.getSorter().getSortName())) {
            sql.append(" order by "+pagble.getSorter().getSortName()+" "+pagble.getSorter().getSortBy()+"");
        }
        if (pagble.getOffset()!=null&&pagble.getLimit()!=null) {
            sql.append(" limit "+pagble.getOffset()+", "+pagble.getLimit()+"");
        }
        return query(sql.toString(), new TaskMapper());
    }

    @Override
    public int getTotalItem(String keyword) {
        String sql = "select count(*) from task where name like \"%"+keyword+"%\"";
        return count(sql);
    }
}
