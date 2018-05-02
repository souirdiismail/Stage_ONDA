/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bon.achat;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Administrator
 */
public class connecter {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
    
    
     public static Connection connecterDB(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.print("Driver ok");
            String url = "jdbc:mysql://localhost:3306/gestion_achat";
            String user="root";
            String password="";
            Connection cnx=(Connection) DriverManager.getConnection(url,user,password);
            System.out.println("connection bien etabliee");
            return cnx;
            
        }catch(ClassNotFoundException | SQLException e){
            JOptionPane.showMessageDialog(null, "1-veuller activer la connection serveur a l'aide de l'application wamp dans votre pc");
            return null;
            
        }
    }
    
}
