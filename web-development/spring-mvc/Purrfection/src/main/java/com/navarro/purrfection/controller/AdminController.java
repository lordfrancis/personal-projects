package com.navarro.purrfection.controller;

import com.navarro.purrfection.model.Consultation;
import com.navarro.purrfection.model.Pet;
import com.navarro.purrfection.model.User;
import com.navarro.purrfection.model.Vaccination;
import com.navarro.purrfection.service.AppointmentService;
import com.navarro.purrfection.service.PetService;
import com.navarro.purrfection.service.ServicesService;
import com.navarro.purrfection.service.UserService;
import com.navarro.purrfection.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private PetService petService;
    @Autowired
    private AppointmentService appointmentService;
    @Autowired
    private ServicesService servicesService;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    @RequestMapping(value="/admin/")
    public String home( Model model){
        model.addAttribute("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        return "admin/admin_home";
    }

    @RequestMapping(value="admin/admin_users")
    public ModelAndView users(){
        ModelAndView mav = new ModelAndView("admin/admin_users");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("user", new User());
        mav.addObject("userList", userService.getUsers());
        return mav;
    }

    @RequestMapping(value="admin/admin_saveUser")
    public ModelAndView addUser(@ModelAttribute("user") User user){
        ModelAndView mav = new ModelAndView("admin/admin_users");
        if(userService.addUser(user)) {
            mav.addObject("status", "success");
            mav.addObject("message", "User Successfully Added");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Fail Adding User");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("user", new User());
        mav.addObject("userList", userService.getUsers());
        return mav;
    }

    @RequestMapping(value="admin/admin_deleteUser")
    public ModelAndView deleteUser(@RequestParam("id") String id) {
        ModelAndView mav = new ModelAndView("admin/admin_users");
        if(userService.deleteUser(id)){
            mav.addObject("status", "success");
            mav.addObject("message", "User Successfully Deleted");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Failed Deleting User");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("user", new User());
        mav.addObject("userList", userService.getUsers());
        return mav;
    }

    @RequestMapping(value="admin/admin_updateUser")
    public ModelAndView updateUser(@RequestParam("id") String id) {
        ModelAndView mav = new ModelAndView("admin/admin_updateUser");
        User user = userService.getSingleUser( id);

        if(user != null) {
            mav.addObject("user", user);
        } else {
            mav = new ModelAndView("admin/admin_users");
            mav.addObject("status", "fail");
            mav.addObject("message", "Cannot Update User");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        return mav;
    }

    @RequestMapping(value="admin/admin_processUpdateUser")
    public ModelAndView processUpdate(@ModelAttribute("user") User user ) {
        ModelAndView mav = new ModelAndView("admin/admin_users");
        if (userService.updateUser(user)) {
            mav.addObject("status", "success");
            mav.addObject("message", "User Updated Successfully.");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Cannot Update User");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("user", new User());
        mav.addObject("userList", userService.getUsers());
        return mav;
    }

    @RequestMapping(value = "admin/admin_viewPets")
    public ModelAndView viewPets() {
        ModelAndView mav = new ModelAndView("admin/admin_pets");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("user", new User());
        mav.addObject("userList", userService.getUsers());
        return mav;
    }

    @RequestMapping(value = "admin/admin_viewUserPets")
    public ModelAndView viewUserPets(@RequestParam("id") String id) {
        ModelAndView mav = new ModelAndView("admin/admin_pets_viewUserPets");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("ownerId", id);
        Pet pet = new Pet();
        pet.setOwner_id(id);
        mav.addObject("pet", pet);
        mav.addObject("petList", petService.getPetsFromUser(id));
        return mav;
    }

    @RequestMapping(value="admin/admin_savePet")
    public ModelAndView addPet(@ModelAttribute Pet pet) {
        ModelAndView mav = new ModelAndView("admin/admin_pets_viewUserPets");

        System.out.println(pet.getOwner_id());

        if(petService.addPet(pet)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Pet Successfully Added");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Fail Adding Pet");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("ownerId", pet.getOwner_id());
        Pet petform = new Pet();
        petform.setOwner_id(pet.getOwner_id());
        mav.addObject("pet", petform);
        mav.addObject("petList", petService.getPetsFromUser(pet.getOwner_id()));
        return mav;
    }

    @RequestMapping(value = "admin/admin_deletePet")
    public ModelAndView deletePet(@RequestParam("id") int id, @RequestParam("owner_id") String owner_id) {
        ModelAndView mav = new ModelAndView("admin/admin_pets_viewUserPets");
        if(petService.deletePet(id)){
            mav.addObject("status", "success");
            mav.addObject("message", "Pet Successfully Deleted");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Failed Deleting Pet");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        Pet petform = new Pet();
        petform.setOwner_id(owner_id);
        mav.addObject("ownerId", owner_id);
        mav.addObject("pet", petform);
        mav.addObject("petList", petService.getPetsFromUser(owner_id));
        return mav;
    }

    @RequestMapping(value = "admin/admin_updatePet")
    public ModelAndView updatePet(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("admin/admin_pets_updatePet");
        Pet pet = petService.getSinglePet(id);

        if(pet != null) {
            mav.addObject("pet", pet);
        } else {
            mav = new ModelAndView("admin/admin_pets_viewUserPets");
            mav.addObject("status", "fail");
            mav.addObject("message", "Cannot Update User");
        }

        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        return mav;
    }

    @RequestMapping(value = "admin/admin_processUpdatePet")
    public ModelAndView processUpdatePet(@ModelAttribute("pet") Pet pet) {
        ModelAndView mav = new ModelAndView("admin/admin_pets_viewUserPets");

        System.out.println(pet.getName() + pet.getPet_type() + pet.getBreed() + pet.getOwner_id());
        if (petService.updatePet(pet)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Pet Updated Successfully.");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Cannot Update Pet");
        }
        mav.addObject("ownerId", pet.getOwner_id());
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        Pet petform = new Pet();
        petform.setOwner_id(pet.getOwner_id());
        mav.addObject("pet", petform);
        mav.addObject("petList", petService.getPetsFromUser(pet.getOwner_id()));

        return mav;
    }

    @RequestMapping(value = "admin/admin_appointments")
    public ModelAndView viewAppointments() {
        ModelAndView mav = new ModelAndView("admin/admin_appointments");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("appointmentList", appointmentService.getAppointments());
        return mav;
    }

    @RequestMapping(value = "admin/admin_apmntDone")
    public ModelAndView apmntDone(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("admin/admin_appointments");

        if(appointmentService.markDone(id)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Appointment updated successfully.");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Failed updating appointment.");
        }

        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("appointmentList", appointmentService.getAppointments());
        return mav;
    }

    @RequestMapping(value = "admin/admin_apmntCancel")
    public ModelAndView apmntCancel(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("admin/admin_appointments");

        if(appointmentService.markCancel(id)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Appointment updated successfully.");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Failed updating appointment.");
        }

        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("appointmentList", appointmentService.getAppointments());
        return mav;
    }

    @RequestMapping(value = "admin/admin_petServices")
    public ModelAndView petServices() {
        ModelAndView mav = new ModelAndView("admin/admin_services_users");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("user", new User());
        mav.addObject("userList", userService.getUsers());
        return mav;
    }

    @RequestMapping(value = "admin/admin_servicesViewPets")
    public ModelAndView servicesViewPets(@RequestParam("id") String id) {
        ModelAndView mav = new ModelAndView("admin/admin_services_viewUserPets");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("ownerId", id);
        mav.addObject("petList", petService.getPetsFromUser(id));
        return mav;
    }

    @RequestMapping(value = "admin/admin_viewPetInfo")
    public ModelAndView servicesViewPetInfo(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("admin/admin_services_viewPetInfo");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("consulList", servicesService.getConsultationFromPet(id));
        mav.addObject("vaccList", servicesService.getVaccinationsFromPet(id));
        mav.addObject("pet_id", id);
        return mav;
    }

    @RequestMapping(value = "admin/admin_addVacc")
    public ModelAndView servicesAddVaccination(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("admin/admin_services_addVaccination");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        Vaccination vacc = new Vaccination();
        vacc.setPet_id(id);
        mav.addObject("vaccination", vacc);
        return mav;
    }

    @RequestMapping(value = "admin/admin_processAddVaccination")
    public ModelAndView servicesProcessAddVaccination(@ModelAttribute("vaccination") Vaccination vaccination) {
        ModelAndView mav = new ModelAndView("admin/admin_services_viewPetInfo");
        if(servicesService.addVaccination(vaccination)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Vaccine information successfully Added");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Fail Adding Vaccine");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        int id = vaccination.getPet_id();
        mav.addObject("consulList", servicesService.getConsultationFromPet(id));
        mav.addObject("vaccList", servicesService.getVaccinationsFromPet(id));
        mav.addObject("pet_id", id);
        return mav;
    }

    @RequestMapping("admin/admin_deleteVacc")
    public ModelAndView deleteVacc(@RequestParam("vaccId") int vaccId, @RequestParam("pet_id") int pet_id) {
        ModelAndView mav = new ModelAndView("admin/admin_services_viewPetInfo");
        if(servicesService.deleteVaccination(vaccId)){
            mav.addObject("status", "success");
            mav.addObject("message", "Vaccination Details Successfully Deleted");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Failed Deleting Vaccination Details");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("consulList", servicesService.getConsultationFromPet(pet_id));
        mav.addObject("vaccList", servicesService.getVaccinationsFromPet(pet_id));
        mav.addObject("pet_id", pet_id);
        return mav;
    }

    @RequestMapping("admin/admin_updateVacc")
    public ModelAndView updateVaccView(@RequestParam("vaccId") int vaccId) {
        ModelAndView mav = new ModelAndView("admin/admin_services_updateVaccination");

        Vaccination vacc = servicesService.getSingleVaccination(vaccId);

        if(vacc != null) {
            mav.addObject("vaccination", vacc);
        } else {
            mav = new ModelAndView("admin/admin_services_viewPetInfo");
            mav.addObject("status", "fail");
            mav.addObject("message", "Cannot Update User");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));

        return mav;
    }

    @RequestMapping(value = "admin/admin_processUpdateVaccination")
    public ModelAndView processUpdateVaccination(@ModelAttribute("vaccination") Vaccination vaccination) {
        ModelAndView mav = new ModelAndView("admin/admin_services_viewPetInfo");

        if (servicesService.updateVaccination(vaccination)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Vaccination information updated successfully.");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Error updated vaccination information");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("consulList", servicesService.getConsultationFromPet(vaccination.getPet_id()));
        mav.addObject("vaccList", servicesService.getVaccinationsFromPet(vaccination.getPet_id()));
        mav.addObject("pet_id", vaccination.getPet_id());

        return mav;
    }

    @RequestMapping(value = "admin/admin_addConsul")
    public ModelAndView servicesAddConsultation(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("admin/admin_services_addConsultation");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        Consultation consul = new Consultation();
        consul.setPet_id(id);
        mav.addObject("consultation", consul);
        return mav;
    }

    @RequestMapping(value = "admin/admin_processAddConsultation")
    public ModelAndView servicesProcessAddConsultation(@ModelAttribute("consultation") Consultation consultation) {
        ModelAndView mav = new ModelAndView("admin/admin_services_viewPetInfo");
        if(servicesService.addConsultation(consultation)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Consultation information successfully Added");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Fail Adding Consultation");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        int id = consultation.getPet_id();
        mav.addObject("consulList", servicesService.getConsultationFromPet(id));
        mav.addObject("vaccList", servicesService.getVaccinationsFromPet(id));
        mav.addObject("pet_id", id);
        return mav;
    }

    @RequestMapping("admin/admin_updateConsul")
    public ModelAndView updateConsulView(@RequestParam("consulId") int consulId) {
        ModelAndView mav = new ModelAndView("admin/admin_services_updateConsultation");

        Consultation consul  = servicesService.getSingleConsultation(consulId);

        if( consul != null) {
            mav.addObject("consultation", consul);
        } else {
            mav = new ModelAndView("admin/admin_services_viewPetInfo");
            mav.addObject("status", "fail");
            mav.addObject("message", "Cannot Update Consultation");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));

        return mav;
    }

    @RequestMapping(value = "admin/admin_processUpdateConsultation")
    public ModelAndView processUpdateConsultation(@ModelAttribute("consultation") Consultation consultation) {
        ModelAndView mav = new ModelAndView("admin/admin_services_viewPetInfo");

        if (servicesService.updateConsultation(consultation)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Consultation information updated successfully.");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Error updating consultation information");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("consulList", servicesService.getConsultationFromPet(consultation.getPet_id()));
        mav.addObject("vaccList", servicesService.getVaccinationsFromPet(consultation.getPet_id()));
        mav.addObject("pet_id", consultation.getPet_id());

        return mav;
    }

    @RequestMapping("admin/admin_deleteConsul")
    public ModelAndView deleteConsul(@RequestParam("consulId") int consulId, @RequestParam("pet_id") int pet_id) {
        ModelAndView mav = new ModelAndView("admin/admin_services_viewPetInfo");
        if(servicesService.deleteConsultation(consulId)){
            mav.addObject("status", "success");
            mav.addObject("message", "Consultation Details Successfully Deleted");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Failed Deleting Consultation Details");
        }
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("consulList", servicesService.getConsultationFromPet(pet_id));
        mav.addObject("vaccList", servicesService.getVaccinationsFromPet(pet_id));
        mav.addObject("pet_id", pet_id);
        return mav;
    }

}
