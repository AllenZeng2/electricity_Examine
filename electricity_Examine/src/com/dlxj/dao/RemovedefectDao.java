package com.dlxj.dao;

import java.util.List;
import java.util.Map;

import com.dlxj.entity.Defect;
import com.dlxj.entity.Line;
import com.dlxj.entity.Receipt;
import com.dlxj.entity.Removedefect;
import com.dlxj.entity.Users;

public interface RemovedefectDao {

	//�����ȱ�����б�(�ƶ������)
	List<Removedefect> getRemovedefect1(Map<String, Object> map);
	
	//��ѯ��ȱ�����б�count(�ƶ������)
	int getRemovedefectCount1(Map<String, Object> map);
	
	//�����ȱ�����б�(ִ�����ִ)
	List<Removedefect> getRemovedefect2(Map<String, Object> map);
	
	//��ѯ��ȱ�����б�count(ִ�����ִ)
	int getRemovedefectCount2(Map<String, Object> map);
	
	//�鿴��ȱ����
	List<Removedefect> selectTaskByNumber(String task_number);
	
	//�ƶ���ȱ����/��
	List<Receipt> makeRemovedefect(String line_number);
	
	//�ƶ���ȱ����
	int addRemovedefect(Removedefect removedefect);
	
	//����/�޸���ȱ����
	int setXQPerson(Removedefect removedefect);
	
	//ȡ������
	int delRemovedefect(String task_number);
	
	//ִ������
	int executeRemovedefect(String task_number);
	
	//�������
	int completeRemovedefect(String task_number);
	
	//��ִ¼�뱣��
	int insertReceipt(Removedefect removedefect);
	List<Removedefect> selectReceipt(String task_number);
	
	//��ȱ��ѯ
	List<Removedefect> selectRemovedefect(Map<String, Object> map);
	
	//��ȱcount��ѯ
	int selectRemovedefectCount(Map<String, Object> map);
	
	//���ȱ��
	List<Defect> getDefects();

	//�ƶ���ȱ���񣬳�ʼ��
	List<Line> getRemovedefectLines();

	//ȫ����ȱԱ
	List<Users> getRemovedefectUser();
	
}
