package com.navarro.purrfection.JDBC;

import com.navarro.purrfection.mapper.AppointmentMap;
import com.navarro.purrfection.mapper.PetMap;
import com.navarro.purrfection.model.Appointment;
import com.navarro.purrfection.model.Pet;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

public class AppointmentJDBC {

    private DataSource dataSource;
    private JdbcTemplate jdbcObject;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcObject = new JdbcTemplate(dataSource);
    }

    public List<Appointment> getAppointments() {
        try {
            List<Appointment> appointments = jdbcObject.query(AppointmentQueries.GET_ALL_APTMNT, new AppointmentMap());
            return appointments;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean markDone(int id) {
        try {
            jdbcObject.update(AppointmentQueries.APTMNT_UPDATE_STATUS, "done", id);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean markCancel( int id ) {
        try{
            jdbcObject.update(AppointmentQueries.APTMNT_UPDATE_STATUS, "cancelled", id);
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean addAppointment(Appointment appointment) {
        try{
            jdbcObject.update(AppointmentQueries.ADD_APTMNT, appointment.getDate(), appointment.getTime_slot(), appointment.getType(), appointment.getStatus(), appointment.getOwner_id());
            return true;
        }catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List<Appointment> getAppointmentsFromUser(String id) {
        try {
            List<Appointment> appointments = jdbcObject.query(AppointmentQueries.GET_OWNER_APTMNT, new Object[] {id}, new AppointmentMap());
            return appointments;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }


}
