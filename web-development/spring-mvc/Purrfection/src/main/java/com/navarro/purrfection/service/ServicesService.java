package com.navarro.purrfection.service;

import com.navarro.purrfection.JDBC.ServicesJDBC;
import com.navarro.purrfection.model.Consultation;
import com.navarro.purrfection.model.Vaccination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServicesService {
    @Autowired
    private ServicesJDBC servicesJDBC;

    public List<Vaccination> getVaccinationsFromPet(int id) { return servicesJDBC.getVaccinationsFromPet(id); }
    public List<Consultation> getConsultationFromPet(int id) { return servicesJDBC.getConsultationFromPet(id); }
    public boolean addVaccination(Vaccination vaccination) { return servicesJDBC.addVaccination(vaccination); }
    public boolean deleteVaccination(int id) { return servicesJDBC.deleteVaccination(id); }
    public boolean updateVaccination( Vaccination vaccination ) { return servicesJDBC.updateVaccination(vaccination); }
    public Vaccination getSingleVaccination(int id) { return servicesJDBC.getSingleVaccination(id); }

    public boolean addConsultation(Consultation consultation) { return servicesJDBC.addConsultation(consultation);}
    public boolean deleteConsultation(int id) {return servicesJDBC.deleteConsultation(id); }
    public boolean updateConsultation( Consultation consultation ) { return servicesJDBC.updateConsultation(consultation); }
    public Consultation getSingleConsultation(int id) { return servicesJDBC.getSingleConsultation(id); }
}
