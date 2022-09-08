package com.gdj51.Dulegil.admin.accountMngController;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class accountMngController {
	@Autowired
	public IDao dao;

	// 관리자 페이지
	@RequestMapping(value = "/adAccountMng")
	public ModelAndView adAccountMng(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		mav.setViewName("admin/1_adAccountMng/ad_AccountMng");
		return mav;
	}

}
