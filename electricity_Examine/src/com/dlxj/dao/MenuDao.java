package com.dlxj.dao;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Menu;

public interface MenuDao {

	List<Menu> getMenu(Map<String, Object> map1);

	int getPage(String mname);

	int delMenuById(int id);

	List<Menu> getMenusList();

	int addMenu(Map<String, Object> map);

	Menu getMenuById(int id);

	int UpdateMenu(Menu m);

	Menu getMenuByName(String uname);

}
