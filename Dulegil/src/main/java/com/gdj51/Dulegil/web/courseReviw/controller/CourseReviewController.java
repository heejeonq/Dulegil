package com.gdj51.Dulegil.web.courseReviw.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseReviewController {
	
	@RequestMapping(value="/courseReview")
	public ModelAndView courseReview(
			@RequestParam HashMap<String,String> params,
			ModelAndView mav) throws Throwable{
		
		int page = 1;
		
		if(params.get("page")!= null && params.get("page")!= "" ) {
			page=Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("courseReviw/courseReviw_list");
				
		return mav;
	}
	
	
	

	@RequestMapping(value="/courseReviewDetail")
	public ModelAndView courseReviewDetail(ModelAndView mav) {
		
		mav.setViewName("courseReviw/courseReviw_detail");
		
		return mav;
	}
	
	@RequestMapping(value="/courseReviewWrite")
	public ModelAndView courseReviewWrite(ModelAndView mav) {
		
		mav.setViewName("courseReviw/courseReviw_write");
		
		return mav;
	}
}