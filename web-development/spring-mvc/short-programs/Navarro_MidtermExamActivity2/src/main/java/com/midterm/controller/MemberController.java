package com.midterm.controller;

import com.midterm.model.Member;
import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
    @RequestMapping(value = {"/", "/input"})
    public ModelAndView input() {
        ModelAndView mav = new ModelAndView("input");
        mav.addObject("member", new Member());
        return mav;
    }

    @RequestMapping(value="memberInput", method = RequestMethod.POST)
    public ModelAndView processInput(@ModelAttribute("member") Member member) {
        ModelAndView mav = new ModelAndView("output");
        mav.addObject("member", member);
        return mav;
    }
}
