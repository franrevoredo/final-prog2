// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.repository;

import ar.edu.um.programacion2.oficios.reference.Disponibilidad;
import ar.edu.um.programacion2.oficios.reference.QDisponibilidad;
import ar.edu.um.programacion2.oficios.repository.DisponibilidadRepositoryCustom;
import ar.edu.um.programacion2.oficios.repository.DisponibilidadRepositoryImpl;
import com.querydsl.core.types.Path;
import com.querydsl.jpa.JPQLQuery;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt.AttributeMappingBuilder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DisponibilidadRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare parents: DisponibilidadRepositoryImpl implements DisponibilidadRepositoryCustom;
    
    declare @type: DisponibilidadRepositoryImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String DisponibilidadRepositoryImpl.FRANJAHORARIA = "franjahoraria";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String DisponibilidadRepositoryImpl.DESCRIPCION = "descripcion";
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Disponibilidad> DisponibilidadRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        
        QDisponibilidad disponibilidad = QDisponibilidad.disponibilidad;
        
        JPQLQuery<Disponibilidad> query = from(disponibilidad);
        
        Path<?>[] paths = new Path<?>[] {disponibilidad.franjahoraria,disponibilidad.descripcion};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(FRANJAHORARIA, disponibilidad.franjahoraria)
			.map(DESCRIPCION, disponibilidad.descripcion);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, disponibilidad);
    }
    
}