package cn.sm.entity;

public class Student {
    private Integer id;

    private Long sId;

    private String sName;

    private String sEmail;

    private String sPasswd;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
	public String toString() {
		return "Student [id=" + id + ", sId=" + sId + ", sName=" + sName + ", sEmail=" + sEmail + ", sPasswd=" + sPasswd
				+ "]";
	}

	public Long getsId() {
        return sId;
    }

    public void setsId(Long sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsEmail() {
        return sEmail;
    }

    public void setsEmail(String sEmail) {
        this.sEmail = sEmail == null ? null : sEmail.trim();
    }

    public String getsPasswd() {
        return sPasswd;
    }

    public void setsPasswd(String sPasswd) {
        this.sPasswd = sPasswd == null ? null : sPasswd.trim();
    }
}