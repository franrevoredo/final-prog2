// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.service.impl;

import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.reference.Categoria;
import ar.edu.um.programacion2.oficios.repository.ServicioRepository;
import ar.edu.um.programacion2.oficios.service.impl.ServicioServiceImpl;
import io.springlets.data.domain.GlobalSearch;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ServicioServiceImpl_Roo_Service_Impl {
    
    declare @type: ServicioServiceImpl: @Service;
    
    declare @type: ServicioServiceImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private ServicioRepository ServicioServiceImpl.servicioRepository;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param servicioRepository
     */
    @Autowired
    public ServicioServiceImpl.new(ServicioRepository servicioRepository) {
        setServicioRepository(servicioRepository);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return ServicioRepository
     */
    public ServicioRepository ServicioServiceImpl.getServicioRepository() {
        return servicioRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param servicioRepository
     */
    public void ServicioServiceImpl.setServicioRepository(ServicioRepository servicioRepository) {
        this.servicioRepository = servicioRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param servicio
     */
    @Transactional
    public void ServicioServiceImpl.delete(Servicio servicio) {
        getServicioRepository().delete(servicio);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    @Transactional
    public List<Servicio> ServicioServiceImpl.save(Iterable<Servicio> entities) {
        return getServicioRepository().save(entities);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    @Transactional
    public void ServicioServiceImpl.delete(Iterable<Long> ids) {
        List<Servicio> toDelete = getServicioRepository().findAll(ids);
        getServicioRepository().deleteInBatch(toDelete);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Servicio
     */
    @Transactional
    public Servicio ServicioServiceImpl.save(Servicio entity) {
        return getServicioRepository().save(entity);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Servicio
     */
    public Servicio ServicioServiceImpl.findOne(Long id) {
        return getServicioRepository().findOne(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Servicio
     */
    public Servicio ServicioServiceImpl.findOneForUpdate(Long id) {
        return getServicioRepository().findOneDetached(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public List<Servicio> ServicioServiceImpl.findAll(Iterable<Long> ids) {
        return getServicioRepository().findAll(ids);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Servicio> ServicioServiceImpl.findAll() {
        return getServicioRepository().findAll();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public long ServicioServiceImpl.count() {
        return getServicioRepository().count();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Servicio> ServicioServiceImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        return getServicioRepository().findAll(globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param telefono
     * @param pageable
     * @return Page
     */
    public Page<Servicio> ServicioServiceImpl.findByTelefono(String telefono, Pageable pageable) {
        return getServicioRepository().findByTelefono(telefono, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param nombre
     * @param pageable
     * @return Page
     */
    public Page<Servicio> ServicioServiceImpl.findByNombreLike(String nombre, Pageable pageable) {
        return getServicioRepository().findByNombreLike(nombre, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param puntaje
     * @param pageable
     * @return Page
     */
    public Page<Servicio> ServicioServiceImpl.findByPuntaje(float puntaje, Pageable pageable) {
        return getServicioRepository().findByPuntaje(puntaje, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param categoria
     * @param pageable
     * @return Page
     */
    public Page<Servicio> ServicioServiceImpl.findByCategoria(Categoria categoria, Pageable pageable) {
        return getServicioRepository().findByCategoria(categoria, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param categoria
     * @param pageable
     * @return Page
     */
    public Page<Servicio> ServicioServiceImpl.queryByCategoria(Categoria categoria, Pageable pageable) {
        return getServicioRepository().queryByCategoria(categoria, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param telefono
     * @return Long
     */
    public long ServicioServiceImpl.countByTelefono(String telefono) {
        return getServicioRepository().countByTelefono(telefono);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param nombre
     * @return Long
     */
    public long ServicioServiceImpl.countByNombreLike(String nombre) {
        return getServicioRepository().countByNombreLike(nombre);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param puntaje
     * @return Long
     */
    public long ServicioServiceImpl.countByPuntaje(float puntaje) {
        return getServicioRepository().countByPuntaje(puntaje);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param categoria
     * @return Long
     */
    public long ServicioServiceImpl.countByCategoria(Categoria categoria) {
        return getServicioRepository().countByCategoria(categoria);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Servicio> ServicioServiceImpl.getEntityType() {
        return Servicio.class;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Long> ServicioServiceImpl.getIdType() {
        return Long.class;
    }
    
}
