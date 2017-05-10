package Login.logon;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance(){
		return instance;
	}
	
	private LogonDBBean(){}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/daily_check");
		return ds.getConnection();
	}
	
	// 회원 가입
	public void register(Data data) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into member values(?, ?, ?, ?)");
			
			pstmt.setString(1, data.getid());
			pstmt.setString(2, data.getpasswd());
			pstmt.setString(3, data.getnumber());
			pstmt.setString(4, data.getname());
			pstmt.executeUpdate();
			
			pstmt2 = conn.prepareStatement("insert into money values(?, ?)");
			pstmt2.setString(1, data.getname());
			pstmt2.setInt(2, 0);
			pstmt2.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt2 != null) try { pstmt2.close(); } catch(SQLException sqle) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
	}
	
	// 중복 아이디 체크
	public int confirmID(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = -1;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select ID from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x = 1; // 해당 아이디 존재
			else x = -1; // 해당 아이디 없음
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
		return x;
	}
	
	public int userCheck(String id, String passwd){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
			
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
				"select passwd from member where id = ?");
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){ //해당 아이디가 있으면 수행
				String dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd))
				x = 1; //인증 성공
				else
				x = 0; //비밀번호 틀림
			}else
				x = -1; //아이디 없음
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return x;
	}
	
	public int selectpasswd(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPW = "";
		
		int x = 0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPW = rs.getString("passwd");
				if(dbPW.equals(passwd)) x = 1; // 비밀번호 맞음
				else x = 0; // 비밀번호 틀림
			}
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
		return x;
	}
	
	// 회원 탈퇴
	public void withdrawal(Data data) throws Exception {
		Connection conn = null;
		PreparedStatement Memberpstmt = null;
		PreparedStatement Checkpstmt = null;
		PreparedStatement Moneypstmt = null;
		
		try {
			conn = getConnection();
			
			Memberpstmt = conn.prepareStatement("delete from member where id=?");
			Memberpstmt.setString(1, data.getid());
			Memberpstmt.executeUpdate();
			
			Checkpstmt = conn.prepareStatement("delete from check_table where name=?");
			Checkpstmt.setString(1, data.getname());
			Checkpstmt.executeUpdate();
			
			Moneypstmt = conn.prepareStatement("delete from money where name=?");
			Moneypstmt.setString(1, data.getname());
			Moneypstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(Moneypstmt != null) try { Moneypstmt.close(); } catch(SQLException sqle) {}
			if(Checkpstmt != null) try { Checkpstmt.close(); } catch(SQLException sqle) {}
			if(Memberpstmt != null) try { Memberpstmt.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
	}
	
	// 데이터 찾기
	public Data select(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Data data = new Data();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				data.setnumber(rs.getString("number"));
				data.setid(rs.getString("id"));
				data.setpasswd(rs.getString("passwd"));
				data.setname(rs.getString("name"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
		return data;
	}
	
	// 출석체크 날짜 확인
	@SuppressWarnings("deprecation")
	public int selectDate(String name, String time) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Timestamp dbTime = null;
		String sTime = "";
		long temp = 0;
		
		int x = 0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from check_table where name=?");
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dbTime = rs.getTimestamp("check_date");
				temp = dbTime.getYear() + 1900;
				sTime = "" + temp;
				temp = dbTime.getMonth() + 1;
				sTime += "" + temp;
				temp = dbTime.getDate();
				sTime += "" + temp;
				if(sTime.equals(time)) x = 1; // 출석 실패
				else x = 0; // 출석 성공
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
		return x;
	}
	
	// 출석체크 조회를 위한 이름 찾기
	public String selectName(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbName = "";
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select name from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbName = rs.getString("name");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
		return dbName;
	}
	
	// 출석체크, 지각비 설정
	@SuppressWarnings("deprecation")
	public void check(Data data, Timestamp time) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2_1 = null;
		PreparedStatement pstmt2_2 = null;
		ResultSet rs = null;
		
		int lateMoney = 0;
		int tempMoney = 0;
		/*if(time.getHours() > 7) //개학
			lateMoney = 5000;
		else if(time.getHours() == 7) {
			if(time.getMinutes() - 30 > 0 && time.getMinutes() - 30 < 11) // 1 ~ 10
				lateMoney = (time.getMinutes() - 30) * 500;
			else if(time.getMinutes() - 30 > 10) // 11 ~
				lateMoney = 5000;
		} */
		
		if(time.getHours() > 10) //방학
			lateMoney = 5000;
		else if(time.getHours() == 10) {
			if(time.getMinutes() > 0 && time.getMinutes() < 11) // 1 ~ 10
				lateMoney = (time.getMinutes()) * 500;
			else if(time.getMinutes() > 10) // 11 ~
				lateMoney = 5000;
		}
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into check_table values(?, ?, ?, ?)");
			pstmt.setString(1, data.getnumber());
			pstmt.setString(2, data.getname());
			pstmt.setTimestamp(3, time);
			pstmt.setInt(4, lateMoney);
			pstmt.executeUpdate();
			
			pstmt2_1 = conn.prepareStatement("select late_money from money where name=?");
			pstmt2_1.setString(1, data.getname());
			rs = pstmt2_1.executeQuery();
			
			if(rs.next()) { tempMoney = rs.getInt("late_money"); }
			
			tempMoney += lateMoney;
			
			pstmt2_2 = conn.prepareStatement("update money set late_money=? where name=?");
			pstmt2_2.setInt(1, tempMoney);
			pstmt2_2.setString(2, data.getname());
			pstmt2_2.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt2_2 != null) try { pstmt2_2.close(); } catch(SQLException sqle) {}
			if(pstmt2_1 != null) try { pstmt2_1.close(); } catch(SQLException sqle) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
	}
	
	// 지각비 조회
	public List<Data> InquiryLateMoney(String name) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Data> data = new ArrayList<Data>();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from check_table where name=?");
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Data temp = new Data();
				temp.setname(rs.getString("name"));
				temp.setTime(rs.getTimestamp("check_date"));
				temp.setlate_money(rs.getInt("late_money"));
				
				data.add(temp);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
		return data;
	}
	
	// 관리 비번 체크
	public int manageSelectpasswd(String passwd) {
		int x = 0;
		
		if(passwd.equals("") || passwd == null) x = 1; // 비밀번호 입력 안함
		else if(passwd.equals("rbguddlqmfhswm")) x = 0; // 성공
		else x = -1; // 실패
		
		return x;
	}
	
	// 지각비 관리
	public void manageLateMoney(String name, int Money) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		
		int dbMoney = 0;
		try {
			conn = getConnection();
			
			pstmt1 = conn.prepareStatement("select * from money where name=?");
			pstmt1.setString(1, name);
			rs = pstmt1.executeQuery();
			
			if(rs.next()) {
				dbMoney = rs.getInt("late_money");
			}
			
			dbMoney -= Money;
			pstmt2 = conn.prepareStatement("update money set late_money=? where name=?");
			pstmt2.setInt(1, dbMoney);
			pstmt2.setString(2, name);
			pstmt2.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt2 != null) try { pstmt2.close(); } catch(SQLException sqle) {}
			if(pstmt1 != null) try { pstmt1.close(); } catch(SQLException sqle) {}
			if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
		}
	}
}