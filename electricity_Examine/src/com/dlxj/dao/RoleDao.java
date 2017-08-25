package com.dlxj.dao;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Menu;
import com.dlxj.entity.Role;
import com.dlxj.entity.Users;

public interface RoleDao {

	int getPage(Map<String, Object> map1);

	List<Role> getRoles(Map<String, Object> map2);

	Role getRoleById(int id);

	int updateRoleMsg(Role r);

	int delRoleById(int id);

	int addRole(Role r);

	Role getRoleWithMenuById(int id);

	List<Menu> getAllMenus();

	List<Role> getAllRole();

	int insertRole_Menu(String[] menu);

	void delRole_Menu(int id);

	void insertRole_Menu(Map<String, Object> map);

	Role getUserByName(String name);

	Role getUserByNum(String num);

}
