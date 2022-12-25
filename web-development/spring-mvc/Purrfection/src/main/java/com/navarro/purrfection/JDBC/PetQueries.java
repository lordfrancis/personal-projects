package com.navarro.purrfection.JDBC;

public class PetQueries {
    public static final String GET_PETS = "SELECT * from pets";
    public static final String GET_PETS_FROM_USER = "SELECT * from pets where owner_id = ?";
    public static final String ADD_PETS = "INSERT INTO pets (name, pet_type, breed, owner_id) VALUES (?, ?, ?, ?)";
    public static final String DELETE_PET = "DELETE from pets where pet_id = ?";
    public static final String UPDATE_PET = "UPDATE pets set name = ?, pet_type = ?, breed = ? where pet_id = ?";

    public static final String GET_SINGLE_PET = "SELECT * from pets where pet_id = ?";
}
