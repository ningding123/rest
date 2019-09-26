package com.ocpap.rest.mapper;

import java.util.List;
import com.ocpap.rest.entity.AdminMenu;
import com.ocpap.rest.entity.QueryVo;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMenuMapper {
	int deleteByPrimaryKey(Integer auId);
    int insertSelective(AdminMenu record);
    AdminMenu selectByPrimaryKey(Integer auId);
    int updateByPrimaryKeySelective(AdminMenu record);
    int updateByPrimaryKey(AdminMenu record);
    List<AdminMenu> getAuthList();
	List<AdminMenu> selectPageByQueryVo(QueryVo vo);
	int CountByQueryVo(QueryVo vo);
	List<AdminMenu> getMenuList();
}