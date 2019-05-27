package Datos;

import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import javax.swing.JOptionPane;

public class Conexion {

    static Connection cnn = null;

    static Statement sta;
    static ResultSet rst;

    public Conexion() {
        enlace();
    }

//    static String user="root";
//    static String pass="Brayan97.";
//    static String url="jdbc:mysql://127.0.0.1/basededatos_ferreteria";
    static String url = "jdbc:mysql://arfo8ynm6olw6vpn.cbetxkdyhwsb.us-east-1.rds.amazonaws.com/sez90fdieovgswva";
    //        + "?autoReconnect=true&useSSL=false&useJDBCCompliantTimezoneShift=true&"
    //        + "useLegacyDatetimeCode=false&serverTimezone=UTC";
    static String user = "q3pvzlxp30tali5h";
    static String pass = "jgd2tndc3pqet14v";

    public static Connection enlace() {
        if (cnn != null) {
            return cnn;
        } else {
            try {

                String driver = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://arfo8ynm6olw6vpn.cbetxkdyhwsb.us-east-1.rds.amazonaws.com/sez90fdieovgswva";
                //        + "?autoReconnect=true&useSSL=false&useJDBCCompliantTimezoneShift=true&"
                //        + "useLegacyDatetimeCode=false&serverTimezone=UTC";
                String user = "q3pvzlxp30tali5h";
                String password = "jgd2tndc3pqet14v";

                System.out.print(user);

                Class.forName(driver);
                cnn = DriverManager.getConnection(url, user, password);

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return cnn;
        }
    }

    public static Statement declaracion(Statement st) {
        try {
            enlace();
            st = cnn.createStatement();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error de declaracion");
        }
        return st;
    }

    public static ResultSet enlacecliente(ResultSet rs) {
        try {
            sta = declaracion(sta);
            rs = sta.executeQuery("select * from CLIENTES");

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error ");
        }
        return rs;
    }

    public static ResultSet enlaceproducto(ResultSet rs) {
        try {
            sta = declaracion(sta);
            rs = sta.executeQuery("select * from PRODUCTOS");

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error ");
        }
        return rs;
    }

    public static ResultSet enlaceDetalleComprobante(ResultSet rs) {
        try {
            sta = declaracion(sta);
            rs = sta.executeQuery("select * from detallecomprobantes");

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error ");
        }
        return rs;
    }

    public static ResultSet enlaceempleado(ResultSet rs) {
        try {
            sta = declaracion(sta);
            rs = sta.executeQuery("select * from EMPLEADOS");

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error ");
        }
        return rs;
    }

    public static ResultSet idComprobante(ResultSet rs) throws SQLException {
        sta = declaracion(sta);
        rs = sta.executeQuery("select idComprobante from Comprobantes");
        return rs;
    }

    public static ResultSet enlaceComprobante(ResultSet rs) throws SQLException {
        sta = declaracion(sta);
        rs = sta.executeQuery("select * from Comprobantes");
        return rs;
    }

    public static ResultSet idEmpleado(ResultSet rs) throws SQLException {
        sta = declaracion(sta);
        rs = sta.executeQuery("select idEmpleado from EMPLEADOS");
        return rs;
    }

    public static ResultSet idCliente(ResultSet rs) throws SQLException {
        sta = declaracion(sta);
        rs = sta.executeQuery("select idCliente from CLIENTES");
        return rs;
    }

    public static ResultSet idProducto(ResultSet rs) throws SQLException {
        sta = declaracion(sta);
        rs = sta.executeQuery("select idProducto from PRODUCTOS");
        return rs;
    }

}
