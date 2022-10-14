package com.gdj51.Dulegil.admin.aggregationController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ChartController {
	@RequestMapping(value = "/chart")
	public ModelAndView chart(ModelAndView modelAndView) {
		
		modelAndView.setViewName("sample/chart/chart");
		
		return modelAndView;
	}
	

	@RequestMapping(value = "/getChartData", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getChartData(
			HttpServletRequest request) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		
		// 1. x 축 월별 뽑자~
		int month = Integer.parseInt(request.getParameter("month"));
		
		// 2. 각 n 월 = (mem, post, cmt, acp, end) 들
		int monthAllData = Integer.parseInt(request.getParameter("monthAllData"));
		
		// 3. month 월 별 리스트 바구니 생성 !아직 데이터 x
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		
		// 4. 각 n월 별
		for(int s = 0 ; s < monthAllData ; s++) {		
			// 시리즈 = {[mem 의 n월 별 리스트...], [post의 n월 별 리스트 ...].....}
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			
			
			
			// 컬럼 이름
			data.put("name", "S" + s);
			
			// 1씩 x 축 증가 (x축에서 시리즈간의 사이값)
			data.put("pointInterval", 1);
			
			// 1999부터 시작 -> 1999를 기준날짜 ~ 현재 날짜 데이터로 받아와야됨...........[sysdate 에서 - 6개월(6개월간 차트 보여줄거임)]
			data.put("pointStart", 1999); //[sysdate 에서 - 6개월(6개월간 차트 보여줄거임)]
			
			
					// 시리즈안에 막대기의 값(높이)를 y 라는 바구니 생성
					ArrayList<Integer> y = new ArrayList<Integer>();
			
			
					// 컬럼의 크기들이 랜덤으로 지정됨. 시리즈 안의 값(data) 랜덤 <n 월 만큼 돌림>
					for(int i = 0 ; i < monthAllData ; i++) {
						y.add((int) (Math.random() * 100)); 
					}
					
					// data값을 랜덤값으로 보내기
					data.put("data", y);
			
			// 위 랜덤값을 리스트에 담기
			list.add(data);
			
			
		} // for문 끝
		
		// 시리즈 부분 데이터에 위 list를 담아줌,
		modelMap.put("list", list);
		
        return mapper.writeValueAsString(modelMap);
	}
}
