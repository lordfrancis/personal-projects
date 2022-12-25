package com.navarro.purrfection.service;

import com.navarro.purrfection.JDBC.AppointmentJDBC;
import com.navarro.purrfection.model.Appointment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppointmentService {

    @Autowired
    private AppointmentJDBC appointmentJDBC;

    public List<Appointment> getAppointments(){ return appointmentJDBC.getAppointments(); }
    public boolean markDone(int id) { return appointmentJDBC.markDone(id); }
    public boolean markCancel(int id ) {return appointmentJDBC.markCancel(id); }
    public boolean addAppointment(Appointment appointment) { return appointmentJDBC.addAppointment(appointment); }
    public List<Appointment> getAppointmentsFromUser(String id) { return appointmentJDBC.getAppointmentsFromUser(id); }
}
