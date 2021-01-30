package com.deo.meater.repos;

import com.deo.meater.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface MessageRepository extends JpaRepository<Message, Integer> {


    public List<Message> findByTag(String tag);


}
