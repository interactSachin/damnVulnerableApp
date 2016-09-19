package bean;
import java.sql.*;
import static bean.Provider.*;

/**
 * @author Sachin
 *
 */
public class ConnectionProvider {
	Connection con=null;
	{
		try{
			Class.forName(DRIVER);
			con=DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
			}catch(Exception e){}
	}
	public  Connection getCon(){
		return con;
	}
}
