package com.ocpap.rest.serviceImpl;

import java.util.List;

import com.ocpap.rest.entity.AdminMenu;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.mapper.AdminMenuMapper;
import com.ocpap.rest.service.AdminMenuService;
import com.ocpap.rest.util.Instant;
import com.ocpap.rest.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMenuServiceImpl implements AdminMenuService {

	@Autowired
	private AdminMenuMapper adminMenuMapper;

	@Override
	public AdminMenu getMenuInfo(Integer agid) {
		// TODO Auto-generated method stub
		AdminMenu adminmenu = adminMenuMapper.selectByPrimaryKey(agid);
		return adminmenu;
	}
	@Override
	public List<AdminMenu> getAllMenuList() {
		// TODO Auto-generated method stub
		List<AdminMenu> menu_list = adminMenuMapper.getAuthList();
		return menu_list;
	}
	@Override
	public Page<AdminMenu> selectPageByQueryVo(QueryVo vo) {
		Page<AdminMenu> page = new Page<AdminMenu>();
		//每页数
		vo.setSize(Instant.NEWSSIZE);
		if (null != vo) {
			// 判断当前页
			if (null != vo.getPage()) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() -1)*vo.getSize());
			}
			if(null != vo.getAuName()){
				vo.setAuName(vo.getAuName().trim());
			}
			//总条数
			page.setTotal(adminMenuMapper.CountByQueryVo(vo));
			page.setRows(adminMenuMapper.selectPageByQueryVo(vo));
		}
		return page;
	}
	@Override
	public List<AdminMenu> getMenuList() {
		// TODO Auto-generated method stub
		List<AdminMenu> menu_list = adminMenuMapper.getMenuList();
		return menu_list;
	}
	@Override
	public int insertSelective(AdminMenu adminmenu) {
		// TODO Auto-generated method stub
		int ret=adminMenuMapper.insertSelective(adminmenu);
		return ret;
	}
	@Override
	public int updateByPrimaryKeySelective(AdminMenu adminmenu) {
		// TODO Auto-generated method stub
		int ret=adminMenuMapper.updateByPrimaryKeySelective(adminmenu);
		return ret;
	}
}
