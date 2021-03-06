// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.service.impl;

import ar.edu.um.programacion2.oficios.domain.Prestador;
import ar.edu.um.programacion2.oficios.repository.PrestadorRepository;
import ar.edu.um.programacion2.oficios.service.impl.PrestadorServiceImpl;
import io.springlets.data.domain.GlobalSearch;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PrestadorServiceImpl_Roo_Service_Impl {
    
    declare @type: PrestadorServiceImpl: @Service;
    
    declare @type: PrestadorServiceImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private PrestadorRepository PrestadorServiceImpl.prestadorRepository;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param prestadorRepository
     */
    @Autowired
    public PrestadorServiceImpl.new(PrestadorRepository prestadorRepository) {
        setPrestadorRepository(prestadorRepository);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return PrestadorRepository
     */
    public PrestadorRepository PrestadorServiceImpl.getPrestadorRepository() {
        return prestadorRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param prestadorRepository
     */
    public void PrestadorServiceImpl.setPrestadorRepository(PrestadorRepository prestadorRepository) {
        this.prestadorRepository = prestadorRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param prestador
     */
    @Transactional
    public void PrestadorServiceImpl.delete(Prestador prestador) {
        getPrestadorRepository().delete(prestador);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    @Transactional
    public List<Prestador> PrestadorServiceImpl.save(Iterable<Prestador> entities) {
        return getPrestadorRepository().save(entities);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    @Transactional
    public void PrestadorServiceImpl.delete(Iterable<Long> ids) {
        List<Prestador> toDelete = getPrestadorRepository().findAll(ids);
        getPrestadorRepository().deleteInBatch(toDelete);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Prestador
     */
    @Transactional
    public Prestador PrestadorServiceImpl.save(Prestador entity) {
        return getPrestadorRepository().save(entity);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Prestador
     */
    public Prestador PrestadorServiceImpl.findOne(Long id) {
        return getPrestadorRepository().findOne(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Prestador
     */
    public Prestador PrestadorServiceImpl.findOneForUpdate(Long id) {
        return getPrestadorRepository().findOneDetached(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public List<Prestador> PrestadorServiceImpl.findAll(Iterable<Long> ids) {
        return getPrestadorRepository().findAll(ids);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Prestador> PrestadorServiceImpl.findAll() {
        return getPrestadorRepository().findAll();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public long PrestadorServiceImpl.count() {
        return getPrestadorRepository().count();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Prestador> PrestadorServiceImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        return getPrestadorRepository().findAll(globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param username
     * @param pageable
     * @return Page
     */
    public Page<Prestador> PrestadorServiceImpl.findByUsername(String username, Pageable pageable) {
        return getPrestadorRepository().findByUsername(username, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param email
     * @param pageable
     * @return Page
     */
    public Page<Prestador> PrestadorServiceImpl.findByEmail(String email, Pageable pageable) {
        return getPrestadorRepository().findByEmail(email, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param username
     * @return Long
     */
    public long PrestadorServiceImpl.countByUsername(String username) {
        return getPrestadorRepository().countByUsername(username);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param email
     * @return Long
     */
    public long PrestadorServiceImpl.countByEmail(String email) {
        return getPrestadorRepository().countByEmail(email);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Prestador> PrestadorServiceImpl.getEntityType() {
        return Prestador.class;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Long> PrestadorServiceImpl.getIdType() {
        return Long.class;
    }
    
}
