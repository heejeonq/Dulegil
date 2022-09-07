package com.gdj51.Dulegil.web.bestReviewGallery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BestReviewGalleryController {
	
	@RequestMapping(value="/BestReviewGallery")
	public ModelAndView BestReviewGallery(ModelAndView mav) {
		
		mav.setViewName("bestReviewGallery/bestReviewGallery_list");
		
		return mav;
	}

}
