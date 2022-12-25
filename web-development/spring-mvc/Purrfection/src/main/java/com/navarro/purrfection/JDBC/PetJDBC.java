package com.navarro.purrfection.JDBC;

import com.navarro.purrfection.mapper.PetMap;
import com.navarro.purrfection.mapper.UserMap;
import com.navarro.purrfection.model.Pet;
import com.navarro.purrfection.model.User;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

public class PetJDBC {

    private DataSource dataSource;
    private JdbcTemplate jdbcObject;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcObject = new JdbcTemplate(dataSource);
    }

    public List<Pet> getPetsFromUser(String id) {
        try {
            List<Pet> users = jdbcObject.query(PetQueries.GET_PETS_FROM_USER, new Object[] {id}, new PetMap());
            return users;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean addPet(Pet pet) {
        try{
            jdbcObject.update(PetQueries.ADD_PETS, pet.getName(), pet.getPet_type(), pet.getBreed(), pet.getOwner_id());
            return true;
        }catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deletePet(int id) {
        try{
            jdbcObject.update(PetQueries.DELETE_PET, id);
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Pet getSinglePet(int id) {
        try{
            return jdbcObject.queryForObject(PetQueries.GET_SINGLE_PET, new Object[] {id}, new PetMap());

        } catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean updatePet( Pet pet ) {
        try{
            jdbcObject.update(PetQueries.UPDATE_PET, pet.getName(), pet.getPet_type(), pet.getBreed(), pet.getId());
            return true;
        } catch( Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
