package com.deo.meater.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class GreetingsController {
    @GetMapping("/greeting")
    public String greeting(@RequestParam(name="name", required=false, defaultValue="Bridgeboy") String name, Map<String, Object> model) {
        model.put("name", name);
        return "greeting";
    }


    @GetMapping()
      public String main(Map<String, Object> model)  {

        model.put("some","Hello Deo");
        return "main";
    }

}
