package com.dlxj.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dlxj.entity.Users;
import com.dlxj.service.UsersService;

@Controller
@RequestMapping("users.dd")
@SessionAttributes("user")
public class LoginController {
	@Autowired
	private UsersService us;

	public UsersService getUs() {
		return us;
	}

	public void setUs(UsersService us) {
		this.us = us;
	}

	@RequestMapping
	public String login(String user_loginname, String user_password,
			ModelMap map) throws IOException {
		if (user_loginname == null || user_loginname == "") {
			return "redirect:login.jsp";
		}
		Map<String, String> m = new HashMap<String, String>();

		m.put("user_loginname", user_loginname);
		m.put("user_password", user_password);

		Users u = us.login(m);
		if (u == null) {
			map.addAttribute("user", "用户名密码错误！");
			return "redirect:login.jsp";
		} else if(u.getUSER_STATE()==1){
			map.addAttribute("user", "该账户以被冻结，请和管理员联系！");
			return "redirect:login.jsp";
		}else{
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("uname", u.getUSER_NAME());
			map1.put("muname", "登录系统");
			us.savelog(map1);
			us.updateLoginTime(u.getUSER_ID());
			map.put("user", u);
			return "index.jsp";
		}
	}
}
