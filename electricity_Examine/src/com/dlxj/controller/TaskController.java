package com.dlxj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dlxj.entity.Defect;
import com.dlxj.entity.PageInfo;
import com.dlxj.entity.Pole;
import com.dlxj.entity.Receipt;
import com.dlxj.entity.Task;
import com.dlxj.entity.Users;
import com.dlxj.service.TaskService;

@Controller
@RequestMapping("task.do")
public class TaskController {
	@Autowired
	private TaskService ts;

	public TaskService getTs() {
		return ts;
	}

	public void setTs(TaskService ts) {
		this.ts = ts;
	}

	@RequestMapping(params = "param=xunjian3info")
	public String xunjian3info(ModelMap map) {
		List<Defect> list = ts.getDefects();
		map.put("list", list);
		return "xunjian/module3/index.jsp";
	}

	@RequestMapping(params = "param=shareTask")
	public String shareTask(String task_id, ModelMap map) {
		List<Users> list = ts.getXunjianYuan();
		map.put("list", list);
		map.put("task_id", task_id);
		return "xunjian/module1/share.jsp";
	}

	@RequestMapping(params = "param=xunjianyuan")
	public @ResponseBody
	Map<String, Object> shareTask(String task_id, String xunjianyuan) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("task_id", task_id);
		map.put("xunjianyuan", xunjianyuan);
		int num = ts.share(map);
		return map;
	}

	@RequestMapping(params = "param=addTask")
	public @ResponseBody
	Map<String, Object> addTask(int line_number, String task_number,
			String task_name, String user_id, String pole_start,
			String pole_stop, String xjstoptime, String user_loginname,
			String task_remark) {
		
		Task t=new Task();
		t.setLINE_ID(line_number);
		t.setTASK_BEGINPOLE(pole_start);
		t.setTASK_ENDDATE(xjstoptime);
		t.setTASK_ENDPOLE(pole_stop);
		t.setTASK_NAME(task_name);
		t.setTASK_NUMBER(task_number);
		t.setTASK_REMARK(task_remark);
		t.setTASK_STATIC(Integer.parseInt((user_id==null||user_id==""?"1":"2")));
		t.setTASK_USERNAME(user_id==null?"":user_id);
		t.setGIVE_USERNAME(user_loginname);
		
		System.out.println(t.getLINE_ID());		
		System.out.println(t.getGIVE_USERNAME());		
		System.out.println(t.getTASK_BEGINPOLE());		
		System.out.println(t.getTASK_BEGINTIME());		
		System.out.println(t.getTASK_ENDDATE());		
		System.out.println(t.getTASK_ENDPOLE());		
		System.out.println(t.getTASK_NAME());		
		System.out.println(t.getTASK_NUMBER());		
		System.out.println(t.getTASK_REMARK());		
		System.out.println(t.getTASK_USERNAME());		
		System.out.println(t.getTASK_STATIC());		


		int num =ts.addTask(t);
		Map<String, Object> map = new HashMap<String, Object>();

		return map;
	}

	@RequestMapping(params = "param=deleteTask")
	public @ResponseBody
	Task deleteTask(String task_id) {
		int num = ts.deleteTask(task_id);
		return new Task();
	}

	@RequestMapping(params = "param=share")
	public @ResponseBody
	Task shareZhiXing(String task_id) {
		int num = ts.shareZhiXing(task_id);
		return new Task();
	}

	@RequestMapping(params = "param=selectReceiptByPoleNum")
	public @ResponseBody
	Receipt selectReceiptByPoleNum(String pole_id) {
		return ts.selectReceiptByPoleNum(pole_id);
	}

	@RequestMapping(params = "param=ck_task_number")
	public @ResponseBody
	List<Task> ckTaskNumber(String task_number) {
		Task task = ts.ckTaskNumber(task_number);
		List<Task> list = new ArrayList<Task>();
		list.add(task);
		return list;
	}

	@RequestMapping(params = "param=selectTaskById")
	public String selectTaskById(int task_id, ModelMap map) {

		Task t = ts.selectTaskById(task_id);
		List<Pole> list = ts.getPoles(t);

		map.put("task", t);
		map.put("list", list);

		return "xunjian/module1/look.jsp";
	}

	@RequestMapping(params = "param=selectTask2ById")
	public String selectTask2ById(int task_id, ModelMap map) {

		Task t = ts.selectTaskById(task_id);
		List<Pole> list = ts.getPoles(t);

		map.put("task", t);
		map.put("list", list);

		return "xunjian/module2/look.jsp";
	}

	@RequestMapping(params = "param=ck_task_name")
	public @ResponseBody
	List<Task> ckTaskName(String task_name) {
		Task task = ts.ckTaskName(task_name);
		List<Task> list = new ArrayList<Task>();
		list.add(task);
		return list;
	}

	@RequestMapping(params = "param=ckPole")
	public @ResponseBody
	Map<String, Object> ckPole(int line_id) {
		String pole_start = ts.selectStartPole1ByLineid(line_id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (pole_start != null) {
			map.put("pole_start", pole_start);
			map.put("pole_end", ts.selectEndPoleByStartPole(pole_start));
			return map;
		} else {
			String pole_start2 = ts.selectStartPole2ByLineid(line_id);
			map.put("pole_start", pole_start2);
			map.put("pole_end", ts.selectEndPoleByStartPole(pole_start2));
			return map;
		}
	}

	@RequestMapping(params = "param=addTaskInfo")
	public String addTaskInfo(ModelMap map) {

		map.put("lines", ts.getLines());
		map.put("users", ts.getXunjianYuan());
		return "xunjian/module1/add.jsp";
	}

	@RequestMapping(params = "param=getTasks")
	public @ResponseBody
	Map<String, Object> getDefects(String task_number, String task_state,
			String pageNum) {
		PageInfo pi = new PageInfo(1, 5, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		pi.setLimit1();
		pi.setLimit2();

		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("task_number", task_number);
		map1.put("task_state", Integer.parseInt(task_state));

		pi.setTotleCount(ts.getTasksCount(map1));
		pi.setTotlePage((pi.getTotleCount() + 4) / 5);

		map1.put("pi", pi);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", ts.getTasks(map1));
		map2.put("pi", pi);
		return map2;
	}

	@RequestMapping(params = "param=getTasksm2")
	public @ResponseBody
	Map<String, Object> getDefectsm2(String task_number, String task_state,
			String pageNum) {
		PageInfo pi = new PageInfo(1, 5, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		pi.setLimit1();
		pi.setLimit2();

		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("task_number", task_number);
		map1.put("task_state", Integer.parseInt(task_state));

		pi.setTotleCount(ts.getTasksCountm2(map1));
		pi.setTotlePage((pi.getTotleCount() + 4) / 5);

		map1.put("pi", pi);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", ts.getTasksm2(map1));
		map2.put("pi", pi);

		return map2;
	}

	@RequestMapping(params = "param=getTasks3")
	public @ResponseBody
	Map<String, Object> getTasks3(String task_number, String receipt_typ,
			String pageNum) {
		int receipt_type = 0;
		if (receipt_typ != null && receipt_typ != "") {
			receipt_type = Integer.parseInt(receipt_typ);
		}
		PageInfo pi = new PageInfo(1, 5, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		pi.setLimit1();
		pi.setLimit2();

		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("task_number", task_number);
		map1.put("receipt_type", receipt_type);

		pi.setTotleCount(ts.getTasksCount3(map1));
		pi.setTotlePage((pi.getTotleCount() + 4) / 5);

		map1.put("pi", pi);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", ts.getTasks3(map1));
		map2.put("pi", pi);

		return map2;
	}

}
