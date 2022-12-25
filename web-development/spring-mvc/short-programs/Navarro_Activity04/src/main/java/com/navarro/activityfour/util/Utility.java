package com.navarro.activityfour.util;

import java.util.ArrayList;
import java.util.List;

public class Utility {
    private int num1;
    private int num2;
    private String choice;

    public int getNum1() {
        return num1;
    }

    public void setNum1(int num1) {
        this.num1 = num1;
    }

    public int getNum2() {
        return num2;
    }

    public void setNum2(int num2) {
        this.num2 = num2;
    }

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

   public List<String> getNumbers(){
        int min = this.num1;
        int max = this.num2;
        int i;
        List<String> res = new ArrayList<String>();

        for( i = min; i <= max; i++ ) {
            res.add(String.valueOf(i));
        }
        return res;
   }

   public int getGcq(){
        int gcq=0;

        return gcq;
   }

   public int getLcq(){
        int lcq = 0;
        return lcq;
   }

   public boolean checkIfPrime(int num) {
        boolean flag = true;

       for (int i = 2; i <= num / 2; ++i) {
           if (num % i == 0) {
               flag = false;
               break;
           }
       }
       return flag;
   }

   public boolean checkIfOdd(int num) {
        if(num % 2 == 0 ) {
            return false;
        }
        return true;
   }
}
