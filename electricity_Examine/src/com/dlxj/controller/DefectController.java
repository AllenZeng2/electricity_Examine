package com.dlxj.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dlxj.entity.Defect;
import com.dlxj.entity.PageInfo;
import com.dlxj.entity.Pole;
import com.dlxj.service.DefectService;

@Controller
@RequestMapping("defect.do")
public class DefectController {
	@Autowired
	private DefectService ds;

	public DefectService getDs() {
		return ds;
	}

	public void setDs(DefectService ds) {
		this.ds = ds;
	}

	@RequestMapping(params = "param=deleteDefect")
	public @ResponseBody
	Defect deleteDefect(int defect_id) {
		ds.deleteDefect(defect_id);
		return new Defect();
	}

	@RequestMapping(params = "param=updateDefectInfo")
	public String updateDefectInfo(int defect_id, ModelMap map) {
		map.put("d", ds.getDefect(defect_id));

		return "quexian/type/update.jsp";
	}

	@RequestMapping(params = "param=saveDefectLevel")
	public @ResponseBody
	Pole saveDefectLevel(int pole_id, int defect_level) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pole_id", pole_id);
		map.put("defect_level", defect_level);
		int num = ds.saveDefectLevel(map);

		return new Pole();
	}

	@RequestMapping(params = "param=updateDefect")
	public String updateDefect(int defect_id, String defect_name,
			int defect_static) {
		int num = ds.updateDefect(new Defect(defect_id, defect_name,
				defect_static, 0));

		return "redirect:quexian/type/index.jsp";
	}

	@RequestMapping(params = "param=addDefect")
	public String addDefect(String defect_name, int defect_static) {
		Defect d = new Defect(null, defect_name, defect_static, 0);
		int num = ds.addDefect(d);
		return "redirect:quexian/type/index.jsp";
	}

	@RequestMapping(params = "param=ckDefectName")
	public @ResponseBody
	Defect ckDefectName(String defect_name) {
		return ds.getDefectName(defect_name);
	}

	@RequestMapping(params = "param=getDefectsLevel")
	public @ResponseBody
	Map<String, Object> getDefectsLevel(String task_number, String line_number,
			String pageNum) {
		PageInfo pi = new PageInfo(1, 5, 0, 0);
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("task_number", task_number);
		map1.put("line_number", line_number);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		pi.setLimit1();
		pi.setLimit2();
		pi.setTotleCount(ds.getReceiptsCount(map1));
		pi.setTotlePage((pi.getTotleCount() + 4) / 5);
		map1.put("pi", pi);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", ds.getReceipts(map1));
		map2.put("pi", pi);
		return map2;
	}

	@RequestMapping(params = "param=getDefects")
	public @ResponseBody
	Map<String, Object> getDefects(String dname, String pageNum) {
		PageInfo pi = new PageInfo(1, 5, 0, 0);
		if (pageNum != null && pageNum.length() != 0) {
			pi.setPageNum(Integer.parseInt(pageNum));
		}
		pi.setLimit1();
		pi.setLimit2();
		pi.setTotleCount(ds.getDefectsCount(dname));
		pi.setTotlePage((pi.getTotleCount() + 4) / 5);

		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("dname", dname);
		map1.put("pi", pi);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", ds.getDefects(map1));
		map2.put("pi", pi);
		return map2;
	}

}
