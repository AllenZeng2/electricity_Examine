package com.dlxj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dlxj.entity.Menu;
import com.dlxj.entity.PageInfo2;
import com.dlxj.entity.Role;
import com.dlxj.entity.Users;
import com.dlxj.service.MenuService;

@Controller
@RequestMapping("menu.do")
public class MenuController {

	@Autowired
	private MenuService ms;

	public MenuService getMs() {
		return ms;
	}

	public void setMs(MenuService ms) {
		this.ms = ms;
	}

	@RequestMapping
	public @ResponseBody
	Map<String, Object> getMenus(String mname, String pageNum) {
		if (mname.trim() == "" || mname.trim().length() == 0) {
			mname = null;
		}
		PageInfo2 pi = new PageInfo2(1, 3, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		pi.setTotalCount(ms.getPage(mname));
		pi.setTotalPage((pi.getTotalCount() + pi.getPageSize() - 1)
				/ pi.getPageSize());
		pi.setLimit1((pi.getPageNum() - 1) * pi.getPageSize());
		pi.setLimit2(pi.getPageNum() * pi.getPageSize());

		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("mname", mname);
		map1.put("pi", pi);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", ms.getMenu(map1));
		map2.put("pi", pi);

		return map2;
	}

	@RequestMapping(params = ("m=del"))
	public String del(int id) {
		int num = ms.delMenuById(id);
		return "sys/menu/index.jsp";
	}

	@RequestMapping(params = ("m=a"))
	public String gets(Model m) {
		List<Menu> list = ms.getMenusList();
		m.addAttribute("list", list);
		return "sys/menu/add.jsp";
	}

	@RequestMapping(params = "m=add")
	public String add(HttpServletRequest request, String menu_name,
			String menu_fatherid, String menu_url, String menu_state) {
		Users u = (Users) request.getSession().getAttribute("user");
		String user_name = u.getUSER_NAME();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu_name", menu_name);
		map.put("menu_fatherid", menu_fatherid);
		map.put("menu_url", menu_url);
		map.put("menu_state", menu_state);
		map.put("user_name", user_name);
		int num = ms.addMenu(map);
		return "sys/menu/index.jsp";
	}

	@RequestMapping(params = ("m=up"))
	public String update(int id, Model m) {
		Menu me = ms.getMenuById(id);
		List<Menu> list = ms.getMenusList();
		m.addAttribute("list", list);
		m.addAttribute("me", me);
		return "sys/menu/update.jsp";
	}

	@RequestMapping(params = ("m=update"))
	public String updateMsg(String menu_url, int menu_fatherid,
			String menu_name, int rid, int menu_state) {
		Menu m = new Menu();
		m.setMENU_ID(rid);
		m.setMENU_NAME(menu_name);
		m.setMENU_FATHERID(menu_fatherid);
		m.setMENU_URL(menu_url);
		m.setMENU_STATE(menu_state);
		int num = ms.UpdateMenu(m);
		return "sys/menu/index.jsp";
	}

	@RequestMapping(params = "m=nameTest")
	public void nameTest(HttpServletRequest request,
			HttpServletResponse response, String uname)
			throws IOException {
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		Menu m = ms.getMenuByName(uname);
		if (m != null) {
			out.print("编号已被使用");
			return;
		}
		out.print("1");

		out.close();
	}
}
