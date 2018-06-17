package com.yan.user.service;

import com.yan.common.service.IService;
import com.yan.model.TUser;

/**
 * 
 * @author yan 2018年3月18日
 *
 */
public interface IUserService extends IService<TUser> {
	
	TUser login(TUser user);

	int register(TUser user);
	
	boolean checkUserByName(String name);
	
	int updatePassword(TUser user);
}
