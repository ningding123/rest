package com.ocpap.rest.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.ocpap.rest.entity.AdminAccount;
import com.ocpap.rest.entity.AdminGroup;
import com.ocpap.rest.entity.AdminMenu;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.service.AdminGroupService;
import com.ocpap.rest.service.AdminMenuService;
import com.ocpap.rest.service.AdminService;
import com.ocpap.rest.util.KeysUtil;
import com.ocpap.rest.util.MakeMenuTree;
import com.ocpap.rest.util.Page;
import com.ocpap.rest.util.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminMenuService adminMenuService;
	@Autowired
	private AdminGroupService adminGroupService;
	/**
	 * 管理员登录功能
	 */
	@RequestMapping(value="/admin/login")
	public ModelAndView adminLogin(String code, AdminAccount adminAccount, HttpSession session, HttpServletRequest request){
		String sessioncode = (String)session.getAttribute("SESSION_VALIDATECODE");
		ModelAndView mav = new ModelAndView();
		if(code!=null) {
			if (sessioncode.equalsIgnoreCase(code)) {
				adminAccount.setuPassword(KeysUtil.string2MD5(adminAccount.getuPassword()));
				AdminAccount account = adminService.login(adminAccount);
				//System.out.println(account.toString());
				if (account == null) {
					mav.addObject("error", "用户名或密码不正确");
					mav.setViewName("login");
				} else if (account != null && account.getuStatus() == false) {
					mav.addObject("error", "用户禁止使用");
					mav.setViewName("login");
				} else {
					session.setAttribute("admin", account);
					session.setAttribute("age", 123);
					//保存登录信息
					AdminGroup group_info = adminGroupService.getGroupInfo(account.getAgId());
					MakeMenuTree menuTree = new MakeMenuTree();
					List<AdminMenu> menu_list = adminMenuService.getAllMenuList();
					menu_list = menuTree.menuList(menu_list);
					List<AdminMenu> auth_list = menuTree.makeAuthList(menu_list, group_info);
					//获取到该用户得到的模块list存到session
					session.setAttribute("SESSIONAUTHLIST", auth_list);
					//更新用户登陆ip 登陆时间 登陆次数
					String ip = request.getHeader("x-forwarded-for");
					if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
						ip = request.getHeader("Proxy-Client-IP");
					}
					if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
						ip = request.getHeader("WL-Proxy-Client-IP");
					}
					if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
						ip = request.getRemoteAddr();
					}
					if (ip.equals("0:0:0:0:0:0:0:1")) {
						ip = "0:0:0:0:0:0:0:1";
					}
					AdminAccount adminaccount = new AdminAccount();
					adminaccount.setAmId(account.getAmId());
					adminaccount.setLastLogindate(TimeUtils.getCurrentTime());
					Integer accountnum = account.getVisitCount() + 1;
					adminaccount.setVisitCount(accountnum);
					adminaccount.setLastLoginip(ip);
					adminService.saveUpdate(adminaccount);
					mav.addObject("cla", "admin");
					mav.setViewName("index");
				}
			}else{
				mav.addObject("error", "验证码错误");
				mav.setViewName("login");
			}
		}else{
			mav.addObject("error", "验证码错误");
			mav.setViewName("login");
		}
		return mav;
	}
	
	/**
	 * 查询所有用户
	 * @return
	 */
	@RequestMapping(value="/admin/list")
	public ModelAndView adminList(QueryVo vo){
		ModelAndView mav = new ModelAndView();
		Page<AdminAccount> page = adminService.selectPageByQueryVo(vo);
		List<AdminGroup> groups = adminGroupService.getAllGroup();
		mav.addObject("page", page);
		mav.addObject("vo", vo);
		mav.addObject("groups", groups);
		mav.addObject("cla", "admin");
		mav.setViewName("admin-list");
		return mav;
	}
	
	/**
	 * 添加用户
	 * @param adminAccount
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/admin/insert")
	@ResponseBody
	public JSONObject insert(AdminAccount adminAccount, HttpServletRequest request){
		adminAccount.setCreatedate(TimeUtils.getCurrentTime());
        AdminAccount admin = (AdminAccount) request.getSession().getAttribute("admin");
        if(admin!=null){
        	adminAccount.setCreatedUser(admin.getuLoginname());

        	adminAccount.setuPassword(KeysUtil.string2MD5(adminAccount.getuPassword()));
        }
        int ret=0;
		 ret= adminService.insertAdminAccount(adminAccount);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(ret>0){
			map.put("status", "succ");
		}else{
			map.put("status", "error");
		}
		JSONObject json= (JSONObject) JSONObject.toJSON(map);
		return json;
	}
	
	/**
	 * 获取权限组,用于页面回显数据
	 * @return
	 */
	@RequestMapping(value="/admin/groupList")
	public ModelAndView groupList(){
		
		ModelAndView mav = new ModelAndView();
		List<AdminGroup> groups = adminGroupService.getAllGroup();
		mav.addObject("groups", groups);
		mav.addObject("cla", "admin");
		mav.setViewName("admin-insert");
		return mav;
	}
	
	/**
	 * 修改用户-回显用户信息
	 * @param amId
	 * @return
	 */
	@RequestMapping(value="/admin/update")
	public ModelAndView adminUpdate(Integer amId){
		ModelAndView mav = new ModelAndView();
		AdminAccount adminAccount = adminService.findAdminById(amId);
		List<AdminGroup> groups = adminGroupService.getAllGroup();
		mav.addObject("groups", groups);
		mav.addObject("account", adminAccount);
		mav.addObject("cla", "admin");
		mav.setViewName("admin-edit");
		return mav;
	}
	

	
	/**
	  * 保存修改用户信息
	 * @param adminAccount
	 * @return
	 */
	@RequestMapping(value="/admin/saveUpdate")
	@ResponseBody
	public JSONObject saveUpdate(AdminAccount adminAccount){
		adminAccount.setLastEdit(TimeUtils.getCurrentTime());
		adminAccount.setuPassword(KeysUtil.string2MD5(adminAccount.getuPassword()));
		int ret =0;
		ret = adminService.saveUpdate(adminAccount);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(ret>0){
			map.put("status", "succ");
		}else{
			map.put("status", "error");
		}
		JSONObject json= (JSONObject) JSONObject.toJSON(map);
		return json;
	}
	
	
	/**
	 * 修改用户状态
	 * @param amId
	 * @return
	 */
	@RequestMapping(value="/admin/changeStatus")
	public String changeStatus(Integer amId,Integer agId,String amName){
		adminService.changeStatus(amId);
		
		return "redirect:/admin/list?agId="+agId+"&amName="+amName;
	}
	
	/*
	 * 
	 * 验证登陆
	 */
	@RequestMapping(value="/admin/checkuLoginname")
	@ResponseBody
	public JSONObject userJson(@RequestBody AdminAccount adminAccount){
		
		boolean flag = adminService.findAdminByLoginName(adminAccount);
		Map<String,Boolean> map = new HashMap<String,Boolean>();
		map.put("flag", flag);

		JSONObject json= (JSONObject) JSONObject.toJSON(map);
		
		return json;
	}
	/*
	 * 
	 * 验证账号
	 */
	@RequestMapping(value="/admin/checkuLoginaccount")
	@ResponseBody
	public JSONObject useraccountJson(@RequestBody AdminAccount adminAccount){
		
		boolean flag = adminService.findAdminByLoginName(adminAccount);
		Map<String,Boolean> map = new HashMap<String,Boolean>();
		map.put("flag", flag);

		JSONObject json= (JSONObject) JSONObject.toJSON(map);
		
		return json;
	}
	
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping(value="/admin/quit")
	public String adminQuit(HttpSession session){
		session.removeAttribute("admin");
		return "login";
	}
	
}
