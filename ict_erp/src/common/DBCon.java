package common;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import config.PropTest;

public class DBCon {

	private static String url;
	private static String user;
	private static String pwd;
	private static String driver;
	private static Connection con;
	
	private static void load(String path) {
//		String path = "/config/db.properties";
		InputStream is = DBCon.class.getResourceAsStream(path);

		Properties prop = new Properties();
		try {
			prop.load(is);
			is.close();
			url = prop.getProperty("url");
			user = prop.getProperty("user");
			pwd = prop.getProperty("pwd");
			driver = prop.getProperty("driver");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private static void openCon() {
		load("/config/db.properties");
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static Connection getCon() {
		if(con==null) {
			openCon();
		}
		return con;
	}
	
	public static void closeCon() {
		if(con!=null) {
			try {
				con.close(); //연결을 닫고(가비지컬랙터에 들어감) (잉여자원이 남아잇으니깐~밑에서 확실히 끊어~~)
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		DBCon.con=null; //끊는다. 진아씌안녕 나는 누구게???????????????????나능 나야...ㅠ
	}
	
	public static void main(String[] args) {
		getCon();
		closeCon();
	}
}
