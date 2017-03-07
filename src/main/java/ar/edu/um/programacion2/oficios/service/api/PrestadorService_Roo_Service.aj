// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.service.api;

import ar.edu.um.programacion2.oficios.domain.Prestador;
import ar.edu.um.programacion2.oficios.service.api.PrestadorService;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.format.EntityResolver;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

privileged aspect PrestadorService_Roo_Service {
    
    declare parents: PrestadorService extends EntityResolver<Prestador, Long>;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Prestador
     */
    public abstract Prestador PrestadorService.findOne(Long id);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param prestador
     */
    public abstract void PrestadorService.delete(Prestador prestador);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    public abstract List<Prestador> PrestadorService.save(Iterable<Prestador> entities);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    public abstract void PrestadorService.delete(Iterable<Long> ids);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Prestador
     */
    public abstract Prestador PrestadorService.save(Prestador entity);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Prestador
     */
    public abstract Prestador PrestadorService.findOneForUpdate(Long id);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public abstract List<Prestador> PrestadorService.findAll(Iterable<Long> ids);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public abstract List<Prestador> PrestadorService.findAll();
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public abstract long PrestadorService.count();
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Prestador> PrestadorService.findAll(GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param username
     * @param pageable
     * @return Page
     */
    public abstract Page<Prestador> PrestadorService.findByUsername(String username, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param email
     * @param pageable
     * @return Page
     */
    public abstract Page<Prestador> PrestadorService.findByEmail(String email, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param username
     * @return Long
     */
    public abstract long PrestadorService.countByUsername(String username);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param email
     * @return Long
     */
    public abstract long PrestadorService.countByEmail(String email);
    
}
