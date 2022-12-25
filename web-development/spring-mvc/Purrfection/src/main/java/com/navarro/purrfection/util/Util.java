package com.navarro.purrfection.util;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

public class Util {
    public static String getLoggedUserName(){
        String userId ="";

        try {
            userId = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        } catch (Exception e) {
            userId = ((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        }

        return userId;
    }

}
