// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.service.api;

import ar.edu.um.programacion2.oficios.reference.Persona;
import ar.edu.um.programacion2.oficios.service.api.PersonaService;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.format.EntityResolver;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

privileged aspect PersonaService_Roo_Service {
    
    declare parents: PersonaService extends EntityResolver<Persona, Long>;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Persona
     */
    public abstract Persona PersonaService.findOne(Long id);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param persona
     */
    public abstract void PersonaService.delete(Persona persona);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    public abstract List<Persona> PersonaService.save(Iterable<Persona> entities);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    public abstract void PersonaService.delete(Iterable<Long> ids);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Persona
     */
    public abstract Persona PersonaService.save(Persona entity);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Persona
     */
    public abstract Persona PersonaService.findOneForUpdate(Long id);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public abstract List<Persona> PersonaService.findAll(Iterable<Long> ids);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public abstract List<Persona> PersonaService.findAll();
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public abstract long PersonaService.count();
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Persona> PersonaService.findAll(GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param username
     * @param pageable
     * @return Page
     */
    public abstract Page<Persona> PersonaService.findByUsername(String username, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param username
     * @return Long
     */
    public abstract long PersonaService.countByUsername(String username);
    
}
