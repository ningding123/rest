package com.ocpap.rest.controller;

import java.util.HashMap;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.ocpap.rest.entity.AdminMenu;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.service.AdminMenuService;
import com.ocpap.rest.util.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMenuController {
	@Autowired
	private AdminMenuService adminMenuService;
	
	@RequestMapping(value="/menu/list")
	public ModelAndView menu_list(QueryVo vo){
		ModelAndView mav = new ModelAndView();
		Page<AdminMenu> page = adminMenuService.selectPageByQueryVo(vo);
		mav.addObject("page", page);
		mav.addObject("vo", vo);
		mav.addObject("cla", "menu");
		mav.setViewName("admin-menu-list");
		return mav;
	}
	
	@RequestMapping(value="/menu/edit")
	public ModelAndView menu_edit(Integer au_id){
		ModelAndView mav = new ModelAndView();
		AdminMenu menuinfo = adminMenuService.getMenuInfo(au_id);
		mav.addObject("menuinfo", menuinfo);
		mav.setViewName("admin-menu-edit");
		mav.addObject("cla", "menu");
		return mav;
	}
	
	@RequestMapping(value="/menu/getMenuList")
	@ResponseBody
	public JSONObject getMenuList(){
		List<AdminMenu> menulist = adminMenuService.getMenuList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("msg", "succ");
		map.put("data", menulist);
		JSONObject json= (JSONObject) JSONObject.toJSON(map);
		return json;
	}
	
	@RequestMapping(value="/menu/edit_handle")
	@ResponseBody
	public JSONObject edit_handle(AdminMenu adminmenu){
		int ret =0;
		if(adminmenu.getAuClickable()==null){
			adminmenu.setAuClickable(0);
		}
		if(adminmenu.getAuId()<=0){
			ret=adminMenuService.insertSelective(adminmenu);
		}else{
			ret=adminMenuService.updateByPrimaryKeySelective(adminmenu);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(ret>0){
			map.put("status", "succ");
		}else{
			map.put("status", "error");
		}
		JSONObject json= (JSONObject) JSONObject.toJSON(map);
		return json;
	}
}
