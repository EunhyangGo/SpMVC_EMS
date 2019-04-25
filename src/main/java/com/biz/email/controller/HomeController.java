package com.biz.email.controller;

import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.email.model.EMSVO;
import com.biz.email.service.EMSService;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	EMSService es;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		EMSVO eVO = new EMSVO();
		LocalDate ld = LocalDate.now();
		LocalTime lt = LocalTime.now();
		eVO.setS_date(ld.toString());
		eVO.setS_time(lt.toString());
		model.addAttribute("EMS",eVO);
		
		return "home";
/*
		log.debug("HOME Controller");
		model.addAttribute("BODY",BODY);
		model.addAttribute("EMAILLIST", es.selectAll());
	*/	
		
		/*
		log.error("error");
		log.warn("warn");
		log.info("info");
		log.debug("debug");
		log.trace("trace");
		*/
		
	}
	
}
