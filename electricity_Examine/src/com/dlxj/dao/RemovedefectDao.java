package com.dlxj.dao;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Defect;
import com.dlxj.entity.Line;
import com.dlxj.entity.Receipt;
import com.dlxj.entity.Removedefect;
import com.dlxj.entity.Users;

public interface RemovedefectDao {

	//获得消缺任务列表(制定与分配)
	List<Removedefect> getRemovedefect1(Map<String, Object> map);
	
	//查询消缺任务列表count(制定与分配)
	int getRemovedefectCount1(Map<String, Object> map);
	
	//获得消缺任务列表(执行与回执)
	List<Removedefect> getRemovedefect2(Map<String, Object> map);
	
	//查询消缺任务列表count(执行与回执)
	int getRemovedefectCount2(Map<String, Object> map);
	
	//查看消缺任务
	List<Removedefect> selectTaskByNumber(String task_number);
	
	//制定消缺任务/查
	List<Receipt> makeRemovedefect(String line_number);
	
	//制定消缺任务
	int addRemovedefect(Removedefect removedefect);
	
	//分配/修改消缺任务
	int setXQPerson(Removedefect removedefect);
	
	//取消任务
	int delRemovedefect(String task_number);
	
	//执行任务
	int executeRemovedefect(String task_number);
	
	//完成任务
	int completeRemovedefect(String task_number);
	
	//回执录入保存
	int insertReceipt(Removedefect removedefect);
	List<Removedefect> selectReceipt(String task_number);
	
	//消缺查询
	List<Removedefect> selectRemovedefect(Map<String, Object> map);
	
	//消缺count查询
	int selectRemovedefectCount(Map<String, Object> map);
	
	//获得缺陷
	List<Defect> getDefects();

	//制定消缺任务，初始化
	List<Line> getRemovedefectLines();

	//全查消缺员
	List<Users> getRemovedefectUser();
	
}
