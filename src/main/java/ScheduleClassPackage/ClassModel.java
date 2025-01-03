package ScheduleClassPackage;

public class ClassModel {
	
	private int id;
	private String classname;
	private String subject;
	private String teachername;
	private String date;
	private String time;
	private String link;
	public ClassModel(int id, String classname, String subject, String teachername, String date, String time,
			String link) {
		super();
		this.id = id;
		this.classname = classname;
		this.subject = subject;
		this.teachername = teachername;
		this.date = date;
		this.time = time;
		this.link = link;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	

}
