package com.ocpap.rest.util;

import java.util.ArrayList;
import java.util.List;

import com.ocpap.rest.entity.AdminGroup;
import com.ocpap.rest.entity.AdminMenu;

/**
 * 生成菜单列表
 * @author hewen
 * @since 2018年09月13日
 *
 */
public class MakeMenuTree {
	private List<AdminMenu> menuCommon;
	private List<AdminMenu> list =new ArrayList<AdminMenu>();
	public List<AdminMenu> menuList(List<AdminMenu> menu){
		this.menuCommon=menu;
		for(AdminMenu bean:menu){
			if(bean.getAuPid()==0){
				AdminMenu adminmenu=new AdminMenu();
				adminmenu.setAuClickable(bean.getAuClickable());
				adminmenu.setAuId(bean.getAuId());
				adminmenu.setAuLevel(bean.getAuLevel());
				adminmenu.setAuName(bean.getAuName());
				adminmenu.setAuPid(bean.getAuPid());
				adminmenu.setAuSort(bean.getAuSort());
				adminmenu.setAuTitle(bean.getAuTitle());
				adminmenu.setAuClass(bean.getAuClass());
				adminmenu.setAuInfo(bean.getAuInfo());
				adminmenu.setSub_list(menuChild(bean.getAuId()));
				list.add(adminmenu);
			}
		}
		return list;
	}

	private List<AdminMenu> menuChild(Integer auId) {
		// TODO Auto-generated method stub
		List<AdminMenu> sub_list =new ArrayList<AdminMenu>();
		for(AdminMenu bean:menuCommon){
			if(bean.getAuPid()==auId){
				AdminMenu adminmenu=new AdminMenu();
				adminmenu.setAuClickable(bean.getAuClickable());
				adminmenu.setAuId(bean.getAuId());
				adminmenu.setAuLevel(bean.getAuLevel());
				adminmenu.setAuName(bean.getAuName());
				adminmenu.setAuPid(bean.getAuPid());
				adminmenu.setAuSort(bean.getAuSort());
				adminmenu.setAuTitle(bean.getAuTitle());
				adminmenu.setAuClass(bean.getAuClass());
				adminmenu.setAuInfo(bean.getAuInfo());
				adminmenu.setSub_list(menuChild(bean.getAuId()));
				sub_list.add(adminmenu);
			}
		}
		return sub_list;
	}

	/**
	 * 生成权限列表
	 * @param ag_id
	 * @return 
	 */
	public List<AdminMenu>  makeAuthList(List<AdminMenu> menu_list, AdminGroup group_info) {
		// TODO Auto-generated method stub
		if(group_info==null){
			group_info=new AdminGroup();
			group_info.setAgAuth("0");
		}
		String auth = group_info.getAgAuth();
		String[] authlist = auth.split(",");
		for(int i=0;i<authlist.length;i++){
			makeChecked(menu_list,authlist[i]);
		}
		return menu_list;
	}
	
	/**
	 * 修改每个权限的选中状态
	 * @param list
	 * @param menu_list
	 */
	public void makeChecked(List<AdminMenu> list, String au_id){
		//顶层的 p_id=0
		name:for(AdminMenu item:list){
			//子功能权限
			if(item.getAuId()==Integer.parseInt(au_id)){
				item.setChecked(2);
			}
			for(AdminMenu bean:item.getSub_list()){
				if(bean.getAuId()==Integer.parseInt(au_id)){
					bean.setChecked(2);
					break name;
				}
			}
		}
		return;
	}
}
