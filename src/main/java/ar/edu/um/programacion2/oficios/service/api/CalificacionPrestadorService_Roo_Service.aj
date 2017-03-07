// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.service.api;

import ar.edu.um.programacion2.oficios.domain.CalificacionPrestador;
import ar.edu.um.programacion2.oficios.service.api.CalificacionPrestadorService;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.format.EntityResolver;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

privileged aspect CalificacionPrestadorService_Roo_Service {
    
    declare parents: CalificacionPrestadorService extends EntityResolver<CalificacionPrestador, Long>;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return CalificacionPrestador
     */
    public abstract CalificacionPrestador CalificacionPrestadorService.findOne(Long id);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param calificacionPrestador
     */
    public abstract void CalificacionPrestadorService.delete(CalificacionPrestador calificacionPrestador);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    public abstract List<CalificacionPrestador> CalificacionPrestadorService.save(Iterable<CalificacionPrestador> entities);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    public abstract void CalificacionPrestadorService.delete(Iterable<Long> ids);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return CalificacionPrestador
     */
    public abstract CalificacionPrestador CalificacionPrestadorService.save(CalificacionPrestador entity);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return CalificacionPrestador
     */
    public abstract CalificacionPrestador CalificacionPrestadorService.findOneForUpdate(Long id);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public abstract List<CalificacionPrestador> CalificacionPrestadorService.findAll(Iterable<Long> ids);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public abstract List<CalificacionPrestador> CalificacionPrestadorService.findAll();
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public abstract long CalificacionPrestadorService.count();
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<CalificacionPrestador> CalificacionPrestadorService.findAll(GlobalSearch globalSearch, Pageable pageable);
    
}