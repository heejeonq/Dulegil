package com.gdj51.Dulegil.web.courseReviw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseReviewController {

	@RequestMapping(value = "/courseReview")
	public ModelAndView courseReview(ModelAndView mav) throws Throwable {

		mav.setViewName("courseReview/courseReview_list");

		return mav;
	}
}
