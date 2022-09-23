package com.gdj51.Dulegil.admin.noticeController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj51.Dulegil.common.service.IPagingService;
import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class adNoticeController {
   @Autowired 
   public IDao dao;

   @Autowired
   public IPagingService ips;

   //리스트
   @RequestMapping(value = "/adNtList")
   public ModelAndView adNtList(
         HttpSession session,
         @RequestParam HashMap<String, String> params,
         ModelAndView mav) throws Throwable {

      if(session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {

         int page = 1;

         if(params.get("page") != null && params.get("page") != "") {
            page = Integer.parseInt(params.get("page"));
         }

         mav.addObject("page", page);
         
         mav.setViewName("admin/3_adNotice/ad_notice_list");
         
      }else {
         mav.setViewName("admin/0_adLogin/ad_Login");

      }
      return mav;
   }

   // 리스트 아작스
   @RequestMapping(value = "/adNtAjax",
         method = RequestMethod.POST,
         produces = "text/json;charset=UTF-8")

   @ResponseBody
   public String adNtAjax(
         @RequestParam HashMap<String, String> params)throws Throwable {
      ObjectMapper mapper = new ObjectMapper();
      
      Map<String, Object> model = new HashMap<String, Object>();

      int cnt = dao.getInt("adNotice.cnt",params);
      
      HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),cnt,10,5);

      params.put("start", Integer.toString(pd.get("start")));
      params.put("end", Integer.toString(pd.get("end")));

      List<HashMap<String, String>> list = dao.getList("adNotice.list", params);

      model.put("list", list);
      model.put("pd", pd);

      return mapper.writeValueAsString(model);
   }

   // 등록
   @RequestMapping(value = "/adNtWrite")
   public ModelAndView adNtWrite(
		   
         HttpSession session,
         @RequestParam HashMap<String, String> params,
         ModelAndView mav) throws Throwable {
	   
      if(session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {
         mav.setViewName("admin/3_adNotice/ad_notice_write");
      }else {
         mav.setViewName("admin/0_adLogin/ad_Login");
      }
      return mav;
   }

   // 액션 아작스   
   @RequestMapping(value = "/adNtAction/{gbn}",
         method = RequestMethod.POST,
         produces = "text/json;charset=UTF-8")
   @ResponseBody
   public String adNtAction(
         @PathVariable String gbn,
         @RequestParam HashMap<String, String> params) throws Throwable{
      ObjectMapper mapper = new ObjectMapper();

      Map<String, Object> model = new HashMap<String, Object>();

      int cnt = 0;

      try {
         switch (gbn) {
         case "insert": cnt=dao.insert("adNotice.insert", params);
         break;
         case "update": cnt=dao.update("adNotice.update", params);
         break;
         case "delete": cnt=dao.update("adNotice.delete", params);
         break;
         case "detailDelete": cnt=dao.update("adNotice.detailDelete", params);
         break;
         }
         if(cnt>0) {
            model.put("msg", "success");
         }else {
            model.put("msg", "fail");
         }
      } catch (Exception e) {
         e.printStackTrace();
         model.put("msg", "exception");
      }
      return mapper.writeValueAsString(model);
   }

   // 상세보기
   @RequestMapping(value = "/adNtDetail")
   public ModelAndView adNtDetail(
         HttpSession session,
         @RequestParam HashMap<String, String> params,
         ModelAndView mav) throws Throwable {
      if(session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {

         if(params.get("no") != null && params.get("no") != "") {
            HashMap<String, String> data = dao.getMap("adNotice.detail", params);

            mav.addObject("data", data);
            mav.setViewName("admin/3_adNotice/ad_notice_detail");
         }else {
            mav.setViewName("redirect:adNtList");
         }
      }else {
         mav.setViewName("admin/0_adLogin/ad_Login");
      }
      return mav;
   }

   // 수정
   @RequestMapping(value = "/adNtUpdate")
   public ModelAndView adNtUpdate(
         HttpSession session,
         @RequestParam HashMap<String, String> params,
         ModelAndView mav) throws Throwable {
      if(session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {

	      if(params.get("no") != null && params.get("no") != "") {
	         HashMap<String, String> data = dao.getMap("adNotice.detail", params);
	
	         mav.addObject("data", data);
	         mav.setViewName("admin/3_adNotice/ad_notice_update");
	      }else {
	         mav.setViewName("redirect:adNtList");
	      }
      }else {
         mav.setViewName("admin/0_adLogin/ad_Login");
      }
      return mav;
   }
}