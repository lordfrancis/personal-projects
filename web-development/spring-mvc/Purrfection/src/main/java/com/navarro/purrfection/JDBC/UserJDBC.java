package com.navarro.purrfection.JDBC;

import com.navarro.purrfection.controller.UserController;
import com.navarro.purrfection.mapper.UserMap;
import com.navarro.purrfection.model.User;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

public class UserJDBC {

    private DataSource dataSource;
    private JdbcTemplate jdbcObject;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcObject = new JdbcTemplate(dataSource);
    }

    public List<User> getUsers() {
        try {
            List<User> users = jdbcObject.query(UserQueries.GET_USERS, new UserMap());
            return users;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean addUser(User user) {
        try{
            jdbcObject.update(UserQueries.ADD_USERS, user.getId(), user.getPassword(), user.getAccess_level(), user.getFname(), user.getMname(), user.getLname(), user.getEmail(), user.getCnum());
            return true;
        }catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteUser(String id) {
        try{
            jdbcObject.update(UserQueries.DELETE_USER, id);
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public User getSingleUser(String id) {
        try{
            return jdbcObject.queryForObject(UserQueries.GET_SINGLE_USER, new Object[] {id}, new UserMap());

        } catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean updateUser( User user ) {
        try{
            jdbcObject.update(UserQueries.UPDATE_USER, user.getAccess_level(), user.getFname(), user.getMname(), user.getLname(), user.getEmail(), user.getCnum(), user.getId());
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
