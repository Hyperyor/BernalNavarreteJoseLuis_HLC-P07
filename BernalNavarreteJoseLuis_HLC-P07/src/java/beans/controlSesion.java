/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author alumno
 */
public class controlSesion {
    
    private static String id;

    public controlSesion() {
    } 

    public String getId() {
        return id;
    }

    public static void setId(String id) {
        controlSesion.id = id;
    }
    
}
