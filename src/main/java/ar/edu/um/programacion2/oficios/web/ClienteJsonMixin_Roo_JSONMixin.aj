// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.reference.Localidad;
import ar.edu.um.programacion2.oficios.web.ClienteJsonMixin;
import ar.edu.um.programacion2.oficios.web.LocalidadDeserializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

privileged aspect ClienteJsonMixin_Roo_JSONMixin {
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @JsonDeserialize(using = LocalidadDeserializer.class)
    private Localidad ClienteJsonMixin.localidad;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Localidad
     */
    public Localidad ClienteJsonMixin.getLocalidad() {
        return localidad;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param localidad
     */
    public void ClienteJsonMixin.setLocalidad(Localidad localidad) {
        this.localidad = localidad;
    }
    
}