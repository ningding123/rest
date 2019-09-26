package com.ocpap.rest.mapper;

import java.util.List;
import com.ocpap.rest.entity.AdminAccount;
import com.ocpap.rest.entity.QueryVo;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {

	/**
	 * 根据用户名和密码查询用户
	 * @param adminAccount
	 * @return
	 */
	public AdminAccount findUserByNameAndPwd(AdminAccount adminAccount);

	/**
	 * 添加管理员
	 * @return 
	 */
	public int insertAdmin(AdminAccount adminAccount);

	public AdminAccount findAdminById(Integer amId);

	public int saveUpdate(AdminAccount adminAccount);

	public int adminCountByQueryVo(QueryVo vo);

	public List<AdminAccount> selectAdminListByQueryVo(QueryVo vo);

	public List<AdminAccount> findAllAccount();
	
	
}
