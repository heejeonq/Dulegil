package com.gdj51.Dulegil.web.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class MypageCommentController {
	@Autowired
	public IDao iDao;

	// xml까지 갔다가 페이징 처리를 사용하기 위해 오토라이드를 해준다.
	// 페이징 서비스 객체 주입
	@Autowired
	// 페이징처리를 위해서 필요.
	public IPagingService ips;

	@RequestMapping(value = "/mypageComment") // Database나 파일 같이 외부에 접근하는 경우 외적요인으로 문제가 발생할수 있음으로 예외처리가 반드시 필요하다.
	public ModelAndView mypageComment(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		// 현재 페이지
		int page = 1;
		if (params.get("page") != null && params.get("page") != "") {// 페이지가 넘어왔을 때
			page = Integer.parseInt(params.get("page")); // 받아온 페이지를 보여줌.
		}

		List<HashMap<String, String>> cate = iDao.getList("mypage.getCateAllList");

		mav.addObject("cate", cate);
		mav.addObject("page", page);
		mav.setViewName("mypage/mypage_comment");

		return mav;
	}

	// RequestMapping에서 주소중 특정 내용들을 값으로 활용 가능
	// 주소 값에 {키} 를 지정하면 해당 내용을 변수로 받을 수 있음
	@RequestMapping(value = "/mypageCommentAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody // @PathVariable : 경로를 변수로 활용하여 받아옴
	public String mypageCommentAjax(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int delete = 0;

		try {
			switch (gbn) {
			case "delete":
				delete = iDao.delete("mypage.deleteComment", params);
				if (delete > 0) {
					model.put("msg", "success");
				} else {
					model.put("msg", "fail");
				}
				break;
			case "select":
				// 총 데이터 개수 취득
				int cnt = iDao.getInt("mypage.getCCnt", params);
				// 페이징 데이터 계산 // 데이터 10개씩, 5는 페이지 개수
				HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);

				// 파라메터에 시작,종료값 추가
				params.put("start", Integer.toString(pd.get("start")));
				params.put("end", Integer.toString(pd.get("end")));

				// 페이지를 넘겨 받을 것
				// 데이터 취득
				List<HashMap<String, String>> list = iDao.getList("mypage.getCommentList", params);

				List<HashMap<String, String>> cate = iDao.getList("mypage.getCateAllList");

				// 목록 데이터
				model.put("list", list);
				// 카테고리
				model.put("cate", cate);
				// 페이징 정보
				model.put("pd", pd);
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return mapper.writeValueAsString(model);
	}
}