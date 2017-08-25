package com.dlxj.entity;
public class Receipt {
	
	private Integer receipt_id;//��ִ��id 
	private Integer defect_id;//ȱ�ݱ�id ���
	private Integer pole_id;//���˱��id ���
	private String find_username;//ִ�����û�����
	private String find_date;//����ʱ��
	private String defect_desc;//ȱ������
	private Integer defect_level;//ȱ�ݵȼ� 1һ�� 2 ���� 3����
	private Integer task_id;//Ѳ��������  ���
	private Integer req;//ȷ��ȱ�ݵȼ� 0 δȷ��  1  ȷ��
	private Integer remove_id;//��ȱ������  ���
	private String line_number;//��·���
	private String task_begaindate;//�����·�ʱ��
	private Integer task_state;//����״̬
	private Integer receipt_type;//���ּ�¼���� 0Ѳ���¼ 1��ȱ��¼
	private String giveusername;//�·����û�����
	
	private Defect defects;
	private Pole pole;
	private Task task;
	private Removedefect removedefect;
	
	public Receipt() {
		// TODO Auto-generated constructor stub
	}

	public Receipt(Integer receipt_id, Integer defect_id, Integer pole_id,
			String find_username, String find_date, String defect_desc,
			Integer defect_level, Integer task_id, Integer req,
			Integer remove_id, String line_number, String task_begaindate,
			Integer task_state, Integer receipt_type, String giveusername) {
		super();
		this.receipt_id = receipt_id;
		this.defect_id = defect_id;
		this.pole_id = pole_id;
		this.find_username = find_username;
		this.find_date = find_date;
		this.defect_desc = defect_desc;
		this.defect_level = defect_level;
		this.task_id = task_id;
		this.req = req;
		this.remove_id = remove_id;
		this.line_number = line_number;
		this.task_begaindate = task_begaindate;
		this.task_state = task_state;
		this.receipt_type = receipt_type;
		this.giveusername = giveusername;
	}

	public Receipt(Integer receipt_id, Integer defect_id, Integer pole_id,
			String find_username, String find_date, String defect_desc,
			Integer defect_level, Integer task_id, Integer req,
			Integer remove_id, String line_number, String task_begaindate,
			Integer task_state, Integer receipt_type, String giveusername,
			Defect defects, Pole pole, Task task, Removedefect removedefect) {
		super();
		this.receipt_id = receipt_id;
		this.defect_id = defect_id;
		this.pole_id = pole_id;
		this.find_username = find_username;
		this.find_date = find_date;
		this.defect_desc = defect_desc;
		this.defect_level = defect_level;
		this.task_id = task_id;
		this.req = req;
		this.remove_id = remove_id;
		this.line_number = line_number;
		this.task_begaindate = task_begaindate;
		this.task_state = task_state;
		this.receipt_type = receipt_type;
		this.giveusername = giveusername;
		this.defects = defects;
		this.pole = pole;
		this.task = task;
		this.removedefect = removedefect;
	}

	public Integer getReceipt_id() {
		return receipt_id;
	}

	public void setReceipt_id(Integer receipt_id) {
		this.receipt_id = receipt_id;
	}

	public Integer getDefect_id() {
		return defect_id;
	}

	public void setDefect_id(Integer defect_id) {
		this.defect_id = defect_id;
	}

	public Integer getPole_id() {
		return pole_id;
	}

	public void setPole_id(Integer pole_id) {
		this.pole_id = pole_id;
	}

	public String getFind_username() {
		return find_username;
	}

	public void setFind_username(String find_username) {
		this.find_username = find_username;
	}

	public String getFind_date() {
		return find_date;
	}

	public void setFind_date(String find_date) {
		this.find_date = find_date;
	}

	public String getDefect_desc() {
		return defect_desc;
	}

	public void setDefect_desc(String defect_desc) {
		this.defect_desc = defect_desc;
	}

	public Integer getDefect_level() {
		return defect_level;
	}

	public void setDefect_level(Integer defect_level) {
		this.defect_level = defect_level;
	}

	public Integer getTask_id() {
		return task_id;
	}

	public void setTask_id(Integer task_id) {
		this.task_id = task_id;
	}

	public Integer getReq() {
		return req;
	}

	public void setReq(Integer req) {
		this.req = req;
	}

	public Integer getRemove_id() {
		return remove_id;
	}

	public void setRemove_id(Integer remove_id) {
		this.remove_id = remove_id;
	}

	public String getLine_number() {
		return line_number;
	}

	public void setLine_number(String line_number) {
		this.line_number = line_number;
	}

	public String getTask_begaindate() {
		return task_begaindate;
	}

	public void setTask_begaindate(String task_begaindate) {
		this.task_begaindate = task_begaindate;
	}

	public Integer getTask_state() {
		return task_state;
	}

	public void setTask_state(Integer task_state) {
		this.task_state = task_state;
	}

	public Integer getReceipt_type() {
		return receipt_type;
	}

	public void setReceipt_type(Integer receipt_type) {
		this.receipt_type = receipt_type;
	}

	public String getGiveusername() {
		return giveusername;
	}

	public void setGiveusername(String giveusername) {
		this.giveusername = giveusername;
	}

	public Defect getDefects() {
		return defects;
	}

	public void setDefects(Defect defects) {
		this.defects = defects;
	}

	public Pole getPole() {
		return pole;
	}

	public void setPole(Pole pole) {
		this.pole = pole;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public Removedefect getRemovedefect() {
		return removedefect;
	}

	public void setRemovedefect(Removedefect removedefect) {
		this.removedefect = removedefect;
	}
	
	
	
}
