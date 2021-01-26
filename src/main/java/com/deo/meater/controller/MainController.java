package com.deo.meater.controller;

import com.deo.meater.entity.Message;
import com.deo.meater.entity.User;
import com.deo.meater.repos.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
   private MessageRepository messageRepository;

    @Value("${upload.path}")
    private String uploadPath;



    @GetMapping("/")
    public String greeting(Map<String, Object> model) {

        return "greeting";
    }


    @GetMapping("/main")
      public String main(@RequestParam(required = false, defaultValue = "")String filter, Model model)  {

        Iterable<Message> messages = messageRepository.findAll();

        if(filter !=null &&!filter.isEmpty()) {
            messages = messageRepository.findByTag(filter);
        }else {messages = messageRepository.findAll();}

        model.addAttribute("messages",messages);
        model.addAttribute("filter",filter);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
          @Valid Message message,
            BindingResult bindingResult,
            Model model,
    @RequestParam("file") MultipartFile file) throws IOException {

        message.setAuthor(user);

        {
            Date date = Calendar.getInstance().getTime();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String strDate = dateFormat.format(date);
            message.setDate(strDate);
        }
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("message",message);
        }
        else {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + file.getOriginalFilename();
                file.transferTo(new File(uploadPath + "/" + resultFilename));
                message.setFilename(resultFilename);
            }

            messageRepository.save(message);
        }
        Iterable<Message> messages = messageRepository.findAll();

        model.addAttribute("messages",messages);

        return "redirect:/main";
    }



    @PostMapping("/delete")
    public String deleteMessage(@RequestParam("messageId") Integer theId){
        messageRepository.deleteById(theId);
        return "redirect:/main";
    }






}
