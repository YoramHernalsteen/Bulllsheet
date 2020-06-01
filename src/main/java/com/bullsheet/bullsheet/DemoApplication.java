package com.bullsheet.bullsheet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
		Logger logger = LoggerFactory.getLogger(DemoApplication.class);
		logger.info("Wie dit leest krijgt een DIKKE zoen van Yorne!");
		logger.info("Nee dankje Yorne, social distancing! xxx Willem #CoronaTijden");
	}

}
