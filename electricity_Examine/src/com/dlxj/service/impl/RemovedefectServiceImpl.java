package com.dlxj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dlxj.dao.RemovedefectDao;
import com.dlxj.entity.Defect;
import com.dlxj.entity.Line;
import com.dlxj.entity.Receipt;
import com.dlxj.entity.Removedefect;
import com.dlxj.entity.Users;
import com.dlxj.service.RemovedefectService;
@Service
public class RemovedefectServiceImpl implements RemovedefectService {
	@Autowired
	private RemovedefectDao rd;
	
	public RemovedefectDao getRd() {
		return rd;
	}
	
	public void setRd(RemovedefectDao rd) {
		this.rd = rd;
	}

	@Override
	public List<Removedefect> getRemovedefect1(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rd.getRemovedefect1(map);
	}

	@Override
	public int getRemovedefectCount1(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rd.getRemovedefectCount1(map);
	}

	@Override
	public List<Removedefect> getRemovedefect2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rd.getRemovedefect2(map);
	}

	@Override
	public int getRemovedefectCount2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rd.getRemovedefectCount2(map);
	}

	@Override
	public List<Removedefect> selectTaskByNumber(String task_number) {
		// TODO Auto-generated method stub
		return rd.selectTaskByNumber(task_number);
	}

	@Override
	public List<Receipt> makeRemovedefect(String line_name) {
		// TODO Auto-generated method stub
		return rd.makeRemovedefect(line_name);
	}

	@Override
	public int addRemovedefect(Removedefect removedefect) {
		// TODO Auto-generated method stub
		return rd.addRemovedefect(removedefect);
	}

	@Override
	public int setXQPerson(Removedefect removedefect) {
		// TODO Auto-generated method stub
		return rd.setXQPerson(removedefect);
	}

	@Override
	public int delRemovedefect(String task_number) {
		// TODO Auto-generated method stub
		return rd.delRemovedefect(task_number);
	}

	@Override
	public int executeRemovedefect(String task_number) {
		// TODO Auto-generated method stub
		return rd.executeRemovedefect(task_number);
	}

	@Override
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED)
	public int completeRemovedefect(String task_number) {
		// TODO Auto-generated method stub
		rd.completeRemovedefect(task_number);
		List<Removedefect> list=rd.selectReceipt(task_number);
		int i=0;
		for (Removedefect r : list) {
			rd.insertReceipt(r);
			i++;
		}
		return i;
	}

	@Override
	public List<Removedefect> selectRemovedefect(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rd.selectRemovedefect(map);
	}

	@Override
	public int selectRemovedefectCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rd.selectRemovedefectCount(map);
	}

	@Override
	public List<Defect> getDefects() {
		// TODO Auto-generated method stub
		return rd.getDefects();
	}
	
	@Override
	public List<Line> getRemovedefectLines() {
		// TODO Auto-generated method stub
		return rd.getRemovedefectLines();
	}
	
	@Override
	public List<Users> getRemovedefectUser() {
		// TODO Auto-generated method stub
		return rd.getRemovedefectUser();
	}

}
