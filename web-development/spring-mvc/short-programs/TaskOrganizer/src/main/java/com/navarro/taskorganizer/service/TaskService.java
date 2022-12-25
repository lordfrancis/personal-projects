package com.navarro.taskorganizer.service;

import com.navarro.taskorganizer.jdbc.TaskJDBC;
import com.navarro.taskorganizer.model.Task;
import com.navarro.taskorganizer.utils.TaskUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TaskService {

    @Autowired
    private TaskJDBC taskJDBC;

    public List<Task> getTasks() { return taskJDBC.getTasks(); }

    public boolean addTask(Task task) {

        if(TaskUtil.isDelayed(task.getDue_date())){
            String remarks = task.getRemarks();
            remarks = remarks + "Delayed";
            task.setRemarks(remarks);
        }

        System.out.println(task.getRemarks());

        return taskJDBC.addTask(task);
    }
    public Task getSingleTask(int id) { return taskJDBC.getTask(id); }
    public boolean updateTask(Task task ) {

        if(TaskUtil.isDelayed(task.getDue_date())){
            String remarks = task.getRemarks();
            remarks = remarks + "Delayed";
            task.setRemarks(remarks);
        }
        return taskJDBC.updateTask(task);
    }
    public boolean deletetask(int id) { return taskJDBC.deleteTask(id); }

}
