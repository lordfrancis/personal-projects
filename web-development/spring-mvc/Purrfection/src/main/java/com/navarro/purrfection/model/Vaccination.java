package com.navarro.purrfection.model;

import java.util.Date;

public class Vaccination {
    private int vaccination_id;
    private Date vacc_date;
    private String type;
    private String remarks;
    private int pet_id;

    public int getVaccination_id() {
        return vaccination_id;
    }

    public void setVaccination_id(int vaccination_id) {
        this.vaccination_id = vaccination_id;
    }

    public Date getVacc_date() {
        return vacc_date;
    }

    public void setVacc_date(Date vacc_date) {
        this.vacc_date = vacc_date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public int getPet_id() {
        return pet_id;
    }

    public void setPet_id(int pet_id) {
        this.pet_id = pet_id;
    }
}
