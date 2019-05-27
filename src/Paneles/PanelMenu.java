
package Paneles;

import java.awt.Dimension;
import java.awt.Graphics;
import javax.swing.ImageIcon;


public class PanelMenu extends  javax.swing.JPanel {
    public void paintComponent(Graphics g){
         Dimension dim=getSize();
         ImageIcon imagenFondo= new ImageIcon(getClass().getResource("/Imagenes/fondo.jpg"));
         g.drawImage(imagenFondo.getImage(), 0, 0,dim.width, dim.height,null);
         setOpaque(false);
    super.paintComponent(g);
    }
}
