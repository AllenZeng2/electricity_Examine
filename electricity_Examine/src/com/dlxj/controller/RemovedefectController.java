package com.dlxj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dlxj.entity.Defect;
import com.dlxj.entity.Line;
import com.dlxj.entity.PageInfo;
import com.dlxj.entity.Receipt;
import com.dlxj.entity.Removedefect;
import com.dlxj.entity.RemovedefectCondition;
import com.dlxj.entity.Users;
import com.dlxj.service.RemovedefectService;

@Controller
@RequestMapping("remo.do")
public class RemovedefectController {
	@Autowired
	private RemovedefectService rs;

	public RemovedefectService getRs() {
		return rs;
	}

	public void setRs(RemovedefectService rs) {
		this.rs = rs;
	}
	
	 
	//获得消缺任务列表(制定与分配)
	@RequestMapping(params="method=getRemovedefect1")
	public @ResponseBody Map<String, Object> getRemovedefect1(RemovedefectCondition rc,String pageNum){
		if(rc.getTask_number()=="")
			rc.setTask_number(null);
		if(rc.getUser_id()=="")
			rc.setUser_id(null);
		if(rc.getTask_begintime()=="")
			rc.setTask_begintime(null);
		if(rc.getTask_endtime()=="")
			rc.setTask_endtime(null);
		PageInfo pi=new PageInfo(1, 2, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		pi.setLimit1();
		pi.setLimit2();
	
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("rc", rc);
		pi.setTotleCount(rs.getRemovedefectCount1(map1));
		pi.setTotlePage((pi.getTotleCount() + pi.getPageSize()-1) / pi.getPageSize());
		
		map1.put("pi", pi);
		List<Removedefect> list=rs.getRemovedefect1(map1);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("pi", pi);
		return map2;
	}
	
	//获得消缺任务列表(执行与回执)
	@RequestMapping(params="method=getRemovedefect2")
	public @ResponseBody Map<String, Object> getRemovedefect2(RemovedefectCondition rc,String pageNum){
		if(rc.getTask_number()=="")
			rc.setTask_number(null);
		if(rc.getLine_name()=="")
			rc.setLine_name(null);
		if(rc.getTask_begintime()=="")
			rc.setTask_begintime(null);
		if(rc.getTask_endtime()=="")
			rc.setTask_endtime(null);
		PageInfo pi=new PageInfo(1, 2, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		pi.setLimit1();
		pi.setLimit2();

		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("rc", rc);
		pi.setTotleCount(rs.getRemovedefectCount2(map1));
		pi.setTotlePage((pi.getTotleCount() + pi.getPageSize()-1) / pi.getPageSize());
		
		map1.put("pi", pi);
		List<Removedefect> list=rs.getRemovedefect2(map1);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("pi", pi);
		return map2;
	}
	
	//消缺查询
	@RequestMapping(params="method=selectRemovedefect")
	public @ResponseBody Map<String, Object> selectRemovedefect(String task_number,String task_type,String pageNum){
		if(task_number=="")
			task_number=null;
		int ta=0;
		if(task_type!=null&&task_type!="")
			ta=Integer.parseInt(task_type);
		PageInfo pi=new PageInfo(1, 2, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		pi.setLimit1();
		pi.setLimit2();

		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("task_number", task_number);
		map1.put("defect_id", ta);
		
		pi.setTotleCount(rs.selectRemovedefectCount(map1));
		pi.setTotlePage((pi.getTotleCount() + pi.getPageSize()-1) / pi.getPageSize());
		
		map1.put("pi", pi);
		Map<String, Object> map2 = new HashMap<String, Object>();
		List<Removedefect> list=rs.selectRemovedefect(map1);
		map2.put("list", list);
		map2.put("pi", pi);
		return map2;
	}
	
	//获得缺陷
	@RequestMapping(params="method=getDefects")
	public @ResponseBody Map<String, Object> getDefects(){
		Map<String, Object> map=new HashMap<String, Object>();
		List<Defect> list=rs.getDefects();
		map.put("list", list);
		return map;
	}

	
	//查看消缺任务
	@RequestMapping(params="method=selectTaskByNumber")
	public @ResponseBody Map<String, Object> selectTaskByNumber(String task_number){
		Map<String, Object> map=new HashMap<String, Object>();
		List<Removedefect> list=rs.selectTaskByNumber(task_number);
		map.put("list", list);
		for (Removedefect r : list) {
			System.out.println("222");
			System.out.println(r.getReceipt().getDefect_desc()+","+r.getGiveperson_name()+","+r.getReceipt().getDefects().getDEFECT_NAME());
		}
		System.out.println("111111111111111111");
		return map;
	}
	
	//制定消缺任务，初始化
	@RequestMapping(params="method=getRemovedefectLines")
	public @ResponseBody Map<String, Object> getRemovedefectLines(){
		Map<String, Object> map=new HashMap<String, Object>();
		List<Line> list=rs.getRemovedefectLines();
		map.put("list", list);
		return map;
	}
	
	//制定消缺任务/查
	@RequestMapping(params="method=getRemovedefectLinesLate")
	public @ResponseBody Map<String, Object> makeRemovedefect(String line_number){
		Map<String, Object> map=new HashMap<String, Object>();
		List<Receipt> list=rs.makeRemovedefect(line_number);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(params="method=getRemovedefectUser")
	public @ResponseBody Map<String, Object> getRemovedefectUser(){
		Map<String, Object> map=new HashMap<String, Object>();
		List<Users> list=rs.getRemovedefectUser();
		for (Users u : list) {
			System.out.println(u.getUSER_NAME());
		}
		map.put("list", list);
		return map;
	}
	
	//制定消缺任务
	@RequestMapping(params="method=addRemovedefect")
	public String addRemovedefect(String line_name,Removedefect re,String user_id,String receipt_id){
		
		return "xiaoque/module1/index.jsp";
	}
//	
//	//分配/修改消缺任务
//	public int setXQPerson(Removedefect removedefect);
//	
//	//取消任务
//	public int delRemovedefect(String task_number);
//	
	//执行任务
	@RequestMapping(params="method=executeRemovedefect")
	public @ResponseBody Map<String, Object> executeRemovedefect(String task_number){
		int aa=rs.executeRemovedefect(task_number);
		System.out.println(aa);
		return new HashMap<String, Object>();
	}
	
	//完成任务
	@RequestMapping(params="method=completeRemovedefect")
	public @ResponseBody Map<String, Object> completeRemovedefect(String task_number){
		int aa=rs.completeRemovedefect(task_number);
		System.out.println(aa);
		System.out.println("55555555555555555");
		return new HashMap<String, Object>();
	}

	

	
	
	
	

}
