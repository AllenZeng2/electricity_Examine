package com.dlxj.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

import com.dlxj.entity.Menu;
import com.dlxj.entity.PageInfo2;
import com.dlxj.entity.Role;
import com.dlxj.entity.Users;

public interface RoleService {

	int getPage(Map<String, Object> map1);

	List<Role> getRoles(Map<String, Object> map2);

	Role getRoleById(int id);

	int updateRoleMsg(Role r);

	int delRoleById(int id);

	int addRole(Role r);

	Role getRoleWithMenuById(int id);

	List<Menu> getAllMenus();

	List<Role> getAllRole();

	void delRole_Menu(int id);

	void insertRole_Menu(String[] menu, int id);

	Role getUserByName(String name);

	Role getUserByNum(String num);

}
