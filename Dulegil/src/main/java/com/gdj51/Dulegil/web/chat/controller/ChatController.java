package com.gdj51.Dulegil.web.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.Dulegil.web.chat.vo.Room;
import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class ChatController {
	@Autowired
	public IDao dao;
	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;
	
	@RequestMapping(value="/chat")
	public ModelAndView chat (ModelAndView mav) {
		
		mav.setViewName("mypage/mypage_chat");
		return mav;
	}
	
	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}
	
	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	/**
	 * 채팅방
	 * @return
	 * @throws Throwable 
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<String, String> params) throws Throwable {
		ModelAndView mv = new ModelAndView();
		List<HashMap<String, String>> list = dao.getList("accompany.chatList", params);
	
		List<String> chatList = new ArrayList<String>();
		
		for(HashMap<String, String> data: list) {
				chatList.add(String.valueOf(data.get("POST_NO")));
		}
		

		int cnt =  (int) chatList.stream().filter(str -> params.get("postNo").equals(str)).count();
	

		if(cnt > 0) {
			mv.addObject("postNo", params.get("postNo"));
			mv.setViewName("mypage/mypage_chat");
		}else {
			mv.setViewName("mypage/mypage_accompany");
		}
		return mv;
	}
}
