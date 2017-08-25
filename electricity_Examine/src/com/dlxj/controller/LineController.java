package com.dlxj.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dlxj.entity.Line;
import com.dlxj.entity.PageInfo;
import com.dlxj.entity.Pole;
import com.dlxj.service.LineService;
import com.dlxj.service.PoleService;
import com.dlxj.service.TaskService;

@Controller
@RequestMapping("line.do")
public class LineController {

	@Autowired
	private LineService ls;

	public LineService getLs() {
		return ls;
	}

	public void setLs(LineService ls) {
		this.ls = ls;
	}

	@Autowired
	private PoleService ps;

	public PoleService getPs() {
		return ps;
	}

	public void setPs(PoleService ps) {
		this.ps = ps;
	}

	@Autowired
	private TaskService ts;

	public TaskService getTs() {
		return ts;
	}

	public void setTs(TaskService ts) {
		this.ts = ts;
	}

	// m=1��line���ȫ���ģ����ѯ
	@RequestMapping(params = "m=1")
	public @ResponseBody
	Map<String, Object> LineList(PageInfo pi, String conliname) {

		pi.setPageSize(5);
		if (pi.getPageNum() == null || pi.getPageNum() < 1) {
			pi.setPageNum(1);
		}

		pi.setLimit1();
		pi.setLimit2();

		pi.setTotleCount(ls.getCount(conliname));
		pi.setTotlePage((pi.getTotleCount() + 4) / 5);
		if (pi.getPageNum() >= pi.getTotlePage()) {
			pi.setPageNum(pi.getTotlePage());
		}
		if (conliname == null) {
			conliname = "";

		}

		Map<String, Object> m = new HashMap<String, Object>();

		Map<String, Object> map = new HashMap<String, Object>();
		m.put("pi", pi);
		m.put("con", conliname);
		List<Line> list = ls.getLineList(m);

		/*
		 * for (Line line : list) { System.out.println(line.toString()); }
		 */
		map.put("linelist", list);
		map.put("pi", pi);

		return map;
	}

	// ����һ��id����line������ʱ�������
	/*
	 * static int lid = 55; // ����pole������ʱ������� static int pid = 159;
	 */
	// ������·
	@RequestMapping(params = "m=2")
	public String add(Line line) {

		// ��line���������·
		/* line.setLineId(lid++); */
		/* System.out.println(line.getLineId()); */
		line.setLineDel(0);
		line.setLineState("0");
		// int intvo = Integer.parseInt(lineVoltage);

		// ��ȡjava��ʱ�佫��ת�����ַ������ͣ�����װ��line������
		// line.setLineVoltage(intvo);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = sdf.format(d);
		line.setLineCreatedate(nowdate);
		System.out.println(line.toString());
		// �����ݿ���������·
		ls.addNewLine(line);
		Line line2 = ls.getLineByNumber(line.getLineNumber());

		// �������
		// ��ȡ��һ���˵���Ϣ
		String start = line2.getPoleStar();
		/*System.out.println("��ȡ��һ���˵���Ϣ" + start);*/
		// ��ȡ���һ���˵���Ϣ
		String stop = line2.getPoleStop();
		/*System.out.println("��ȡ���һ���˵���Ϣ" + stop);*/
		// ���˺Ŵ��ַ�������ȡ����
		int ss = Integer.parseInt(start.substring(6));
		/*System.out.println("����һ���˺Ŵ��ַ�������ȡ����" + ss);*/
		int st = Integer.parseInt(stop.substring(6));
		/*System.out.println("���һ���˺�" + st);*/
		// ����Ҫƴ�ӵ��˺����Ƶ�ǰһ������ȡ����
		String jia = start.substring(0, 6);
		// ����˺���Ϣ�����������ַ�������Ϣ
	/*	System.out.println("ǰ��Ĳ���" + jia);
		System.out.println("��ߵĲ���1" + ss);
		System.out.println("��ߵĲ���2" + st);*/
		// ��¼һ���ж��ٸ�����
		// x�����˺�
		int x = ss;
		for (int i = ss; i <= st; i++) {

			int c = x;

			// ���㴫�����ĸ˺��Ǽ�λ��()
			int temp, b = 0;
			for (; c != 0; b++) {
				temp = c % 10;
				c /= 10;
			}
			System.out.println("���㴫�����ĸ˺��Ǽ�λ��" + b);
			// ����˵�����
			String name = jia;
			// ��ƴ�ӵĸ˵������ַ���֮�����0
			for (int a = 0; a <= 5 - b; a++) {
				name = name + "0";
			}
			// ����Ӻõ����˵����ƺ�׷�Ӹ˺�,int���͵Ķ����Զ�ת�����ַ�������
			name = name + x;

			// ���˵���Ϣ��װ��pole������
			Pole p = new Pole();

			p.setLINE_ID(line2.getLineId());
			p.setPOLE_NUMBER(name);
			// ѭ���������Ӹ˵ķ����������ݿ�����������
			ps.addPole(p);
			// ���˺ż�һ��
			x++;

		}

		return "line/line.jsp";
	}

	// ajax�޸���·��������״̬��
	@RequestMapping(params = "m=3")
	public @ResponseBody
	int qiyong(int lineId, int lineStatic) {

		/* System.out.println(lineStatic==0?"����":"����"); */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lineId", lineId);
		map.put("lineStatic", lineStatic);
		/*
		 * System.out.println(lineId); System.out.println(lineStatic);
		 */
		ls.updateStatic(map);
		/* System.out.println(lineStatic==1?"����":"����"); */
		/* System.out.println("conmm"+mm); */

		return lineStatic == 0 ? 1 : 0;

	}

	// ����·��״̬ɾ��
	@RequestMapping(params = "m=4")
	public @ResponseBody
	int jiadel(int lineId) {
		int x = ls.jiaDel(lineId);
		return x;
	}

	// ��·��Ϣ���޸ģ�����ҳ��ת���޸�ҳ������Ҫ�ķ���(�����ݿ���е���)
	@RequestMapping(params = "m=5")
	public String edit1(int lineId, ModelMap map) {
		System.out.println(lineId);

		// ��¼Ѳ������ȱ�����Ƿ��漰��ĳ����·�����漰������ҳ��������ʾ
		int d = 0;
		Line line = ls.getLineById(lineId);

		List<String> list = ts.getTaskIdByLineId(lineId);
		d = list.size() > 0 ? d + 1 : d;
		List<String> list2 = ls.getdeTaskidByLineId(lineId);
		d = list2.size() > 0 ? d + 1 : d;

		map.put("line", line);
		map.put("dd", d);
		return "line/line_edit.jsp";
	}

	@RequestMapping(params = "m=6")
	public String edit2(Line line) {

		int dd = ls.updateLine(line);

		return "line/line.jsp";
	}

	// ��ajax���ж��û����Ƿ����
	@RequestMapping(params = "m=7")
	public @ResponseBody
	int form1(String lineName) {
		System.out.println(lineName);
		Line line = ls.getLineByLineByName(lineName);
		return line == null ? 1 : 0;
	}

}
