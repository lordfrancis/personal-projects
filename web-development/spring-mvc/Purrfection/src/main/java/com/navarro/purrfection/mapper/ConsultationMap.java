package com.navarro.purrfection.mapper;

import com.navarro.purrfection.model.Consultation;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsultationMap implements RowMapper<Consultation> {
    public Consultation mapRow(ResultSet resultSet, int i) throws SQLException {
        Consultation consultation = new Consultation();

        consultation.setConsultation_id(resultSet.getInt("consultation_id"));
        consultation.setConsul_date(resultSet.getDate("consul_date"));
        consultation.setFindings(resultSet.getString("findings"));
        consultation.setRecommendations(resultSet.getString("recommendations"));
        consultation.setPet_id(resultSet.getInt("pet_id"));

        return consultation;
    }
}
