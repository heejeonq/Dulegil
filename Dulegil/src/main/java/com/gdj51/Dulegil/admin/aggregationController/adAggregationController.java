package com.gdj51.Dulegil.admin.aggregationController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adAggregationController {
	
	@RequestMapping(value="/adAggregation")
	public ModelAndView adLogin(ModelAndView mav) {
		
		mav.setViewName("admin/5_adAggregation/ad_websiteTotal");
		return mav;
	}

}
