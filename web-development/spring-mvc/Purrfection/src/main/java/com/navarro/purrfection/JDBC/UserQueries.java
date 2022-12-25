package com.navarro.purrfection.JDBC;

public class UserQueries {
    public static final String GET_USERS = "SELECT * from user";
    public static final String ADD_USERS = "INSERT into user ( id, password, access_level, fname, mname, lname, email, cnum ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
    public static final String DELETE_USER = "DELETE from user where id = ?";
    public static final String GET_SINGLE_USER = "SELECT * from user where id = ?";
    public static final String UPDATE_USER = "UPDATE user set access_level = ?, fname = ?, mname = ?, lname = ?, email = ?, cnum = ? where id = ?";


}
