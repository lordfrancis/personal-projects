package com.navarro.purrfection.mapper;

import com.navarro.purrfection.model.Pet;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PetMap implements RowMapper<Pet> {
    public Pet mapRow(ResultSet resultSet, int i) throws SQLException {
        Pet pet = new Pet();
        pet.setId(resultSet.getInt("pet_id"));
        pet.setName(resultSet.getString("name"));
        pet.setPet_type(resultSet.getString("pet_type"));
        pet.setBreed(resultSet.getString("breed"));
        pet.setOwner_id(resultSet.getString("owner_id"));
        return pet;
    }
}
