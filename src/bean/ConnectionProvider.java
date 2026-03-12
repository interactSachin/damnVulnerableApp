package bean;
import java.sql.*;

public class ConnectionProvider {
    Connection con=null;
    {
        try{
            System.out.println("Connecting to DB...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://db:3306/testdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "db123!@#qwe");
            System.out.println("DB Connection SUCCESS");
        }catch(Exception e){
            System.out.println("DB Connection FAILED: " + e.getMessage());
            e.printStackTrace();
        }
    }
    public Connection getCon(){
        return con;
    }
}
