package com.biz.email.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.biz.email.model.EMSVO;
import com.biz.email.service.EMSService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//list와 view에서 
@RequestMapping("/ems")  
public class EMSController {
	
	@Autowired
	EMSService es;

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String ems(Model model) {
		
		EMSVO eVO = new EMSVO();
		LocalDate ld = LocalDate.now();
		LocalTime lt = LocalTime.now();
		eVO.setS_date(ld.toString());
		eVO.setS_time(lt.toString());
		model.addAttribute("EMS",eVO);
		
		return "home";
	}
	
	@RequestMapping(value="/ems", method=RequestMethod.POST)
	public String ems(@ModelAttribute EMSVO eVO) {
	
		log.debug("EMSVO" + eVO.toString());
		es.insert(eVO);
	
	return "redirect:/";
		
	}
	
	// 리스트를 보여주는 메서드
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String email_list(Model model) {
		
		List<EMSVO> eList = es.selectAll();
		model.addAttribute("EMAILS", eList);
		return "email_list";
		
	}
	
	// 리스트를 보여주고
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String ems_view(@ModelAttribute("emsVO")
						EMSVO emsVO, Model model) {
		
		long id = emsVO.getId();
		log.debug("EMAIL ID: " + id);
		
		emsVO = es.findById(id);
		model.addAttribute("emsVO",emsVO);
		
		return "email_view";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String ems_update(@ModelAttribute("emsVO")
						EMSVO emsVO, Model model) {
		long id = emsVO.getId();
		log.debug("EMAIL ID:" + id);
		emsVO = es.findById(id); //메일을 조회해서 메일 vo에 담고
		
		model.addAttribute("emsVO",emsVO); //메일 브이오에 메일 브이오를 담았다.
		return "home"; //메일 폼으로 해서 폼테그로 작성을 하게 된다.
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String ems_delete(@RequestParam long id) {
		es.delete(id);
		return "redirect:/";
	}

	//email_form을 보여주는 메서드
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String join(Model model) {
		
		EMSVO eVO = new EMSVO();
		model.addAttribute("emsVO",eVO);
		
		return "email_form";
	}
	//write_form을 보여주는 메서드
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String ems_write(@ModelAttribute("emsVO")
			@Valid EMSVO eVO, BindingResult result, Model model, SessionStatus sStatus) {
		
		if(result.hasErrors()) {
			model.addAttribute("BODY","EMS_WRITE");
			return "home";
		}else {
			
			log.debug(eVO.toString());
			int ret = 0;
			if(eVO.getId()>0) {
				ret = es.update(eVO);
			}else {
				ret = es.insert(eVO);
			}
			
			/*
			 * Model 에 addAttribute 된 변수는
			 * redirect 할때 ?변수=값 형태로 따라간다.
			 * 
			 * ModelAndView 는 redirect 하면
			 * 값을 버리고 간다.
			 * 
			 */
			
			sStatus.setComplete();
			model.addAttribute("BODY", "EMS_LIST");
			
			return "email_form";
		}
	}
	
	
	
	
}
