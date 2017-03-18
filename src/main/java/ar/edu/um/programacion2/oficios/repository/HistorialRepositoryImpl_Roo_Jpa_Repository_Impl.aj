// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.repository;

import ar.edu.um.programacion2.oficios.reference.Historial;
import ar.edu.um.programacion2.oficios.reference.QHistorial;
import ar.edu.um.programacion2.oficios.repository.HistorialRepositoryCustom;
import ar.edu.um.programacion2.oficios.repository.HistorialRepositoryImpl;
import com.querydsl.core.types.Path;
import com.querydsl.jpa.JPQLQuery;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt.AttributeMappingBuilder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

privileged aspect HistorialRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare parents: HistorialRepositoryImpl implements HistorialRepositoryCustom;
    
    declare @type: HistorialRepositoryImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String HistorialRepositoryImpl.CLIENTE = "cliente";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String HistorialRepositoryImpl.SERVICIO = "servicio";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String HistorialRepositoryImpl.CALIFICACION___CLIENTE = "calificacion_cliente";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String HistorialRepositoryImpl.CALIFICACION___PRESTADOR = "calificacion_prestador";
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Historial> HistorialRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        
        QHistorial historial = QHistorial.historial;
        
        JPQLQuery<Historial> query = from(historial);
        
        Path<?>[] paths = new Path<?>[] {historial.cliente,historial.servicio,historial.calificacion_cliente,historial.calificacion_prestador};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(CLIENTE, historial.cliente)
			.map(SERVICIO, historial.servicio)
			.map(CALIFICACION___CLIENTE, historial.calificacion_cliente)
			.map(CALIFICACION___PRESTADOR, historial.calificacion_prestador);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, historial);
    }
    
}