package com.dlxj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dlxj.dao.TaskDao;
import com.dlxj.entity.Defect;
import com.dlxj.entity.Line;
import com.dlxj.entity.Pole;
import com.dlxj.entity.Receipt;
import com.dlxj.entity.Task;
import com.dlxj.entity.Users;
import com.dlxj.service.TaskService;

@Service
public class TaskServiceImpl implements TaskService {
	@Autowired
	private TaskDao td;

	public TaskDao getTd() {
		return td;
	}

	public void setTd(TaskDao td) {
		this.td = td;
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED)
	@Override
	public int addTask(Task t) {
		int num1=td.addTask(t);
		int task_id=td.selectTaskIdByTaskNum(t.getTASK_NUMBER());
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("line_id", t.getLINE_ID());
		map.put("ENDPOLE", t.getTASK_ENDPOLE());
		map.put("BEGINPOLE", t.getTASK_BEGINPOLE());
		map.put("task_id", task_id);
		int num2=td.updatePoleTaskid(map);
		return 1;
	}
	@Override
	public List<Receipt> getTasks3(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return td.getTasks3(map1);
	}

	@Override
	public Integer getTasksCount3(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return td.getTasksCount3(map1);
	}

	@Override
	public List<Defect> getDefects() {
		// TODO Auto-generated method stub
		return td.getDefects();
	}

	@Override
	public int shareZhiXing(String task_id) {
		// TODO Auto-generated method stub
		return td.shareZhiXing(task_id);
	}

	@Override
	public List<Task> getTasks(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return td.getTasks(map1);
	}

	@Override
	public Integer getTasksCount(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return td.getTasksCount(map1);
	}

	@Override
	public List<Line> getLines() {
		// TODO Auto-generated method stub
		return td.getLines();
	}

	@Override
	public Task ckTaskNumber(String task_number) {
		// TODO Auto-generated method stub
		return td.ckTaskNumber(task_number);
	}

	@Override
	public Task ckTaskName(String task_name) {
		// TODO Auto-generated method stub
		return td.ckTaskName(task_name);
	}

	@Override
	public List<Pole> selectEndPoleByStartPole(String pole_start) {
		// TODO Auto-generated method stub
		return td.selectEndPoleByStartPole(pole_start);
	}

	@Override
	public String selectStartPole1ByLineid(int line_id) {
		// TODO Auto-generated method stub
		return td.selectStartPole1ByLineid(line_id);
	}

	@Override
	public String selectStartPole2ByLineid(int line_id) {
		// TODO Auto-generated method stub
		return td.selectStartPole2ByLineid(line_id);
	}

	// 查询某个线路是否再巡检中
	@Override
	public List<String> getTaskIdByLineId(int lineId) {
		// TODO Auto-generated method stub
		return td.getTaskIdByLineId(lineId);
	}

	@Override
	public Integer getTasksCountm2(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return td.getTasksCountm2(map1);
	}

	@Override
	public List<Task> getTasksm2(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return td.getTasksm2(map1);
	}

	@Override
	public Task selectTaskById(int task_id) {
		// TODO Auto-generated method stub
		return td.selectTaskById(task_id);
	}

	@Override
	public List<Pole> getPoles(Task t) {
		// TODO Auto-generated method stub
		return td.getPoles(t);
	}

	@Override
	public Receipt selectReceiptByPoleNum(String pole_id) {
		// TODO Auto-generated method stub
		return td.selectReceiptByPoleNum(pole_id);
	}

	@Override
	public int deleteTask(String task_id) {
		// TODO Auto-generated method stub
		return td.deleteTask(task_id);
	}

	@Override
	public List<Users> getXunjianYuan() {
		// TODO Auto-generated method stub
		return td.getXunjianYuan();
	}

	@Override
	public int share(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return td.share(map);
	}
}
