package com.navarro.taskorganizer.jdbc;

import com.navarro.taskorganizer.mapper.TaskMapper;
import com.navarro.taskorganizer.model.Task;
import com.navarro.taskorganizer.utils.TaskUtil;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

public class TaskJDBC {
    @SuppressWarnings("unused")
    private DataSource dataSource;
    private JdbcTemplate jdbcObject;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcObject = new JdbcTemplate(dataSource);
    }

    public List<Task> getTasks(){
        try {
            List<Task> tasks = jdbcObject.query(DBStatement.GET_TASKS, new TaskMapper());
            return tasks;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    public boolean addTask(Task task) {
        try{
            jdbcObject.update(DBStatement.ADD_TASK, task.getTitle(), task.getDescription(), task.getDue_date(), task.getRemarks(), task.getStatus());
            return true;
        }catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    public Task getTask(int id){
        try{
            return jdbcObject.queryForObject(DBStatement.GET_SINGLE_TASK, new Object[] {id}, new TaskMapper());
        } catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    public boolean updateTask(Task task){
        try{
            jdbcObject.update(DBStatement.UPDATE_TASK, task.getTitle(), task.getDescription(), task.getDue_date(),task.getRemarks(), task.getStatus(), task.getId());
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteTask(int id) {
        try{
            jdbcObject.update(DBStatement.DELETE_TASK, id);
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
