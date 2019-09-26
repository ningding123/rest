package com.ocpap.rest.serviceImpl;

import java.util.List;

import com.ocpap.rest.entity.AdminGroup;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.mapper.AdminGroupMapper;
import com.ocpap.rest.service.AdminGroupService;
import com.ocpap.rest.util.Instant;
import com.ocpap.rest.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminGroupServiceImpl implements AdminGroupService {

	@Autowired
	private AdminGroupMapper adminGroupMapper;

	@Override
	public AdminGroup getGroupInfo(Integer agid) {
		// TODO Auto-generated method stub
		AdminGroup admingroup = adminGroupMapper.selectByPrimaryKey(agid);
		return admingroup;
	}
	@Override
	public Page<AdminGroup> selectPageByQueryVo(QueryVo vo) {
		// TODO Auto-generated method stub
		Page<AdminGroup> page = new Page<AdminGroup>();
		//每页数
		vo.setSize(Instant.NEWSSIZE);
		if (null != vo) {
			// 判断当前页
			if (null != vo.getPage()) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() -1)*vo.getSize());
			}
			if(null != vo.getAgName()){
				vo.setAgName(vo.getAgName().trim());
			}
			//总条数
			page.setTotal(adminGroupMapper.CountByQueryVo(vo));
			page.setRows(adminGroupMapper.selectPageByQueryVo(vo));
		}
		return page;
	}
	@Override
	public int insertSelective(AdminGroup admingroup) {
		// TODO Auto-generated method stub
		int ret=adminGroupMapper.insertSelective(admingroup);
		return ret;
	}
	@Override
	public int updateByPrimaryKeySelective(AdminGroup admingroup) {
		// TODO Auto-generated method stub
		int ret=adminGroupMapper.updateByPrimaryKeySelective(admingroup);
		return ret;
	}
	@Override
	public List<AdminGroup> getAllGroup() {
		// TODO Auto-generated method stub
		return adminGroupMapper.selectAllGroup();
	}
}
