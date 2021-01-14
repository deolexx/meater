package com.deo.meater.controller;

import com.deo.meater.controller.repos.MessageRepository;
import com.deo.meater.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class GreetingsController {

    @Autowired
   private MessageRepository messageRepository;





    @GetMapping("/greeting")
    public String greeting(@RequestParam(name="name", required=false, defaultValue="Bridgeboy") String name, Map<String, Object> model) {
        model.put("name", name);
        return "greeting";
    }


    @GetMapping()
      public String main(Map<String, Object> model)  {

        Iterable<Message> messages = messageRepository.findAll();

        model.put("messages",messages);

        return "main";
    }

    @PostMapping()
    public String add(@RequestParam String text,@RequestParam String tag,  Map<String, Object> model){

        Message message = new Message(text,tag);
        messageRepository.save(message);

        Iterable<Message> messages = messageRepository.findAll();

        model.put("messages",messages);

        return "main";
    }


    @PostMapping("filter")
    public String filter(@RequestParam String filter,  Map<String, Object> model){

        Iterable<Message> messages;
        if(filter !=null &&!filter.isEmpty()) {
            messages = messageRepository.findByTag(filter);
        }else {messages = messageRepository.findAll();}

        model.put("messages",messages);
        return "main";
    }

}
