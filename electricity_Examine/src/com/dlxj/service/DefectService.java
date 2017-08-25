package com.dlxj.service;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Defect;
import com.dlxj.entity.PageInfo;
import com.dlxj.entity.Receipt;

public interface DefectService {

	Integer getDefectsCount(String dname);

	List<Defect> getDefects(Map<String, Object> map1);

	Defect getDefectName(String defect_name);

	int addDefect(Defect d);

	int deleteDefect(int defect_id);

	Defect getDefect(int defect_id);

	int updateDefect(Defect defect);

	List<Receipt> getReceipts(Map<String, Object> map1);

	Integer getReceiptsCount(Map<String, Object> map1);

	int saveDefectLevel(Map<String, Object> map);



}
