package com.ocpap.rest.service;

import java.util.List;
import com.ocpap.rest.entity.AdminGroup;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.util.Page;

public interface AdminGroupService {
	Page<AdminGroup> selectPageByQueryVo(QueryVo vo);
	AdminGroup getGroupInfo(Integer agid);
	int insertSelective(AdminGroup admingroup);
	int updateByPrimaryKeySelective(AdminGroup admingroup);
	List<AdminGroup> getAllGroup();
	
}
