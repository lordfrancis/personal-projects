package com.spring.demo;

import com.spring.model.CustomNumberConverter;
import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DemoController {

    // Main Page.
    @RequestMapping(value = {"/", "/converter" })
    public String home(){
        return "converter";
    }

    // The main converter controller.
    @RequestMapping(value ="/convertNumber", method = RequestMethod.POST)
    public ModelAndView convertNumber(@RequestParam("numFrom") final String numFrom, @RequestParam("numTo") final String numTo, @RequestParam("numFromValue") final String numFromValue, Model model) {
       ModelAndView numConverterMav = new ModelAndView("convertResult");
       CustomNumberConverter converter = new CustomNumberConverter( numFrom, numTo, numFromValue );
       String result = "";

       switch( numTo ) {
           case "decimal":
               result = converter.convertToDecimal();
               break;
           case "binary":
               result = converter.convertToBinary();
               break;
           case "octal":
               result = converter.convertToOctal();
               break;
           case "hexadecimal":
               result = converter.convertToHexadecimal();
               break;
           default:
               break;
        }

        numConverterMav.addObject("convertDetails", converter);
        numConverterMav.addObject("result", result);
        return numConverterMav;
    }



}
