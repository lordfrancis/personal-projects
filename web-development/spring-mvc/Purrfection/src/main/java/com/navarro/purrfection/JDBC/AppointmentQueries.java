package com.navarro.purrfection.JDBC;

public class AppointmentQueries {
    public static final String GET_ALL_APTMNT = "SELECT * from appointments ORDER BY date DESC";
    public static final String APTMNT_UPDATE_STATUS = "UPDATE appointments set status = ? where appointment_id = ?";
    public static final String ADD_APTMNT = "INSERT INTO appointments (date, time_slot, type,status,owner_id) VALUES (?,?,?,?,?)";
    public static final String GET_OWNER_APTMNT = "SELECT * from appointments where owner_id = ? ORDER BY date DESC";
}
