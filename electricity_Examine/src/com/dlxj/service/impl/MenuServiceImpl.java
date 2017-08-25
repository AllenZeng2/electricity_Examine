package com.dlxj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlxj.dao.MenuDao;
import com.dlxj.entity.Menu;
import com.dlxj.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDao md;

	public MenuDao getMd() {
		return md;
	}

	public void setMd(MenuDao md) {
		this.md = md;
	}

	@Override
	public Menu getMenuByName(String uname) {
		// TODO Auto-generated method stub
		return md.getMenuByName(uname);
	}

	@Override
	public int UpdateMenu(Menu m) {
		// TODO Auto-generated method stub
		return md.UpdateMenu(m);
	}

	@Override
	public Menu getMenuById(int id) {
		// TODO Auto-generated method stub
		return md.getMenuById(id);
	}

	@Override
	public int addMenu(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return md.addMenu(map);
	}

	@Override
	public List<Menu> getMenusList() {
		// TODO Auto-generated method stub
		return md.getMenusList();
	}

	@Override
	public int delMenuById(int id) {
		// TODO Auto-generated method stub
		return md.delMenuById(id);
	}

	@Override
	public List<Menu> getMenu(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return md.getMenu(map1);
	}

	@Override
	public int getPage(String mname) {
		// TODO Auto-generated method stub
		return md.getPage(mname);
	}
}
