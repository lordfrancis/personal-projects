package com.navarro.purrfection.mapper;

import com.navarro.purrfection.model.Appointment;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AppointmentMap implements RowMapper<Appointment> {
    public Appointment mapRow(ResultSet resultSet, int i) throws SQLException {
        Appointment aptmnt = new Appointment();

        aptmnt.setAppointment_id(resultSet.getInt("appointment_id"));
        aptmnt.setDate(resultSet.getDate("date"));
        aptmnt.setTime_slot(resultSet.getString("time_slot"));
        aptmnt.setType(resultSet.getString("type"));
        aptmnt.setStatus(resultSet.getString("status"));
        aptmnt.setOwner_id(resultSet.getString("owner_id"));

        return aptmnt;
    }
}
