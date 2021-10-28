package com.tjupi.workshop.k8sjava;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class HttpController {

  private final String helloMessage;

  public HttpController(ApplicationProperties properties) {
    this.helloMessage = properties.getWelcomeMessage();
  }

  @GetMapping
  public String sayHello() {
    return helloMessage + " Sophia2";
  }
}
