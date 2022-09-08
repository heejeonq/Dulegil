package com.gdj51.Dulegil.web.courseReviw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseReviewController {
	
	@RequestMapping(value="/courseReview")
	public ModelAndView courseReviewList(ModelAndView mav) {
		
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
	
	
	
}
