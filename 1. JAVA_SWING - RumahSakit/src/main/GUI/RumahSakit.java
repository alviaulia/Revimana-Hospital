/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package GUI;

import javax.swing.*;

/**
 *
 * @author ivalshamkya
 */
public class RumahSakit {
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                MainPage mp = new MainPage();
                mp.setVisible(true);
            }
        });
    }
}
