package Demo.model;

import java.util.Date;

public class ViewSubjectBean {
	private int subjectid;
	private String subjectname;
	private Integer subjectstatus;
	private int status;
	@Override
	public String toString() {
		return "ViewSubjectBean [subjectid=" + subjectid + ", subjectname=" + subjectname + ", subjectstatus="
				+ subjectstatus + ", status=" + status + ", createdon=" + createdon + "]";
	}

	private Date createdon = new Date();
	
	public int getSubjectid() {
		return subjectid;
	}

	public void setSubjectid(int subjectid) {
		this.subjectid = subjectid;
	}
	
	public String getSubjectname() {
		return subjectname;
	}

	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}

	public Integer getSubjectstatus() {
		return subjectstatus;
	}

	public void setSubjectstatus(Integer subjectstatus) {
		this.subjectstatus = subjectstatus;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreatedon() {
		return createdon;
	}

	public void setCreatedon(Date createdon) {
		this.createdon = createdon;
	}

	public ViewSubjectBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
