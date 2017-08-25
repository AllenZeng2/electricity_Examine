package com.dlxj.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlxj.dao.UsersDao;
import com.dlxj.entity.Log;
import com.dlxj.entity.Role;
import com.dlxj.entity.Users;
import com.dlxj.service.UsersService;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao ud;

	public UsersDao getUd() {
		return ud;
	}

	public void setUd(UsersDao ud) {
		this.ud = ud;
	}

	@Override
	public void updateLoginTime(int id) {
		// TODO Auto-generated method stub
		ud.updateLoginTime(id);
	}

	@Override
	public List<Log> getLogManage(Map<String, Object> map2) {
		// TODO Auto-generated method stub
		return ud.getLogManage(map2);
	}

	@Override
	public void savelog(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ud.savelog(map);
	}

	@Override
	public int getUserLogPage(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return ud.getUserLogPage(map1);
	}

	@Override
	public void upPwd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ud.upPwd(map);
	}

	@Override
	public int updateSelf(Users u) {
		// TODO Auto-generated method stub
		return ud.updateSelf(u);
	}

	@Override
	public int updateMsg(Users u) {
		// TODO Auto-generated method stub
		return ud.updateMsg(u);
	}

	@Override
	public Users getUserById(int id) {
		// TODO Auto-generated method stub
		return ud.getUserById(id);
	}

	@Override
	public Users getUserByLoginName(String name) {
		// TODO Auto-generated method stub
		return ud.getUserByLoginName(name);
	}

	@Override
	public int delUserById(int id) {
		// TODO Auto-generated method stub
		return ud.delUserById(id);
	}

	@Override
	public int addUsers(Users u) {
		// TODO Auto-generated method stub
		return ud.addUsers(u);
	}

	@Override
	public int updateSdateById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ud.updateSdateById(map);
	}

	@Override
	public int getStateById(int id) {
		// TODO Auto-generated method stub
		return ud.getStateById(id);
	}

	@Override
	public List<Role> getUsersList() {
		// TODO Auto-generated method stub
		return ud.getUsersList();
	}

	@Override
	public Users login(Map<String, String> m) {
		return ud.login(m);
	}

	@Override
	public int getUserPage(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return ud.getUserPage(map1);
	}

	@Override
	public List<Users> getUserManage(Map<String, Object> map2) {
		// TODO Auto-generated method stub
		return ud.getUserManage(map2);
	}

}
