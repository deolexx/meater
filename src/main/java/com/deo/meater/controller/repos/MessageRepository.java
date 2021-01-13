package com.deo.meater.controller.repos;

import com.deo.meater.entity.Message;

import org.springframework.data.jpa.repository.JpaRepository;


public interface MessageRepository extends JpaRepository<Message, Integer> {
}
