package com.navarro.purrfection.service;

import com.navarro.purrfection.JDBC.PetJDBC;
import com.navarro.purrfection.model.Pet;
import com.navarro.purrfection.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PetService {

    @Autowired
    private PetJDBC petJDBC;

    public List<Pet> getPetsFromUser(String id ) { return petJDBC.getPetsFromUser(id); }
    public boolean addPet( Pet pet ) { return petJDBC.addPet(pet); }
    public boolean deletePet( int id ) { return petJDBC.deletePet(id); }

    public Pet getSinglePet(int id) { return petJDBC.getSinglePet(id); }

    public boolean updatePet( Pet pet ) { return petJDBC.updatePet(pet); }
}