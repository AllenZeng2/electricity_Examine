package com.dlxj.service.impl;	
								
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlxj.dao.LineDao;
import com.dlxj.entity.Line;
import com.dlxj.entity.PageInfo;
import com.dlxj.service.LineService;
								
@Service
public class LineServiceImpl implements LineService{


	@Autowired
	private LineDao ld;

	public LineDao getLd() {
		return ld;
	}

	public void setLd(LineDao ld) {
		this.ld = ld;
	}

	
	@Override
	public List<Line> getLineList(Map<String, Object> m) {
		// TODO Auto-generated method stub
		return ld.getLineList(m);
	}

	@Override
	public Integer getCount(String conliname) {
		// TODO Auto-generated method stub
		return ld.getCount(conliname);
	}

	@Override
	public int addNewLine(Line line) {
		// TODO Auto-generated method stub
		return ld.addNewLine(line);
	}

	@Override
	public int updateStatic(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println(map.get("lineId"));
		System.out.println(map.get("lineStatic"));
		
		return ld.updateStatic(map) ;
	}

	@Override
	public int jiaDel(int lineId) {
		// TODO Auto-generated method stub
		return ld.jiaDel(lineId);
	}

	@Override
	public Line getLineById(int lineId) {
		// TODO Auto-generated method stub
		return ld.getLineById(lineId);
	}

	@Override
	public Line getLineByNumber(String lineNumber) {
		// TODO Auto-generated method stub
		return ld.getLineByNumber(lineNumber);
	}

	

	
	@Override
	public List<String> getdeTaskidByLineId(int lineId) {
		// TODO Auto-generated method stub
		return ld.getdeTaskidByLineId(lineId);
	}

	@Override
	public int updateLine(Line line) {
		// TODO Auto-generated method stub
		return ld.updateLine(line);
	}

	@Override
	public Line getLineByLineByName(String lineName) {
		// TODO Auto-generated method stub
		return ld. getLineByLineByName(lineName);
	}

	
	
	
	
	
	
}
