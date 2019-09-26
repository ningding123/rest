package com.ocpap.rest.serviceImpl;

import com.ocpap.rest.entity.AdminAccount;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.mapper.AdminMapper;
import com.ocpap.rest.service.AdminService;
import com.ocpap.rest.util.Instant;
import com.ocpap.rest.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public AdminAccount login(AdminAccount adminAccount) {
		AdminAccount admin = adminMapper.findUserByNameAndPwd(adminAccount);
		return admin;
	}

	@Override
	public int insertAdminAccount(AdminAccount adminAccount) {
		// TODO Auto-generated method stub
		return adminMapper.insertAdmin(adminAccount);
	}

	@Override
	public AdminAccount findAdminById(Integer amId) {
		// TODO Auto-generated method stub
		return adminMapper.findAdminById(amId);
	}

	@Override
	public int saveUpdate(AdminAccount adminAccount) {
		// TODO Auto-generated method stub
		return adminMapper.saveUpdate(adminAccount);
	}

	@Override
	public void changeStatus(Integer amId) {
		// TODO Auto-generated method stub
		AdminAccount account = adminMapper.findAdminById(amId);
		if(account.getuStatus()){
			account.setuStatus(false);
		}else{
			account.setuStatus(true);
		}
		adminMapper.saveUpdate(account);
		
	}
	
		// 通过2个条件 查询分页对象
		@Override
		public Page<AdminAccount> selectPageByQueryVo(QueryVo vo) {
			Page<AdminAccount> page = new Page<AdminAccount>();
			//每页数
			vo.setSize(Instant.NEWSSIZE);
			if (null != vo) {
				// 判断当前页
				if (null != vo.getPage()) {
					page.setPage(vo.getPage());
					vo.setStartRow((vo.getPage() -1)*vo.getSize());
				}
				if(null != vo.getAmName() && !"".equals(vo.getAmName().trim())){
					vo.setAmName(vo.getAmName().trim());
				}
				//总条数
				page.setTotal(adminMapper.adminCountByQueryVo(vo));
				page.setRows(adminMapper.selectAdminListByQueryVo(vo));
			}
			return page;

		}

		@Override
		public boolean findAdminByLoginName(AdminAccount adminAccount) {
			// TODO Auto-generated method stub
			
			AdminAccount account =  adminMapper.findUserByNameAndPwd(adminAccount);
			
			return account!=null?true:false;
		}

		@Override
		public boolean findAdminByLoinAccount(AdminAccount adminAccount) {
			// TODO Auto-generated method stub
			AdminAccount account =  adminMapper.findUserByNameAndPwd(adminAccount);
			return  account==null?true:false;
		}

	@Override
	public List<AdminAccount> findAll(QueryVo vo) {
		return adminMapper.findAllAccount();
	}

}
