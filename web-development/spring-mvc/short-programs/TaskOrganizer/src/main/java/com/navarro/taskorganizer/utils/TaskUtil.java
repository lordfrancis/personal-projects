package com.navarro.taskorganizer.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TaskUtil {
    public static List<String> getStatus(){
        List<String> status = new ArrayList<String>();
        status.add("Pending");
        status.add("In-Progress");
        status.add("Done");
        status.add("Rejected");
        return status;
    }

    public static boolean isDelayed(Date date) {
        Date today = new Date();
        System.out.println(date.compareTo(today));
        if(date.compareTo(today) < 0) {
            return true;
        }
        return false;
    }
}
