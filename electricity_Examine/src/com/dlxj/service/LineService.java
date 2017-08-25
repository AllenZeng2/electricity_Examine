package com.dlxj.service;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Line;
import com.dlxj.entity.PageInfo;

public interface LineService {

	List<Line> getLineList(Map<String, Object> m);

	Integer getCount(String conliname);

	int addNewLine(Line line);

	

	int updateStatic(Map<String, Object> map);

	int jiaDel(int lineId);

	Line getLineById(int lineId);

	Line getLineByNumber(String lineNumber);

	


	List<String> getdeTaskidByLineId(int lineId);

	int updateLine(Line line);

	Line getLineByLineByName(String lineName);
	
}
