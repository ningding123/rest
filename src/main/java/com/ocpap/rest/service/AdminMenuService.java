package com.ocpap.rest.service;

import java.util.List;
import com.ocpap.rest.entity.AdminMenu;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.util.Page;


public interface AdminMenuService {
	AdminMenu getMenuInfo(Integer auid);
	List<AdminMenu> getAllMenuList();
	Page<AdminMenu> selectPageByQueryVo(QueryVo vo);
	List<AdminMenu>  getMenuList();
	int insertSelective(AdminMenu adminmenu);
	int updateByPrimaryKeySelective(AdminMenu adminmenu);
}
