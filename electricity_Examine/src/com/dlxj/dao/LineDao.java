package com.dlxj.dao;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Line;
import com.dlxj.entity.PageInfo;

public interface LineDao {
	//全查
	List<Line> getLineList(Map<String, Object> m);
	//获取多少条
	Integer getCount(String conliname);
	//新增
	int addNewLine(Line line);
	//禁用启用的修改
	int updateStatic(Map<String, Object> map);
	//状态删除
	int jiaDel(int lineId);
	//根据id单查
	Line getLineById(int lineId);
	//根据number单查
	Line getLineByNumber(String lineNumber);
	//根据id查taskid
	List<String> getdeTaskidByLineId(int lineId);
	//线路信息的修改
	int updateLine(Line line);
	//根据name的单查
	Line getLineByLineByName(String lineName);
	
}
