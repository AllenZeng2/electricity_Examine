package com.dlxj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.dlxj.dao.RoleDao;
import com.dlxj.entity.Menu;
import com.dlxj.entity.PageInfo;
import com.dlxj.entity.PageInfo2;
import com.dlxj.entity.Role;
import com.dlxj.entity.Users;
import com.dlxj.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao rd;

	public RoleDao getRd() {
		return rd;
	}

	public void setRd(RoleDao rd) {
		this.rd = rd;
	}
	@Override
	public Role getUserByNum(String num) {
		// TODO Auto-generated method stub
		return rd.getUserByNum(num);
	}

	@Override
	public Role getUserByName(String name) {
		// TODO Auto-generated method stub
		return rd.getUserByName(name);
	}

	@Override
	public void insertRole_Menu(String[] menu, int id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		for (int i = 0; i < menu.length; i++) {
			map.put("menu", menu[i]);
			rd.insertRole_Menu(map);
		}
	}

	@Override
	public void delRole_Menu(int id) {
		// TODO Auto-generated method stub
		rd.delRole_Menu(id);
	}

	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		return rd.getAllRole();
	}

	@Override
	public List<Menu> getAllMenus() {
		// TODO Auto-generated method stub
		return rd.getAllMenus();
	}

	@Override
	public Role getRoleWithMenuById(int id) {
		// TODO Auto-generated method stub
		return rd.getRoleWithMenuById(id);
	}

	@Override
	public int addRole(Role r) {
		// TODO Auto-generated method stub
		return rd.addRole(r);
	}

	@Override
	public int delRoleById(int id) {
		// TODO Auto-generated method stub
		return rd.delRoleById(id);
	}

	@Override
	public int updateRoleMsg(Role r) {
		// TODO Auto-generated method stub
		return rd.updateRoleMsg(r);
	}

	@Override
	public Role getRoleById(int id) {
		// TODO Auto-generated method stub
		return rd.getRoleById(id);
	}

	@Override
	public List<Role> getRoles(Map<String, Object> map2) {
		// TODO Auto-generated method stub
		return rd.getRoles(map2);
	}

	@Override
	public int getPage(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return rd.getPage(map1);
	}
}
