/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package db_project_bd;

import java.sql.*;
/**
 *
 * @author nikitas, xarhs
 */
public class Db_project_bd {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/db_project_bd"; 
    
public static void main(String[] args){
try{
    Connection  connection = DriverManager.getConnection(DB_URL, "root", "");
        
}
catch(SQLException ex) {
    ex.printStackTrace();
} 
}
}
