package com.navarro.purrfection.service;

import com.navarro.purrfection.JDBC.UserJDBC;
import com.navarro.purrfection.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserJDBC userJDBC;

    public List<User> getUsers() { return userJDBC.getUsers(); }
    public boolean addUser(User user) { return userJDBC.addUser(user); }
    public boolean deleteUser(String id) { return userJDBC.deleteUser(id); }
    public User getSingleUser(String id) { return userJDBC.getSingleUser(id); }
    public boolean updateUser( User user ) { return userJDBC.updateUser(user); }
}
