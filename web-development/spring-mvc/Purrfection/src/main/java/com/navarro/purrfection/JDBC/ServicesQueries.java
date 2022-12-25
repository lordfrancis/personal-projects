package com.navarro.purrfection.JDBC;

public class ServicesQueries {
    public static String GET_CONSULTATION_FROM_PET = "SELECT * from consultation where pet_id = ?";
    public static String GET_VACCINATION_FROM_PET = "SELECT * from vaccination where pet_id = ?";
    public static String ADD_VACCINATION = "INSERT INTO vaccination (vacc_date, type, remarks, pet_id) VALUES (?, ?, ?, ?)";
    public static String DELETE_VACCINATION = "DELETE FROM vaccination where vaccination_id = ?";
    public static final String UPDATE_VACCINATION = "UPDATE vaccination set vacc_date = ?, type = ?, remarks = ? where vaccination_id = ?";
    public static final String GET_SINGLE_VACCINATION = "SELECT * from vaccination where vaccination_id = ?";

    public static String ADD_CONSULTATION = "INSERT INTO consultation (consul_date, findings, recommendations, pet_id) VALUES (?, ?, ?, ?)";
    public static String DELETE_CONSULTATION = "DELETE FROM consultation where consultation_id = ?";
    public static final String UPDATE_CONSULTATION = "UPDATE consultation set consul_date = ?, findings = ?, recommendations = ? where consultation_id = ?";
    public static final String GET_SINGLE_CONSULTATION = "SELECT * from consultation where consultation_id = ?";
}
