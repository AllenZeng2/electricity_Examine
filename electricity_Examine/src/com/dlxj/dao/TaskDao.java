package com.dlxj.dao;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Defect;
import com.dlxj.entity.Line;
import com.dlxj.entity.Pole;
import com.dlxj.entity.Receipt;
import com.dlxj.entity.Task;
import com.dlxj.entity.Users;

public interface TaskDao {

	List<Task> getTasks(Map<String, Object> map1);

	Integer getTasksCount(Map<String, Object> map1);

	List<Line> getLines();

	Task ckTaskNumber(String task_number);

	Task ckTaskName(String task_name);

	String ckPole(int line_id);

	String ckPole2(int line_id);

	String selectStartPole1ByLineid(int line_id);

	String selectStartPole2ByLineid(int line_id);

	List<Pole> selectEndPoleByStartPole(String pole_start);

	//查询某线路是否在巡检中
	List<String> getTaskIdByLineId(int lineId);

	Integer getTasksCountm2(Map<String, Object> map1);

	List<Task> getTasksm2(Map<String, Object> map1);

	Task selectTaskById(int task_id);

	List<Pole> getPoles(Task t);

	Receipt selectReceiptByPoleNum(String pole_id);

	int deleteTask(String task_id);

	List<Users> getXunjianYuan();

	int share(Map<String, Object> map);

	int shareZhiXing(String task_id);

	List<Defect> getDefects();

	List<Receipt> getTasks3(Map<String, Object> map1);

	Integer getTasksCount3(Map<String, Object> map1);

	int addTask(Task t);

	int selectTaskIdByTaskNum(String task_NUMBER);

	int updatePoleTaskid(Map<String, Object> map);

}
