// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.domain;

import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.reference.Localidad;
import java.util.Set;

privileged aspect Cliente_Roo_JavaBean {
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String Cliente.getNombre() {
        return this.nombre;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param nombre
     */
    public void Cliente.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String Cliente.getApellido() {
        return this.apellido;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param apellido
     */
    public void Cliente.setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String Cliente.getDomicilio() {
        return this.domicilio;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param domicilio
     */
    public void Cliente.setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String Cliente.getDomicilio2() {
        return this.domicilio2;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param domicilio2
     */
    public void Cliente.setDomicilio2(String domicilio2) {
        this.domicilio2 = domicilio2;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Localidad
     */
    public Localidad Cliente.getLocalidad() {
        return this.localidad;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param localidad
     */
    public void Cliente.setLocalidad(Localidad localidad) {
        this.localidad = localidad;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Set
     */
    public Set<Servicio> Cliente.getFavoritos() {
        return this.favoritos;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param favoritos
     */
    public void Cliente.setFavoritos(Set<Servicio> favoritos) {
        this.favoritos = favoritos;
    }
    
}
