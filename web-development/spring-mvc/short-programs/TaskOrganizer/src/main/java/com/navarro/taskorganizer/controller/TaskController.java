package com.navarro.taskorganizer.controller;

import com.navarro.taskorganizer.model.Task;
import com.navarro.taskorganizer.service.TaskService;
import com.navarro.taskorganizer.utils.TaskUtil;
import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class TaskController {

    @Autowired
    private TaskService service;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    @RequestMapping(value = {"/", "home"} )
    public ModelAndView home(){
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("tasks", service.getTasks());
        return mav;
    }

    @RequestMapping(value="addtask")
    public ModelAndView addTask(){
       ModelAndView mav = new ModelAndView("add_task");
       mav.addObject("task", new Task());
       mav.addObject("status", TaskUtil.getStatus());
       return mav;
    }

    @RequestMapping(value="saveTask")
    public ModelAndView output(@ModelAttribute("task") Task task ) {
        ModelAndView mav = new ModelAndView( "output");
        if(service.addTask(task)) {
            mav.addObject("message", "Task added successfully");
        } else {
            mav.addObject("message", "Error adding task");
        }
        return mav;
    }

    @RequestMapping(value="updateTaskView")
    public ModelAndView updateView(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("update_task");
        Task task = service.getSingleTask(id);

        if(task != null ) {
            mav.addObject("task", task);
        } else {
            mav.addObject("message", "not found");
        }
        return mav;
    }

    @RequestMapping(value="updateTask")
    public ModelAndView updateProcess(@ModelAttribute("task") Task task) {
        ModelAndView mav = new ModelAndView("output");
        if(service.updateTask(task)){
            mav.addObject("message", "Task updated successfully");
        } else {
            mav.addObject("message", "Error updating task");
        }
        return mav;
    }

    @RequestMapping(value = "deleteTask")
    public ModelAndView delete(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("index");
        if(service.deletetask(id)){
            mav.addObject("message", "Task Successfully deleted");
        } else {
            mav.addObject("message", "Delete unsuccessful");
        }
        mav.addObject("tasks", service.getTasks());
        return mav;
    }

}
