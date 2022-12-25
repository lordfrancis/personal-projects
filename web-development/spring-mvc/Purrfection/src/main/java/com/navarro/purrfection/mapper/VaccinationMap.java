package com.navarro.purrfection.mapper;

import com.navarro.purrfection.model.Vaccination;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class VaccinationMap implements RowMapper<Vaccination> {
    public Vaccination mapRow(ResultSet resultSet, int i) throws SQLException {
        Vaccination vaccination = new Vaccination();

        vaccination.setVaccination_id(resultSet.getInt("vaccination_id"));
        vaccination.setVacc_date(resultSet.getDate("vacc_date"));
        vaccination.setType(resultSet.getString("type"));
        vaccination.setRemarks(resultSet.getString("remarks"));
        vaccination.setPet_id(resultSet.getInt("pet_id"));

        return vaccination;
    }
}
