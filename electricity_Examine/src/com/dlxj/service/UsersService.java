package com.dlxj.service;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Log;
import com.dlxj.entity.Role;
import com.dlxj.entity.Users;

public interface UsersService {


	Users login(Map<String, String> m);

	int getUserPage(Map<String, Object> map1);

	List<Users> getUserManage(Map<String, Object> map2);

	List<Role> getUsersList();

	int getStateById(int id);

	int updateSdateById(Map<String, Object> map);

	int addUsers(Users u);

	int delUserById(int id);

	Users getUserByLoginName(String name);

	Users getUserById(int id);

	int updateMsg(Users u);

	int updateSelf(Users u);

	void upPwd(Map<String, Object> map);

	int getUserLogPage(Map<String, Object> map1);

	void savelog(Map<String, Object> map);

	List<Log> getLogManage(Map<String, Object> map2);

	void updateLoginTime(int id);

}
