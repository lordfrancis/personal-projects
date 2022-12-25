package com.navarro.purrfection.model;

import java.util.Date;

public class Consultation {
    private int consultation_id;
    private Date consul_date;
    private String findings;
    private String recommendations;
    private int pet_id;

    public int getConsultation_id() {
        return consultation_id;
    }

    public void setConsultation_id(int consultation_id) {
        this.consultation_id = consultation_id;
    }

    public Date getConsul_date() {
        return consul_date;
    }

    public void setConsul_date(Date consul_date) {
        this.consul_date = consul_date;
    }

    public String getFindings() {
        return findings;
    }

    public void setFindings(String findings) {
        this.findings = findings;
    }

    public String getRecommendations() {
        return recommendations;
    }

    public void setRecommendations(String recommendations) {
        this.recommendations = recommendations;
    }

    public int getPet_id() {
        return pet_id;
    }

    public void setPet_id(int pet_id) {
        this.pet_id = pet_id;
    }
}
