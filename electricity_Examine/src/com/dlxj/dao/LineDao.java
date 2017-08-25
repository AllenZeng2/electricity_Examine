package com.dlxj.dao;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Line;
import com.dlxj.entity.PageInfo;

public interface LineDao {
	//ȫ��
	List<Line> getLineList(Map<String, Object> m);
	//��ȡ������
	Integer getCount(String conliname);
	//����
	int addNewLine(Line line);
	//�������õ��޸�
	int updateStatic(Map<String, Object> map);
	//״̬ɾ��
	int jiaDel(int lineId);
	//����id����
	Line getLineById(int lineId);
	//����number����
	Line getLineByNumber(String lineNumber);
	//����id��taskid
	List<String> getdeTaskidByLineId(int lineId);
	//��·��Ϣ���޸�
	int updateLine(Line line);
	//����name�ĵ���
	Line getLineByLineByName(String lineName);
	
}
