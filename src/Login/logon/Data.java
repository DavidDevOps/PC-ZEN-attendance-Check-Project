package Login.logon;

import java.sql.*;

public class Data {
	private String number;
	private String id;
	private String passwd;
	private String name;
	private Timestamp time;
	private int late_money;
	
	public String getnumber() { return number; }
	public void setnumber(String number) { this.number = number; }
	
	public String getid() { return id; }
	public void setid(String id) { this.id = id; }
	
	public String getpasswd() { return passwd; }
	public void setpasswd(String passwd) { this.passwd = passwd; }
	
	public String getname() { return name; }
	public void setname(String name) { this.name = name; }
	
	public Timestamp getTime() { return time; }
	public void setTime(Timestamp time) { this.time = time; }
	
	public int getlate_money() { return late_money; }
	public void setlate_money(int late_money) { this.late_money = late_money; }
}