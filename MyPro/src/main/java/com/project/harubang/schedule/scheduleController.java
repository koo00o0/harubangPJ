package com.project.harubang.schedule;

/*import java.text.DateFormat;
import java.util.Date;*/
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class scheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(scheduleController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/schedule/schedule", method = RequestMethod.GET)
	public String schedule(Model model) {
		logger.info("Welcome schedule!");
		return "/schedule/schedule";
	}
	
}
