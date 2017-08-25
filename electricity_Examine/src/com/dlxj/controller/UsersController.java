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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dlxj.entity.PageInfo2;
import com.dlxj.entity.Role;
import com.dlxj.entity.Users;
import com.dlxj.service.UsersService;

@Controller
@RequestMapping("users.do")
@SessionAttributes("user")
public class UsersController {
	@Autowired
	private UsersService us;

	public UsersService getUs() {
		return us;
	}

	public void setUs(UsersService us) {
		this.us = us;
	}

	@RequestMapping(params = "m=exit")
	public String exit(HttpServletRequest request, ModelMap map) {
		Users u = (Users) request.getSession().getAttribute("user");
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("uname", u.getUSER_NAME());
		map1.put("muname", "退出系统");
		us.savelog(map1);
		map.clear();
		return "redirect:login.jsp";
	}

	@RequestMapping(params = "m=s")
	public @ResponseBody
	Map<String, Object> user(String uname, int state, String pageNum) {
		if (uname.trim() == "" || uname.trim().length() == 0) {
			uname = null;
		}
		PageInfo2 pi = new PageInfo2(1, 2, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}

		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("name", uname);
		map1.put("state", state);

		pi.setTotalCount(us.getUserPage(map1));
		pi.setTotalPage((pi.getTotalCount() + pi.getPageSize() - 1)
				/ pi.getPageSize());

		pi.setLimit1((pi.getPageNum() - 1) * pi.getPageSize());
		pi.setLimit2(pi.getPageNum() * pi.getPageSize());

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("name", uname);
		map2.put("state", state);
		map2.put("pi", pi);

		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("list", us.getUserManage(map2));
		map3.put("pi", pi);

		return map3;
	}

	@RequestMapping(params = "m=a")
	public String gets(Model m) {
		List<Role> list = us.getUsersList();
		m.addAttribute("list", list);
		return "sys/userManager/add.jsp";
	}

	@RequestMapping(params = "m=add")
	public String add(String user_id, String user_name, String user_password,
			int user_sex, int user_age, int role_id, String user_intime,
			int user_state, String user_email, String user_phone) {
		Users u = new Users();
		u.setUSER_LOGINNAME(user_id);
		u.setUSER_NAME(user_name);
		u.setUSER_PASSWORD(user_password);
		u.setUSER_SEX(user_sex);
		u.setUSER_AGE(user_age);
		u.setROLE_ID(role_id);
		u.setUSER_INTIME(user_intime);
		u.setUSER_STATE(user_state);
		u.setUSER_EMAIL(user_email);
		u.setUSER_PHONE(user_phone);
		int num = us.addUsers(u);

		return "sys/userManager/index.jsp";
	}

	@RequestMapping(params = "m=state")
	public void updateState(HttpServletResponse response, int id)
			throws IOException {
		int state = us.getStateById(id);
		state = (state + 1) % 2;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("state", state);
		int num = us.updateSdateById(map);

		PrintWriter out = response.getWriter();
		out.print(state);
		out.close();
	}

	@RequestMapping(params = "m=del")
	public String del(int id) {
		int num = us.delUserById(id);
		return "sys/userManager/index.jsp";
	}

	@RequestMapping(params = "m=nameTest")
	public void nameTest(HttpServletRequest request,
			HttpServletResponse response, String name) throws IOException {
		Users u = us.getUserByLoginName(name);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (u != null) {
			out.print("登录账号已被使用！");
		} else
			out.print("1");
		out.close();
	}

	@RequestMapping(params = ("m=up"))
	public String up(int id, Model m) {

		Users u = us.getUserById(id);
		List<Role> list = us.getUsersList();
		m.addAttribute("list", list);
		m.addAttribute("u", u);
		return "sys/userManager/update.jsp";
	}

	@RequestMapping(params = ("m=update"))
	public String update(String user_id, String user_name,
			String user_password, int user_sex, int user_age, int role_id,
			String user_intime, int user_state, String user_email,
			String user_phone, int id) {
		Users u = new Users();
		u.setUSER_ID(id);
		u.setUSER_LOGINNAME(user_id);
		u.setUSER_NAME(user_name);
		u.setUSER_PASSWORD(user_password);
		u.setUSER_SEX(user_sex);
		u.setUSER_AGE(user_age);
		u.setROLE_ID(role_id);
		u.setUSER_INTIME(user_intime.substring(0, 10));
		u.setUSER_STATE(user_state);
		u.setUSER_EMAIL(user_email);
		u.setUSER_PHONE(user_phone);
		int num = us.updateMsg(u);

		return "sys/userManager/index.jsp";
	}

	@RequestMapping(params = "m=self")
	public String self(HttpServletRequest request, Model m) {
		Users u = (Users) request.getSession().getAttribute("user");
		m.addAttribute("u", us.getUserById(u.getUSER_ID()));
		return "mywork/user.jsp";
	}

	@RequestMapping(params = "u=updateSelf")
	public void updateSelf(Users u) {
		int num = us.updateSelf(u);
		if (num > 0) {
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("uname", u.getUSER_NAME());
			map1.put("muname", "修改个人信息成功！");
			us.savelog(map1);
		}
	}

	@RequestMapping(params = "m=upPwd")
	public String upPwd(HttpServletRequest request, Model m) {
		Users u = (Users) request.getSession().getAttribute("user");
		m.addAttribute("u", us.getUserById(u.getUSER_ID()));
		return "mywork/updatePassword.jsp";
	}

	@RequestMapping(params = "u=uppwd")
	public void upPwd(String pwd, int uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pwd", pwd);
		map.put("uid", uid);
		us.upPwd(map);
	}

	@RequestMapping(params = "log=see")
	public @ResponseBody
	Map<String, Object> log(int id, String log1, String log2, String pageNum) {
		System.out.println(id);
		if (log1 == "") {
			log1 = null;
		}
		if (log2 == "") {
			log2 = null;
		}
		PageInfo2 pi = new PageInfo2(1, 5, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}

		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("log1", log1);
		map1.put("log2", log2);
		map1.put("id", id);

		pi.setTotalCount(us.getUserLogPage(map1));

		pi.setTotalPage((pi.getTotalCount() + pi.getPageSize() - 1)
				/ pi.getPageSize());

		pi.setLimit1((pi.getPageNum() - 1) * pi.getPageSize());
		pi.setLimit2(pi.getPageNum() * pi.getPageSize());

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("id", id);
		map2.put("log1", log1);
		map2.put("log2", log2);
		map2.put("pi", pi);

		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("list", us.getLogManage(map2));
		map3.put("pi", pi);

		return map3;

	}

	@RequestMapping(params = "m=savelog")
	public void savelog(HttpServletRequest request, String uname) {
		Users u = (Users) request.getSession().getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uname", u.getUSER_NAME());
		map.put("muname", uname);
		us.savelog(map);
	}
}
