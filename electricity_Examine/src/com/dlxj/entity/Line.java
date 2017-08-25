package com.dlxj.entity;

public class Line {
	
	private Integer lineId;
	private String lineNumber;
	private String lineName;
	private Integer lineLength;
	private String lineDate;
	private Integer lineVoltage;
	private Integer lineStatic;
	private String lineRemark;
	private String poleStar;
	private String poleStop;
	private String lineState;
	private Integer length;
	private Integer lineDel;
	private String lineCreatedate;


	public Line() {
		// TODO Auto-generated constructor stub
	}


	public Line(Integer lineId, String lineNumber, String lineName,
			Integer lineLength, String lineDate, Integer lineVoltage,
			Integer lineStatic, String lineRemark, String poleStar,
			String poleStop, String lineState, Integer length, Integer lineDel,
			String lineCreatedate) {
		super();
		this.lineId = lineId;
		this.lineNumber = lineNumber;
		this.lineName = lineName;
		this.lineLength = lineLength;
		this.lineDate = lineDate;
		this.lineVoltage = lineVoltage;
		this.lineStatic = lineStatic;
		this.lineRemark = lineRemark;
		this.poleStar = poleStar;
		this.poleStop = poleStop;
		this.lineState = lineState;
		this.length = length;
		this.lineDel = lineDel;
		this.lineCreatedate = lineCreatedate;
	}


	public Integer getLineId() {
		return lineId;
	}


	public void setLineId(Integer lineId) {
		this.lineId = lineId;
	}


	public String getLineNumber() {
		return lineNumber;
	}


	public void setLineNumber(String lineNumber) {
		this.lineNumber = lineNumber;
	}


	public String getLineName() {
		return lineName;
	}


	public void setLineName(String lineName) {
		this.lineName = lineName;
	}


	public Integer getLineLength() {
		return lineLength;
	}


	public void setLineLength(Integer lineLength) {
		this.lineLength = lineLength;
	}


	public String getLineDate() {
		return lineDate;
	}


	public void setLineDate(String lineDate) {
		this.lineDate = lineDate;
	}


	public Integer getLineVoltage() {
		return lineVoltage;
	}


	public void setLineVoltage(Integer lineVoltage) {
		this.lineVoltage = lineVoltage;
	}


	public Integer getLineStatic() {
		return lineStatic;
	}


	public void setLineStatic(Integer lineStatic) {
		this.lineStatic = lineStatic;
	}


	public String getLineRemark() {
		return lineRemark;
	}


	public void setLineRemark(String lineRemark) {
		this.lineRemark = lineRemark;
	}


	public String getPoleStar() {
		return poleStar;
	}


	public void setPoleStar(String poleStar) {
		this.poleStar = poleStar;
	}


	public String getPoleStop() {
		return poleStop;
	}


	public void setPoleStop(String poleStop) {
		this.poleStop = poleStop;
	}


	public String getLineState() {
		return lineState;
	}


	public void setLineState(String lineState) {
		this.lineState = lineState;
	}


	public Integer getLength() {
		return length;
	}


	public void setLength(Integer length) {
		this.length = length;
	}


	public Integer getLineDel() {
		return lineDel;
	}


	public void setLineDel(Integer lineDel) {
		this.lineDel = lineDel;
	}


	public String getLineCreatedate() {
		return lineCreatedate;
	}


	public void setLineCreatedate(String lineCreatedate) {
		this.lineCreatedate = lineCreatedate;
	}


	@Override
	public String toString() {
		return "Line [lineId=" + lineId + ", lineNumber=" + lineNumber
				+ ", lineName=" + lineName + ", lineLength=" + lineLength
				+ ", lineDate=" + lineDate + ", lineVoltage=" + lineVoltage
				+ ", lineStatic=" + lineStatic + ", lineRemark=" + lineRemark
				+ ", poleStar=" + poleStar + ", poleStop=" + poleStop
				+ ", lineState=" + lineState + ", length=" + length
				+ ", lineDel=" + lineDel + ", lineCreatedate=" + lineCreatedate
				+ "]";
	}

	
	
	
	
	
}
