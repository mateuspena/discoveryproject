package banco;

import java.sql.Connection;     /* getConnection() */
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class ConnectionFactory 
{
    // A variavel URL faz referencia a um SGBD MySQL remoto, instalado na
    // mesma rede do hospedeiro da aplicação.
    private static final String    DRIVER  =   "com.mysql.jdbc.Driver";
    private static final String    URL     =   "jdbc:mysql://localhost:3306/discovery";
    private static final String    USER    =   "root";
    private static final String    PASSWD  =   "";
    
    public static Connection getConnection()
    {        
        try {
            // Específicar a classe que implementa o Driver JDBC a ser utilizado. Nesse caso, o do MySQL.
            // Necessário em versões 5 ou anterior do Java, onde usa-se o JDBC 3, ou anterior.
            Class.forName(DRIVER);
            
            // Abrir conexão e retornar referência.
            return( DriverManager.getConnection(URL, USER, PASSWD) );
        } 
        catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Erro na conexão", e);
        }
    }
    
    public static void closeConnection(Connection conn)
    {
        try {
            if ( conn != null )
            {
                conn.close();
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public static void closeConnection(Connection conn, PreparedStatement stmt)
    {
        closeConnection(conn);
        
        try
        {
            if ( stmt != null ) stmt.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    
    public static void closeConnection(Connection conn, PreparedStatement stmt, ResultSet rs)
    {
        closeConnection(conn, stmt);
        
        try
        {
            if ( rs != null ) rs.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
}
