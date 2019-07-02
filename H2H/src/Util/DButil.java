package Util;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 * 
 * @author mr.li
 *
 */
public class DButil {
	private String dbUrl="jdbc:mysql://localhost:3306/bibliosoft?useUnicode=true&characterEncoding=UTF-8";
	//mysql user name
	private String userName = "root";
	//mysql password
	private String password = "nwpu.123.com";
	//driver name
	private String jdbcName = "com.mysql.jdbc.Driver";

	/**

	 * 创建连接

	 * @return

	 * @throws Exception

	 */

	public Connection getCon() throws Exception{

		Class.forName(jdbcName);

		Connection connection = DriverManager.getConnection(dbUrl,userName,password);

		return connection;

	}

	

	/**

	 * 关闭连接

	 * @param connection

	 * @throws Exception

	 */

	public void closeCon(Connection connection) throws Exception{

		if (null != connection) {

			connection.close();

		}

	}

	

	public static void main(String[] args) {

		DButil dbUtil = new DButil();

		try {

			dbUtil.getCon();

			System.out.println("连接成功");

		} catch (Exception e) {

			System.out.println("连接失败！");

		}

	}
}
