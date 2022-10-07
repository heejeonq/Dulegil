package com.gdj51.Dulegil.web.mypage.controller;

import java.util.HashMap;
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
import com.gdj51.Dulegil.util.Utils;
import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class MypageInfoController {
	// Autowired란
	// 의존 대상을 설정 코드에서 직접 주입하지 않고,
	// 스프링이 필요한 의존 객체의 "타입"에 해당하는 빈을 찾아
	// 의존하는 빈 객체에 자동 주입해주는 것을 뜻한다.
	@Autowired
	public IDao dao;

	@RequestMapping(value = "/mypageMyinfo")
	// 값을 받아와서 화면에 출력시켜줌. //로그인을 위해 저장 공간인 session필요 //값을 불러오는 친구.
	public ModelAndView mypageMyinfo(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		// 로그인 안했을 때 마이페이지 클릭했을 때 로그인 페이지로 가게 함.
		// .getAttribute()는 선택한 요소(element)의 특정 속성(attribute)의 값을 가져온다.
		if (session.getAttribute("sMemNm") == null || session.getAttribute("sMemNm") == "") {

			mav.setViewName("login/login");

		} else { // 세션에서 가져와서 params
			params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));
			// 키 //값
			HashMap<String, String> data = dao.getMap("member.getMyinfo", params);
			session.setAttribute("sMemNm", data.get("NM"));
			mav.addObject("data", data);
			mav.setViewName("mypage/mypage_myinfo");
		}
		return mav;
	}

	@RequestMapping(value = "/mypagePasswordCheck")
	public ModelAndView mypagePasswordCheck(HttpSession session, ModelAndView mav) throws Throwable {

		if (session.getAttribute("sMemNm") == null || session.getAttribute("sMemNm") == "") {

			mav.setViewName("login/login");

		} else {

			mav.setViewName("mypage/mypage_password_check");

		}
		return mav;
	}

	@RequestMapping(value = "/mypageAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	// ModelAndView는 ModelAndView만 줄수 있는데 @ResponseBody는 스트링으로 줄 수 있음.
	@ResponseBody
	public String mypageAjax(@PathVariable String gbn, HttpSession session,
			@RequestParam HashMap<String, String> params) throws Throwable {

		// 스트링을 제이슨으로 바꿔주는 라이브러리가 ObjectMapper임.
		ObjectMapper mapper = new ObjectMapper();
		// Object는 다 가능 포괄적인 느낌.
		Map<String, Object> model = new HashMap<String, Object>();

		/*
		 * // 암호화 params.put("pwd", Utils.encryptAES128(params.get("pwd")));
		 * System.out.println(params.get("pwd"));
		 * 
		 * // 복호화 System.out.println(Utils.decryptAES128(params.get("pwd")));
		 */
//		HashMap은 키 값의 형태로 이루어짐.
		HashMap<String, String> data = new HashMap<String, String>();

		int cnt = 0;
		try {
			switch (gbn) {
			case "passwordCheck":

				// ex)int qwe = dao.getInt2(7, 5);
				// 메소드 = 함수
				// 메소드 생성()괄호 안에 있는 값을 받아야함
				// 메소드 호출()괄호 안에 있는 것은 보내주는 값.

				// 암호화
				params.put("pwd", Utils.encryptAES128(params.get("pwd")));
				System.out.println(params.get("pwd"));

				// 복호화
				System.out.println(Utils.decryptAES128(params.get("pwd")));

				data = dao.getMap("member.checkPwd", params);
				if (data != null) {
					model.put("msg", "success");
				} else {
					model.put("msg", "fail");
				}
				break;
			case "myinfoUpdate":

				// 암호화
				params.put("pwd", Utils.encryptAES128(params.get("pwd")));
				System.out.println(params.get("pwd"));

				// 복호화
				System.out.println(Utils.decryptAES128(params.get("pwd")));

				cnt = dao.update("member.updateMyinfo", params);
				if (cnt > 0) {
					model.put("msg", "success");
				} else {
					model.put("msg", "fail");
				}
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		} // writeValueAsString: model을 제이슨형태로 돌려주는 메서드
		return mapper.writeValueAsString(model);
	}

	@RequestMapping(value = "/mypageMyinfoUpdate", produces = "test/json;charset=UTF-8")
	// 값을 불러오다(요청하는 것)
	public ModelAndView mypageMyinfoUpdate(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		// 로그인 안했을 경우엔 로그인 페이지로
		if (session.getAttribute("sMemNm") == null || session.getAttribute("sMemNm") == "") {
			mav.setViewName("login/login");
		} else {
			// 여기서의 memNo는 수정페이지를 보여주기 위해 정보를 불러오기 위한 memNo
			params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));
			// params를 쓰는 이유가 member.getMyinfo에 해당하는 특정 값.쿼리문에서 검색한 값만 가져옴.
			// ex)상세 정보,검색,수정,추가,삭제(전체를 가져오면 안되니까 전체를 가져오면 전체가 삭제 됨.)
			HashMap<String, String> data = dao.getMap("member.getMyinfo", params);
			// "data"가 아니라 "a"라면 jsp에서는 a.IMG_FILE(값을 가져올 컬럼이름)
			// 키, 값
			mav.addObject("data", data);
			mav.setViewName("mypage/mypage_myinfo_u");
		}
		return mav;
	}
}