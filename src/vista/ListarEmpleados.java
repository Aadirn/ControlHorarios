/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultListModel;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import modelo.Empleado;

/**
 *
 * @author VSPC-ETERNALSTORM2V5
 */
public class ListarEmpleados extends javax.swing.JFrame {

    private Map<Integer, Empleado> mapEmpleados=new HashMap<>();
    //Empleado empleados = new Empleado();
    //Conexion conn = new Conexion(); //TODO: QUIERO PONER EN UNA CLASE A PARTE LA CONEXION Y LLAMARLA CUANDO YO QUIERA PARA NO REPETIR CODIGO
    Connection conn;
    String nombresTabla[]={"Nombre","Apellido 1","Apellido 2","DNI","NAF","E-mail","Telefono","Contrato"};
    DefaultTableModel dtm;
    
    public ListarEmpleados() throws SQLException {
        
        initComponents();
        this.setLocationRelativeTo(null);
        cargarEmpleados();
        mostrarEmpleados();
        
    }
    
    private void mostrarEmpleados(){
        //int j=0;
        dtm=new DefaultTableModel(nombresTabla, mapEmpleados.size());
        Empleado[] filas=new Empleado[mapEmpleados.size()];
        for(int i=0;i<mapEmpleados.size();i++){
            System.out.println("hola");
            filas[i]= new Empleado(mapEmpleados.get(i).getNombre(),
                    mapEmpleados.get(i).getApellido1(),mapEmpleados.get(i).getApellido2(),
                    mapEmpleados.get(i).getDni(),mapEmpleados.get(i).getNaf(),
                    mapEmpleados.get(i).getEmail(),mapEmpleados.get(i).getTelefono(),
                    mapEmpleados.get(i).getTipoContrato());
            
        }
        dtm.addRow(filas);
        tblEmpleados.setModel(dtm);
        
        
    }
    
    private void cargarEmpleados() throws SQLException{
        this.conn = DriverManager.getConnection("jdbc:mysql://localhost/controlhorario?autoReconnect=true&useSSL=false", "root", "1234");
        try (PreparedStatement empleados = conn.prepareStatement("select cod_empleado,nombre,apellido1,apellido2,dni,naf,email,telefono,tipo_contrato from empleados");) {
            ResultSet rs = empleados.executeQuery();
            while (rs.next()) {
                mapEmpleados.put(rs.getInt("cod_empleado"), new Empleado(rs.getString("nombre"),
                        rs.getString("apellido1"),rs.getString("apellido2"),rs.getString("dni"),
                        rs.getString("naf"),rs.getString("email"),rs.getLong("telefono"),
                        rs.getInt("tipo_contrato")));
            }

        } catch (SQLException ex) {
            System.err.println("Fallo al Obtener Datos " + ex.getMessage());
        }
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane2 = new javax.swing.JScrollPane();
        tblEmpleados = new javax.swing.JTable();

        jScrollPane2.setViewportView(tblEmpleados);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 594, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 369, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ListarEmpleados.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ListarEmpleados.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ListarEmpleados.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ListarEmpleados.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new ListarEmpleados().setVisible(true);
                } catch (SQLException ex) {
                    System.err.println("Fallo al Conectar a la BD " + ex.getMessage());
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable tblEmpleados;
    // End of variables declaration//GEN-END:variables
}
