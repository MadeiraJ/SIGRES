package dataccess;
import java.io.Serializable;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;

public class ConnectionFactory implements Serializable {
	private static final long serialVersionUID = 1L;
	private transient Connection con;
	private String connectionString;
	private String userName;
	private String password;
	private String theClass;
    
//-------------------------------------------------------------------------------------------------------

	/**<p>Construtor</p>
	* @param Não tem
	* @exception ClassNotFoundException
	* @exception SQLException
	*/
    
    public ConnectionFactory() throws ClassNotFoundException, SQLException{
    	try{
    		Context env = (Context)new InitialContext().lookup("java:comp/env");
    		connectionString = (String)env.lookup("connectionString");
    		userName = (String)env.lookup("userName");
    		password = (String)env.lookup("password");
    		theClass = (String)env.lookup("theClass");
    	}catch(Exception e){}
        createConnection(); 
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    /**<p>Devolve uma ligação à base de dados </p>
	* @param Não tem
	* @exception ClassNotFoundException 
	* @exception SQLException
	*/
    //-------------------------------------------------------------------------------------------------------
    public Connection getConnection() throws ClassNotFoundException, SQLException{
	       return con;
    }

    //-------------------------------------------------------------------------------------------------------
    
	/**<p>Estabelece a ligação à base de dados </p>
	* @param Não tem
	* @exception ClassNotFoundException 
	* @exception SQLException
	*/
    //-------------------------------------------------------------------------------------------------------
    private synchronized void createConnection() throws ClassNotFoundException, SQLException{
    
        if(con == null || con.isClosed()){
        	Class.forName(this.theClass);
        	con = DriverManager.getConnection(this.connectionString, this.userName , this.password);
        }
    }  
}

