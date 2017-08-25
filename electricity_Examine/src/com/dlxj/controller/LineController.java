package com.dlxj.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dlxj.entity.Line;
import com.dlxj.entity.PageInfo;
import com.dlxj.entity.Pole;
import com.dlxj.service.LineService;
import com.dlxj.service.PoleService;
import com.dlxj.service.TaskService;

@Controller
@RequestMapping("line.do")
public class LineController {

	@Autowired
	private LineService ls;

	public LineService getLs() {
		return ls;
	}

	public void setLs(LineService ls) {
		this.ls = ls;
	}

	@Autowired
	private PoleService ps;

	public PoleService getPs() {
		return ps;
	}

	public void setPs(PoleService ps) {
		this.ps = ps;
	}

	@Autowired
	private TaskService ts;

	public TaskService getTs() {
		return ts;
	}

	public void setTs(TaskService ts) {
		this.ts = ts;
	}

	// m=1是line表的全查和模糊查询
	@RequestMapping(params = "m=1")
	public @ResponseBody
	Map<String, Object> LineList(PageInfo pi, String conliname) {

		pi.setPageSize(5);
		if (pi.getPageNum() == null || pi.getPageNum() < 1) {
			pi.setPageNum(1);
		}

		pi.setLimit1();
		pi.setLimit2();

		pi.setTotleCount(ls.getCount(conliname));
		pi.setTotlePage((pi.getTotleCount() + 4) / 5);
		if (pi.getPageNum() >= pi.getTotlePage()) {
			pi.setPageNum(pi.getTotlePage());
		}
		if (conliname == null) {
			conliname = "";

		}

		Map<String, Object> m = new HashMap<String, Object>();

		Map<String, Object> map = new HashMap<String, Object>();
		m.put("pi", pi);
		m.put("con", conliname);
		List<Line> list = ls.getLineList(m);

		/*
		 * for (Line line : list) { System.out.println(line.toString()); }
		 */
		map.put("linelist", list);
		map.put("pi", pi);

		return map;
	}

	// 设置一个id用作line表新增时候的主键
	/*
	 * static int lid = 55; // 用作pole表新增时候的主键 static int pid = 159;
	 */
	// 新增线路
	@RequestMapping(params = "m=2")
	public String add(Line line) {

		// 向line表中添加线路
		/* line.setLineId(lid++); */
		/* System.out.println(line.getLineId()); */
		line.setLineDel(0);
		line.setLineState("0");
		// int intvo = Integer.parseInt(lineVoltage);

		// 获取java的时间将其转化成字符串类型，并封装到line对象中
		// line.setLineVoltage(intvo);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = sdf.format(d);
		line.setLineCreatedate(nowdate);
		System.out.println(line.toString());
		// 向数据库中增加线路
		ls.addNewLine(line);
		Line line2 = ls.getLineByNumber(line.getLineNumber());

		// 添加塔杆
		// 获取第一个杆的信息
		String start = line2.getPoleStar();
		/*System.out.println("获取第一个杆的信息" + start);*/
		// 获取最后一个杆的信息
		String stop = line2.getPoleStop();
		/*System.out.println("获取最后一个杆的信息" + stop);*/
		// 将杆号从字符串中提取出来
		int ss = Integer.parseInt(start.substring(6));
		/*System.out.println("将第一个杆号从字符串中提取出来" + ss);*/
		int st = Integer.parseInt(stop.substring(6));
		/*System.out.println("最后一个杆号" + st);*/
		// 将所要拼接到杆号名称的前一部分提取出来
		String jia = start.substring(0, 6);
		// 输出杆号信息和塔杆名称字符串的信息
	/*	System.out.println("前面的部分" + jia);
		System.out.println("后边的部分1" + ss);
		System.out.println("后边的部分2" + st);*/
		// 记录一共有多少跟塔杆
		// x是塔杆号
		int x = ss;
		for (int i = ss; i <= st; i++) {

			int c = x;

			// 计算传过来的杆号是几位数()
			int temp, b = 0;
			for (; c != 0; b++) {
				temp = c % 10;
				c /= 10;
			}
			System.out.println("计算传过来的杆号是几位数" + b);
			// 定义杆的名称
			String name = jia;
			// 在拼接的杆的名称字符串之后添加0
			for (int a = 0; a <= 5 - b; a++) {
				name = name + "0";
			}
			// 在添加好的塔杆的名称后追加杆号,int类型的对象自动转化成字符串类型
			name = name + x;

			// 将杆的信息封装到pole对象中
			Pole p = new Pole();

			p.setLINE_ID(line2.getLineId());
			p.setPOLE_NUMBER(name);
			// 循环调用增加杆的方法，向数据库中增加塔杆
			ps.addPole(p);
			// 将杆号加一，
			x++;

		}

		return "line/line.jsp";
	}

	// ajax修改线路禁用启用状态的
	@RequestMapping(params = "m=3")
	public @ResponseBody
	int qiyong(int lineId, int lineStatic) {

		/* System.out.println(lineStatic==0?"启用":"禁用"); */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lineId", lineId);
		map.put("lineStatic", lineStatic);
		/*
		 * System.out.println(lineId); System.out.println(lineStatic);
		 */
		ls.updateStatic(map);
		/* System.out.println(lineStatic==1?"启用":"禁用"); */
		/* System.out.println("conmm"+mm); */

		return lineStatic == 0 ? 1 : 0;

	}

	// 做线路的状态删除
	@RequestMapping(params = "m=4")
	public @ResponseBody
	int jiadel(int lineId) {
		int x = ls.jiaDel(lineId);
		return x;
	}

	// 线路信息的修改，从主页跳转到修改页面所需要的方法(从数据库进行单查)
	@RequestMapping(params = "m=5")
	public String edit1(int lineId, ModelMap map) {
		System.out.println(lineId);

		// 记录巡检表和消缺表中是否涉及到某个线路，若涉及到则在页面有所显示
		int d = 0;
		Line line = ls.getLineById(lineId);

		List<String> list = ts.getTaskIdByLineId(lineId);
		d = list.size() > 0 ? d + 1 : d;
		List<String> list2 = ls.getdeTaskidByLineId(lineId);
		d = list2.size() > 0 ? d + 1 : d;

		map.put("line", line);
		map.put("dd", d);
		return "line/line_edit.jsp";
	}

	@RequestMapping(params = "m=6")
	public String edit2(Line line) {

		int dd = ls.updateLine(line);

		return "line/line.jsp";
	}

	// 用ajax做判断用户名是否可用
	@RequestMapping(params = "m=7")
	public @ResponseBody
	int form1(String lineName) {
		System.out.println(lineName);
		Line line = ls.getLineByLineByName(lineName);
		return line == null ? 1 : 0;
	}

}
