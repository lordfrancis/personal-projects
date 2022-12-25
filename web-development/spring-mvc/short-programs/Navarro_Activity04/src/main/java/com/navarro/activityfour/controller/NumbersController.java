package com.navarro.activityfour.controller;

import com.navarro.activityfour.util.Utility;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NumbersController {
    @RequestMapping(value = {"", "input"}, method = RequestMethod.GET)
    public ModelAndView input() {
        ModelAndView mav = new ModelAndView("input");
        mav.addObject("util", new Utility());
        return mav;
    }

    @RequestMapping( value="processNumber", method = RequestMethod.POST)
    public ModelAndView processNumber(@ModelAttribute("util") Utility util) {
        ModelAndView mav = new ModelAndView("input");
        String choice = util.getChoice();

        if( choice.equals("display") ) {
            mav = new ModelAndView("display");
        } else if( choice.equals("display_prime") ) {
            mav = new ModelAndView("display_prime");
        } else if( choice.equals("display_odd_even")) {
            mav = new ModelAndView("display_odd_even");
        } else if( choice.equals("lcq") ) {
            int lcq = util.getLcq();
            mav.addObject("lcq", lcq);
        } else {
            int gcq = util.getGcq();
            mav.addObject("gcq", gcq );
        }
        mav.addObject("numbers", util.getNumbers());
        return mav;
    }
}
