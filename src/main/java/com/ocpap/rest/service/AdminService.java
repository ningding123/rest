package com.ocpap.rest.service;

import com.ocpap.rest.entity.AdminAccount;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.util.Page;

import java.util.List;

public interface AdminService {

	AdminAccount login(AdminAccount adminAccount);

	int insertAdminAccount(AdminAccount adminAccount);

	AdminAccount findAdminById(Integer amId);

	int saveUpdate(AdminAccount adminAccount);

	void changeStatus(Integer amId);
	
	public Page<AdminAccount> selectPageByQueryVo(QueryVo vo);

	boolean findAdminByLoginName(AdminAccount adminAccount);
	
	boolean findAdminByLoinAccount(AdminAccount adminAccount);

	List<AdminAccount> findAll(QueryVo vo);

	
}
