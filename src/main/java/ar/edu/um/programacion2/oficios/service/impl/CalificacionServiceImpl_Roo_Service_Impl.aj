// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.service.impl;

import ar.edu.um.programacion2.oficios.domain.Calificacion;
import ar.edu.um.programacion2.oficios.repository.CalificacionRepository;
import ar.edu.um.programacion2.oficios.service.impl.CalificacionServiceImpl;
import io.springlets.data.domain.GlobalSearch;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CalificacionServiceImpl_Roo_Service_Impl {
    
    declare @type: CalificacionServiceImpl: @Service;
    
    declare @type: CalificacionServiceImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private CalificacionRepository CalificacionServiceImpl.calificacionRepository;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param calificacionRepository
     */
    @Autowired
    public CalificacionServiceImpl.new(CalificacionRepository calificacionRepository) {
        setCalificacionRepository(calificacionRepository);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return CalificacionRepository
     */
    public CalificacionRepository CalificacionServiceImpl.getCalificacionRepository() {
        return calificacionRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param calificacionRepository
     */
    public void CalificacionServiceImpl.setCalificacionRepository(CalificacionRepository calificacionRepository) {
        this.calificacionRepository = calificacionRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param calificacion
     */
    @Transactional
    public void CalificacionServiceImpl.delete(Calificacion calificacion) {
        getCalificacionRepository().delete(calificacion);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    @Transactional
    public List<Calificacion> CalificacionServiceImpl.save(Iterable<Calificacion> entities) {
        return getCalificacionRepository().save(entities);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    @Transactional
    public void CalificacionServiceImpl.delete(Iterable<Long> ids) {
        List<Calificacion> toDelete = getCalificacionRepository().findAll(ids);
        getCalificacionRepository().deleteInBatch(toDelete);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Calificacion
     */
    @Transactional
    public Calificacion CalificacionServiceImpl.save(Calificacion entity) {
        return getCalificacionRepository().save(entity);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Calificacion
     */
    public Calificacion CalificacionServiceImpl.findOne(Long id) {
        return getCalificacionRepository().findOne(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Calificacion
     */
    public Calificacion CalificacionServiceImpl.findOneForUpdate(Long id) {
        return getCalificacionRepository().findOneDetached(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public List<Calificacion> CalificacionServiceImpl.findAll(Iterable<Long> ids) {
        return getCalificacionRepository().findAll(ids);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Calificacion> CalificacionServiceImpl.findAll() {
        return getCalificacionRepository().findAll();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public long CalificacionServiceImpl.count() {
        return getCalificacionRepository().count();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Calificacion> CalificacionServiceImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        return getCalificacionRepository().findAll(globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Calificacion> CalificacionServiceImpl.getEntityType() {
        return Calificacion.class;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Long> CalificacionServiceImpl.getIdType() {
        return Long.class;
    }
    
}