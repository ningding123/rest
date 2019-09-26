package com.ocpap.rest.mapper;

import com.ocpap.rest.entity.AdminGroup;
import com.ocpap.rest.entity.QueryVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminGroupMapper {

    int insertSelective(AdminGroup record);

    List<AdminGroup> selectPageByQueryVo(QueryVo vo);

    AdminGroup selectByPrimaryKey(Integer agId);

    int updateByPrimaryKeySelective(AdminGroup record);
    
	int CountByQueryVo(QueryVo vo);
	
	List<AdminGroup> selectAllGroup();
    
}