package com.dlxj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
import com.dlxj.service.RoleService;

@Controller
@RequestMapping("role.do")
public class RoleController {
	@Autowired
	private RoleService rs;

	public RoleService getRs() {
		return rs;
	}

	public void setRs(RoleService rs) {
		this.rs = rs;
	}

	@RequestMapping
	public @ResponseBody
	Map<String, Object> role(String rname, int state, String pageNum) {
		if (rname.trim() == ""||rname.trim().length()==0) {
			rname = null;
		}
		PageInfo2 pi = new PageInfo2(1, 3, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("name", rname);
		map1.put("state", state);

		pi.setTotalCount(rs.getPage(map1));

		pi.setTotalPage((pi.getTotalCount() + pi.getPageSize() - 1)
				/ pi.getPageSize());

		pi.setLimit1((pi.getPageNum() - 1) * pi.getPageSize());
		pi.setLimit2(pi.getPageNum() * pi.getPageSize());

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("name", rname);
		map2.put("state", state);
		map2.put("pi", pi);

		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("list", rs.getRoles(map2));
		map3.put("pi", pi);

		return map3;

	}

	@RequestMapping(params = ("m=up"))
	public String update(int id, Model m) {
		Role r = rs.getRoleById(id);
		m.addAttribute("r", r);
		return "sys/roleManager/update.jsp";
	}

	@RequestMapping(params = ("m=update"))
	public String updateMsg(String role_id, int role_state, String role_name,
			int rid) {
		Role r = new Role();
		r.setROLE_ID(rid);
		r.setROLE_NAME(role_name);
		r.setROLE_NUMBER(role_id);
		r.setROLE_STATE(role_state);
		int num = rs.updateRoleMsg(r);
		return "sys/roleManager/index.jsp";
	}

	@RequestMapping(params = ("m=del"))
	public String del(int id) {
		int num = rs.delRoleById(id);
		return "sys/roleManager/index.jsp";
	}

	@RequestMapping(params = ("m=add"))
	public String add(HttpServletRequest request, String role_id,
			int role_state, String role_name) {
		Users u = (Users) request.getSession().getAttribute("user");
		Role r = new Role();
		r.setUSER_NAME(u.getUSER_NAME());
		r.setROLE_NAME(role_name);
		r.setROLE_NUMBER(role_id);
		r.setROLE_STATE(role_state);
		int num = rs.addRole(r);
		return "sys/roleManager/index.jsp";
	}

	@RequestMapping(params = ("m=rp"))
	public @ResponseBody
	Map<String, Object> getRoleWithMenu(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menus", rs.getAllMenus());
		Role r = rs.getRoleWithMenuById(id);
		map.put("r", r);
		return map;
	}

	@RequestMapping(params = "m=rolePermissions")
	public String rolePermissions(Model map) {
		map.addAttribute("list", rs.getAllRole());
		return "sys/rolePermissions/index.jsp";
	}

	@RequestMapping(params="m=nameTest")
	public void nameTest(HttpServletRequest request,
			HttpServletResponse response, String name, String num)
			throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		
		PrintWriter out=response.getWriter();
		Role r=rs.getUserByNum(num);
		if(r!=null){
			out.print("编号已被使用");
			return;
		}
		Role ro=rs.getUserByName(name);
		if(ro!=null){
			out.print("角色名已被使用");
			return;
		}
		out.print("1");
		
		out.close();
	}

	@RequestMapping(params = "param=ap")
	public void rolePermissions(String[] menu, int id) {
		for (int i = 0; i < menu.length; i++) {
			System.out.println(menu[i]);
		}
		rs.delRole_Menu(id);
		rs.insertRole_Menu(menu,id);
	}
}
