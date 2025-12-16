package com.qaboard.util;

import java.sql.*; 
import javax.naming.*;
import javax.sql.DataSource;

public class DBUtil {
	private static String jndiName = "jdbc/mysql";
	public static Connection getConnection(){
		Connection conn = null;
		if(conn!=null)
			return conn;
		try {
			Context initContext = (Context)new InitialContext().lookup("java:comp/env/");
			DataSource ds = (DataSource)initContext.lookup(jndiName);
			conn = ds.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}