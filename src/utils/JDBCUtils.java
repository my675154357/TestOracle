package utils;

import java.sql.*;

public class JDBCUtils {
    private static String driver = "oracle.jdbc.OracleDriver";
    private static String url = "jdbc:oracle:thin:@192.168.217.128:1521/orcl";
    private static String user = "scott";
    private static String password = "tiger";

    static{
        //注册驱动
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static Connection getConnection(){
        try {
            return DriverManager.getConnection(url,user,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 运行java：
     * java -Xms100M -Xmx200M HelloWorld，表示运行HelloWorld这个程序时，需要的最小堆内存是100m，最大200m。他们是影响gc的最直接的参数。
     *
     * 技术方向：
     * 1.性能调优（oracle、tomcat、jvm...性能调优）
     * 2.故障诊断：死锁（线程互相等待） JDK:ThreadDump检测死锁；oracle自动处理死锁
     *
     * @param conn
     * @param st
     * @param rs
     */
    public static void release(Connection conn, Statement st, ResultSet rs){
        if (rs != null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                //把对象指向控制，就会很快的被gc掉
                //java中的gc不受代码控制，不能手动干预垃圾回收。通过system.gc()方法也只是请求垃圾回收，但是不是立马去执行，而是由jvm决定在适当的时候去gc。
                rs = null;
            }
        }
        if (st != null){
            try {
                st.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                st = null;
            }
        }
        if (conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                conn = null;
            }
        }
    }
}
