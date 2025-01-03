package Schoolpackage;

public class studentmodel {
	
	private int id;
	private String registrationno;
	private String name;
	private String emailaddress;
	private String birthday;
	private String gender;
	private String course;
	private String contactno;

	public studentmodel(int id, String registrationno, String name, String emailaddress, String birthday, String gender,
			String course, String contactno) {
		super();
		this.id = id;
		this.registrationno = registrationno;
		this.name = name;
		this.emailaddress = emailaddress;
		this.birthday = birthday;
		this.gender = gender;
		this.course = course;
		this.contactno = contactno;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRegistrationno() {
		return registrationno;
	}

	public void setRegstrationno(String registrationno) {
		this.registrationno = registrationno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailaddress() {
		return emailaddress;
	}

	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getContactno() {
		return contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
}
