package com.dlxj.service;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Menu;
import com.dlxj.entity.Role;

public interface MenuService {

	int getPage(String mname);

	List<Menu> getMenu(Map<String, Object> map1);

	int delMenuById(int id);

	List<Menu> getMenusList();

	int addMenu(Map<String, Object> map);

	Menu getMenuById(int id);

	int UpdateMenu(Menu m);

	Menu getMenuByName(String uname);

}
