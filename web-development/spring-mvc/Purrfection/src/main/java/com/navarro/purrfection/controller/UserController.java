package com.navarro.purrfection.controller;

import com.navarro.purrfection.model.Appointment;
import com.navarro.purrfection.model.Pet;
import com.navarro.purrfection.model.User;
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
import org.springframework.web.context.support.ContextExposingHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {

    private Util utils;
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

    @RequestMapping(value = "/")
    public String home() {
        return "home";
    }

    @RequestMapping(value = "login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "user/home")
    public String userHome() {
        return "user/user_home";
    }

    @RequestMapping(value="user/accessDenied")
    public String error(){ return "404"; }

    @RequestMapping(value = "/default/")
    public String user_home(HttpServletRequest request){
        if(request.isUserInRole("ROLE_ADMIN")) {
            return "admin/admin_home";
        }
        return "user/user_home";
    }

    @RequestMapping(value = "register")
    public ModelAndView registration(){
        ModelAndView mav = new ModelAndView("register");
        User user = new User();
        user.setAccess_level("ROLE_USER");
        mav.addObject("user", user);

        return mav;
    }

    @RequestMapping(value = "saveUser")
    public ModelAndView saveUser(@ModelAttribute("user") User user){
        ModelAndView mav = new ModelAndView("login");

        if(userService.addUser(user)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Registration Successfull");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Registration failed.");
        }

        return mav;
    }

    @RequestMapping("loginError")
    public ModelAndView loginError(){
        ModelAndView mav = new ModelAndView("login");
        mav.addObject("status", "fail");
        mav.addObject("message", "Invalid Credentials.");
        return mav;
    }


    @RequestMapping(value = "user/user_myPets")
    public ModelAndView myPets(){
        ModelAndView mav = new ModelAndView("user/user_myPets");
        User user = new User();
        user = userService.getSingleUser(Util.getLoggedUserName());
        mav.addObject("userInfo", user);
        mav.addObject("ownerId", user.getId());
        mav.addObject("petList", petService.getPetsFromUser(user.getId()));
        return mav;
    }

    @RequestMapping("user/user_viewPetInfo")
    public ModelAndView viewPetInfo(@RequestParam("id") int pet_id) {
        ModelAndView mav = new ModelAndView("user/user_viewPetInfo");
        mav.addObject("userInfo", userService.getSingleUser(Util.getLoggedUserName()));
        mav.addObject("consulList", servicesService.getConsultationFromPet(pet_id));
        mav.addObject("vaccList", servicesService.getVaccinationsFromPet(pet_id));
        Pet pet = petService.getSinglePet(pet_id);
        mav.addObject("pet", pet);
        return mav;
    }

    @RequestMapping(value = "user/user_bookAppointment")
    public ModelAndView bookAppointment(){
        ModelAndView mav = new ModelAndView("user/user_bookAppointment");
        User user;
        user = userService.getSingleUser(Util.getLoggedUserName());
        Appointment appointment = new Appointment();
        appointment.setOwner_id(user.getId());
        appointment.setStatus("pending");
        mav.addObject("appointment", appointment);
        return mav;
    }

    @RequestMapping(value = "user/user_processAddAppointment")
    public ModelAndView processBookAppointment(@ModelAttribute("appointment") Appointment appointment){
        ModelAndView mav = new ModelAndView("user/user_myAppointments");

        if (appointmentService.addAppointment(appointment)) {
            mav.addObject("status", "success");
            mav.addObject("message", "Appointment booked successfully.");
        } else {
            mav.addObject("status", "fail");
            mav.addObject("message", "Error booking appointment");
        }

        User user = new User();
        user = userService.getSingleUser(Util.getLoggedUserName());
        mav.addObject("userInfo", user);
        mav.addObject("ownerId", user.getId());
        mav.addObject("appointmentList", appointmentService.getAppointmentsFromUser(user.getId()));
        
        return mav;
    }
    @RequestMapping(value = "user/user_myAppointments")
    public ModelAndView viewAppointments(){
        ModelAndView mav = new ModelAndView("user/user_myAppointments");

        User user = new User();
        user = userService.getSingleUser(Util.getLoggedUserName());
        mav.addObject("userInfo", user);
        mav.addObject("ownerId", user.getId());
        mav.addObject("appointmentList", appointmentService.getAppointmentsFromUser(user.getId()));
        return mav;

    }
}