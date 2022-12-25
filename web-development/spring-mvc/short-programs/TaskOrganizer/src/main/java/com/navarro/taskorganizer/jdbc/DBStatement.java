package com.navarro.taskorganizer.jdbc;

public class DBStatement {
    public static final String GET_TASKS = "SELECT * from task";
    public static final String ADD_TASK = "INSERT into task (title, description, due_date, remarks, status) VALUES (?, ?, ?, ?, ?)";
    public static final String GET_SINGLE_TASK = "SELECT * from task where id=?";
    public static final String UPDATE_TASK = "UPDATE task set title = ?, description = ?, due_date = ?, remarks = ?, status = ? WHERE id = ?";
    public static final String DELETE_TASK = "DELETE from task WHERE id = ?";
}
