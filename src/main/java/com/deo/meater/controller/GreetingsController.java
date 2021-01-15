package com.deo.meater.controller;

import com.deo.meater.repos.MessageRepository;
import com.deo.meater.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class GreetingsController {

    @Autowired
   private MessageRepository messageRepository;





    @GetMapping("/")
    public String greeting(Map<String, Object> model) {

        return "greeting";
    }


    @GetMapping("/main")
      public String main(Map<String, Object> model)  {

        Iterable<Message> messages = messageRepository.findAll();

        model.put("messages",messages);

        return "main";
    }

    @PostMapping("/main")
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
