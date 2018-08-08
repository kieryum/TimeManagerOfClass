package cn.sm.entity;

import java.util.Date;

public class ClassTable {

	private Integer id;
	private Date date;
	private Date week;
	private Date createdate;
	private String classtype;
	private String address;
	private String classcontent;
	private int classconversion;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getWeek() {
		return week;
	}
	public void setWeek(Date week) {
		this.week = week;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getClasstype() {
		return classtype;
	}
	public void setClasstype(String classtype) {
		this.classtype = classtype;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getClasscontent() {
		return classcontent;
	}
	public void setClasscontent(String classcontent) {
		this.classcontent = classcontent;
	}
	public int getClassconversion() {
		return classconversion;
	}
	public void setClassconversion(int classconversion) {
		this.classconversion = classconversion;
	} 
}
