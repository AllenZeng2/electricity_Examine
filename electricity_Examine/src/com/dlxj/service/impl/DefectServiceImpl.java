package com.dlxj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlxj.dao.DefectDao;
import com.dlxj.entity.Defect;
import com.dlxj.entity.PageInfo;
import com.dlxj.entity.Receipt;
import com.dlxj.service.DefectService;

@Service
public class DefectServiceImpl implements DefectService {
	@Autowired
	private DefectDao dd;

	public DefectDao getDd() {
		return dd;
	}

	public void setDd(DefectDao dd) {
		this.dd = dd;
	}

	@Override
	public Integer getDefectsCount(String dname) {
		// TODO Auto-generated method stub
		return dd.getDefectsCount(dname);
	}
	@Override
	public List<Defect> getDefects(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return dd.getDefects(map1);
	}
	@Override
	public Defect getDefectName(String defect_name) {
		// TODO Auto-generated method stub
		return dd.getDefectName(defect_name);
	}
	@Override
	public int addDefect(Defect d) {
		// TODO Auto-generated method stub
		return dd.addDefect(d);
	}
	@Override
	public int deleteDefect(int defect_id) {
		// TODO Auto-generated method stub
		return dd.deleteDefect(defect_id);
	}
	@Override
	public Defect getDefect(int defect_id) {
		// TODO Auto-generated method stub
		return dd.getDefect(defect_id);
	}
	@Override
	public int updateDefect(Defect defect) {
		// TODO Auto-generated method stub
		return dd.updateDefect(defect);
	}
	@Override
	public List<Receipt> getReceipts(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return dd.getReceipts(map1);
	}
	@Override
	public Integer getReceiptsCount(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return dd.getReceiptsCount(map1);
	}
	@Override
	public int saveDefectLevel(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dd.saveDefectLevel(map);
	}
	
}
