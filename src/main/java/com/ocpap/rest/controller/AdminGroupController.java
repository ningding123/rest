package com.ocpap.rest.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.ocpap.rest.entity.AdminGroup;
import com.ocpap.rest.entity.AdminMenu;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.service.AdminGroupService;
import com.ocpap.rest.service.AdminMenuService;
import com.ocpap.rest.util.MakeMenuTree;
import com.ocpap.rest.util.Page;
import com.sun.deploy.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminGroupController {
	@Autowired
	private AdminGroupService adminGroupService;
	@Autowired
	private AdminMenuService adminMenuService;
	
	@RequestMapping(value="/group/list")
	public ModelAndView menu_list(QueryVo vo){
		ModelAndView mav = new ModelAndView();
		Page<AdminGroup> page = adminGroupService.selectPageByQueryVo(vo);
		mav.addObject("page", page);
		mav.addObject("vo", vo);
		mav.addObject("cla", "menu");
		mav.setViewName("admin-group-list");
		return mav;
	}
	
	@RequestMapping(value="/group/edit")
	public ModelAndView menu_edit(Integer agid){
		//System.out.println(agid);
		ModelAndView mav = new ModelAndView();
		AdminGroup groupinfo = adminGroupService.getGroupInfo(agid);
		AdminGroup group_info = adminGroupService.getGroupInfo(agid);
		MakeMenuTree menuTree = new MakeMenuTree();
		List<AdminMenu> menu_list = adminMenuService.getAllMenuList();
		menu_list=menuTree.menuList(menu_list);
		List<AdminMenu> auth_list = menuTree.makeAuthList(menu_list,group_info);
		mav.addObject("groupinfo", groupinfo);
		mav.addObject("list", auth_list);
		mav.setViewName("admin-group-edit");
		mav.addObject("cla", "menu");
		return mav;
	}
	
	@RequestMapping(value="/group/edit_handle")
	@ResponseBody
	public JSONObject edit_handle(@RequestParam("au_id") String[] au_id, AdminGroup admingroup){
		int ret = 0;
		String auth_info= StringUtils.join(Arrays.asList(au_id), ",");
		admingroup.setAgAuth(auth_info);
		if(admingroup.getAgId()<=0){
			ret=adminGroupService.insertSelective(admingroup);
		}else{
			ret=adminGroupService.updateByPrimaryKeySelective(admingroup);
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
