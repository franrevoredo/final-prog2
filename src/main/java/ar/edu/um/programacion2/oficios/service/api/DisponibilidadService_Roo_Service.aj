// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.service.api;

import ar.edu.um.programacion2.oficios.reference.Disponibilidad;
import ar.edu.um.programacion2.oficios.service.api.DisponibilidadService;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.format.EntityResolver;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

privileged aspect DisponibilidadService_Roo_Service {
    
    declare parents: DisponibilidadService extends EntityResolver<Disponibilidad, Long>;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Disponibilidad
     */
    public abstract Disponibilidad DisponibilidadService.findOne(Long id);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param disponibilidad
     */
    public abstract void DisponibilidadService.delete(Disponibilidad disponibilidad);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    public abstract List<Disponibilidad> DisponibilidadService.save(Iterable<Disponibilidad> entities);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    public abstract void DisponibilidadService.delete(Iterable<Long> ids);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Disponibilidad
     */
    public abstract Disponibilidad DisponibilidadService.save(Disponibilidad entity);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Disponibilidad
     */
    public abstract Disponibilidad DisponibilidadService.findOneForUpdate(Long id);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public abstract List<Disponibilidad> DisponibilidadService.findAll(Iterable<Long> ids);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public abstract List<Disponibilidad> DisponibilidadService.findAll();
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public abstract long DisponibilidadService.count();
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Disponibilidad> DisponibilidadService.findAll(GlobalSearch globalSearch, Pageable pageable);
    
}
