package com.tjupi.workshop.k8sjava;

import lombok.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConstructorBinding;

@ConfigurationProperties(prefix = "app")
@ConstructorBinding
@Value
public class ApplicationProperties {

  private final String welcomeMessage;
}
