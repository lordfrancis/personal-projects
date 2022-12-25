package com.navarro.purrfection.JDBC;

import com.navarro.purrfection.mapper.ConsultationMap;
import com.navarro.purrfection.mapper.PetMap;
import com.navarro.purrfection.mapper.UserMap;
import com.navarro.purrfection.mapper.VaccinationMap;
import com.navarro.purrfection.model.Consultation;
import com.navarro.purrfection.model.Pet;
import com.navarro.purrfection.model.User;
import com.navarro.purrfection.model.Vaccination;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

public class ServicesJDBC {
    private DataSource dataSource;
    private JdbcTemplate jdbcObject;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcObject = new JdbcTemplate(dataSource);
    }

    public List<Vaccination> getVaccinationsFromPet(int id) {
        try {
            List<Vaccination> vaccs = jdbcObject.query(ServicesQueries.GET_VACCINATION_FROM_PET, new Object[] {id}, new VaccinationMap());
            return vaccs;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public List<Consultation> getConsultationFromPet(int id) {
        try {
            List<Consultation> conns = jdbcObject.query(ServicesQueries.GET_CONSULTATION_FROM_PET, new Object[] {id}, new ConsultationMap());
            return conns;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean addConsultation(Consultation consultation) {
        try{
            jdbcObject.update(ServicesQueries.ADD_CONSULTATION, consultation.getConsul_date(), consultation.getFindings(), consultation.getRecommendations(), consultation.getPet_id());
            return true;
        }catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteConsultation(int id) {
        try{
            jdbcObject.update(ServicesQueries.DELETE_CONSULTATION, id);
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean updateConsultation( Consultation consultation ) {
        try{
            jdbcObject.update(ServicesQueries.UPDATE_CONSULTATION, consultation.getConsul_date(), consultation.getFindings(), consultation.getRecommendations(), consultation.getConsultation_id());
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Consultation getSingleConsultation(int id) {
        try{
            return jdbcObject.queryForObject(ServicesQueries.GET_SINGLE_CONSULTATION, new Object[] {id}, new ConsultationMap());

        } catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean addVaccination(Vaccination vaccination) {
        try{
            jdbcObject.update(ServicesQueries.ADD_VACCINATION, vaccination.getVacc_date(), vaccination.getType(), vaccination.getRemarks(), vaccination.getPet_id());
            return true;
        }catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteVaccination(int id) {
        try{
            jdbcObject.update(ServicesQueries.DELETE_VACCINATION, id);
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean updateVaccination( Vaccination vaccination ) {
        try{
            jdbcObject.update(ServicesQueries.UPDATE_VACCINATION, vaccination.getVacc_date(), vaccination.getType(), vaccination.getRemarks(), vaccination.getVaccination_id());
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Vaccination getSingleVaccination(int id) {
        try{
            return jdbcObject.queryForObject(ServicesQueries.GET_SINGLE_VACCINATION, new Object[] {id}, new VaccinationMap());

        } catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }



}
