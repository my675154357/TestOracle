package TestDemo;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
import org.junit.Test;
import utils.JDBCUtils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class TestOracle {

    /**
     * create or replace procedure queryEmpInfo(eno in number, pename out varchar2, psal out number, pjob out varchar2)
     */
    @Test
    public void testProcedure(){
        String sql = "{call QUERYEMPINFO(?,?,?,?)}";

        Connection conn = null;
        CallableStatement call = null;
        try {
            conn = JDBCUtils.getConnection();
            call = conn.prepareCall(sql);

            //对于in参数，赋值
            call.setInt(1,7839);
            //对于out参数，声明
            call.registerOutParameter(2, OracleTypes.VARCHAR);
            call.registerOutParameter(3,OracleTypes.NUMBER);
            call.registerOutParameter(4,OracleTypes.VARCHAR);

            //执行
            call.execute();

            //输出
            String name = call.getString(2);
            double sal = call.getDouble(3);
            String job = call.getString(4);
            System.out.println(name+"\t"+sal+"\t"+job);

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.release(conn,call,null);
        }
    }

    /**
     * create or replace function queryEmpIncome(eno in number)
     */
    @Test
    public void testFunction(){
        String sql = "{?=call QUERYEMPINCOME(?)}";

        Connection conn = null;
        CallableStatement call = null;
        try {
            conn = JDBCUtils.getConnection();
            call = conn.prepareCall(sql);

            call.registerOutParameter(1,OracleTypes.NUMBER);
            call.setInt(2,7839);

            call.execute();

            double income = call.getDouble(1);
            System.out.println(income);

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.release(conn,call,null);
        }
    }

    /**
     * procedure queryEmpList(dno in number,empList out empcursor)
     */
    @Test
    public void testCursor(){
        String sql = "{call mypackage.queryEmpList(?,?)}";

        Connection conn = null;
        CallableStatement call = null;
        ResultSet rs = null;

        try {
            conn = JDBCUtils.getConnection();
            call = conn.prepareCall(sql);

            //对in参数，赋值
            call.setInt(1,20);

            //对out参数，声明
            call.registerOutParameter(2,OracleTypes.CURSOR);

            call.execute();

            //取出结果
            rs = ((OracleCallableStatement)call).getCursor(2);
            while (rs.next()){
                String name = rs.getString("ename");
                double sal = rs.getDouble("sal");
                System.out.println(name+"\t"+sal);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.release(conn,call,null);
        }
    }
}
