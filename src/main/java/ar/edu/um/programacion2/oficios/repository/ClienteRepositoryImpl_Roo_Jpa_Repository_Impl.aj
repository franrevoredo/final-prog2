// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.repository;

import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.domain.QCliente;
import ar.edu.um.programacion2.oficios.repository.ClienteRepositoryCustom;
import ar.edu.um.programacion2.oficios.repository.ClienteRepositoryImpl;
import com.querydsl.core.types.Path;
import com.querydsl.jpa.JPQLQuery;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt.AttributeMappingBuilder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ClienteRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare parents: ClienteRepositoryImpl implements ClienteRepositoryCustom;
    
    declare @type: ClienteRepositoryImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.USERNAME = "username";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.PASSWORD = "password";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.EMAIL = "email";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.TELEFONO = "telefono";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.ENABLED = "enabled";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.NOMBRE = "nombre";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.APELLIDO = "apellido";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.DOMICILIO = "domicilio";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.DOMICILIO_2 = "domicilio2";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ClienteRepositoryImpl.LOCALIDAD = "localidad";
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Cliente> ClienteRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        
        QCliente cliente = QCliente.cliente;
        
        JPQLQuery<Cliente> query = from(cliente);
        
        Path<?>[] paths = new Path<?>[] {cliente.username,cliente.password,cliente.email,cliente.telefono,cliente.enabled,cliente.nombre,cliente.apellido,cliente.domicilio,cliente.domicilio2,cliente.localidad};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(USERNAME, cliente.username)
			.map(PASSWORD, cliente.password)
			.map(EMAIL, cliente.email)
			.map(TELEFONO, cliente.telefono)
			.map(ENABLED, cliente.enabled)
			.map(NOMBRE, cliente.nombre)
			.map(APELLIDO, cliente.apellido)
			.map(DOMICILIO, cliente.domicilio)
			.map(DOMICILIO_2, cliente.domicilio2)
			.map(LOCALIDAD, cliente.localidad);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, cliente);
    }
    
}
