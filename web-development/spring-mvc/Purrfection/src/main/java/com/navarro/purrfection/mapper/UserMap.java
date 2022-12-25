package com.navarro.purrfection.mapper;

import com.navarro.purrfection.model.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMap implements RowMapper<User> {

    public User mapRow(ResultSet resultSet, int i) throws SQLException {
        User user = new User();

        user.setId(resultSet.getString("id"));
        user.setPassword(resultSet.getString("password"));
        user.setAccess_level(resultSet.getString("access_level"));
        user.setFname(resultSet.getString("fname"));
        user.setMname(resultSet.getString("mname"));
        user.setLname(resultSet.getString("lname"));
        user.setEnabled(resultSet.getInt("enabled"));
        user.setEmail(resultSet.getString("email"));
        user.setCnum(resultSet.getString("cnum"));
        return user;
    }
}
