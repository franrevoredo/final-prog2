// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.repository;

import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.repository.ServicioRepository;
import ar.edu.um.programacion2.oficios.repository.ServicioRepositoryCustom;
import io.springlets.data.jpa.repository.DetachableJpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ServicioRepository_Roo_Jpa_Repository {
    
    declare parents: ServicioRepository extends DetachableJpaRepository<Servicio, Long>;
    
    declare parents: ServicioRepository extends ServicioRepositoryCustom;
    
    declare @type: ServicioRepository: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param telefono
     * @param pageable
     * @return Page
     */
    public abstract Page<Servicio> ServicioRepository.findByTelefono(String telefono, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param telefono
     * @return Long
     */
    public abstract long ServicioRepository.countByTelefono(String telefono);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param nombre
     * @param pageable
     * @return Page
     */
    public abstract Page<Servicio> ServicioRepository.findByNombreLike(String nombre, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param nombre
     * @return Long
     */
    public abstract long ServicioRepository.countByNombreLike(String nombre);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param puntaje
     * @param pageable
     * @return Page
     */
    public abstract Page<Servicio> ServicioRepository.findByPuntaje(float puntaje, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param puntaje
     * @return Long
     */
    public abstract long ServicioRepository.countByPuntaje(float puntaje);
    
}