// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.reference;

import ar.edu.um.programacion2.oficios.domain.CalificacionCliente;
import ar.edu.um.programacion2.oficios.domain.CalificacionPrestador;
import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.reference.Historial;

privileged aspect Historial_Roo_JavaBean {
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public Long Historial.getId() {
        return this.id;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     */
    public void Historial.setId(Long id) {
        this.id = id;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Integer
     */
    public Integer Historial.getVersion() {
        return this.version;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param version
     */
    public void Historial.setVersion(Integer version) {
        this.version = version;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Cliente
     */
    public Cliente Historial.getCliente() {
        return this.cliente;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param cliente
     */
    public void Historial.setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Servicio
     */
    public Servicio Historial.getServicio() {
        return this.servicio;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param servicio
     */
    public void Historial.setServicio(Servicio servicio) {
        this.servicio = servicio;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return CalificacionCliente
     */
    public CalificacionCliente Historial.getCalificacion_cliente() {
        return this.calificacion_cliente;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param calificacion_cliente
     */
    public void Historial.setCalificacion_cliente(CalificacionCliente calificacion_cliente) {
        this.calificacion_cliente = calificacion_cliente;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return CalificacionPrestador
     */
    public CalificacionPrestador Historial.getCalificacion_prestador() {
        return this.calificacion_prestador;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param calificacion_prestador
     */
    public void Historial.setCalificacion_prestador(CalificacionPrestador calificacion_prestador) {
        this.calificacion_prestador = calificacion_prestador;
    }
    
}
