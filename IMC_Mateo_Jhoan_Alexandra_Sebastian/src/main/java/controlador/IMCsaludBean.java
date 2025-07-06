/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSF/JSFManagedBean.java to edit this template
 */
package controlador;

import jakarta.inject.Named;
import jakarta.enterprise.context.SessionScoped;
import java.io.Serializable;

/**
 *
 * @author MATEO CARVAJAL
 */
@Named(value = "iMCsaludBean")
@SessionScoped
public class IMCsaludBean implements Serializable{

    /**
     * Creates a new instance of IMCsaludBean
     */
    public IMCsaludBean() {
    }
    
    public void guardar(){
        //lo que quiera pero que guarde 
    }
    public void mostrar(){
        
    }
    
}
