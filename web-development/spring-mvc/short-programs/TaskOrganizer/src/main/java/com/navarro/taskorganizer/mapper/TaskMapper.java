package com.navarro.taskorganizer.mapper;

import com.navarro.taskorganizer.model.Task;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TaskMapper implements RowMapper<Task> {

    public Task mapRow(ResultSet resultSet, int rowNum) throws SQLException {
        Task task = new Task();
        task.setId(resultSet.getInt("id"));
        task.setTitle(resultSet.getString("title"));
        task.setDescription(resultSet.getString("description"));
        task.setDue_date(resultSet.getDate("due_date"));
        task.setStatus(resultSet.getString("status"));
        task.setRemarks(resultSet.getString("remarks"));
        return task;
    }
}
