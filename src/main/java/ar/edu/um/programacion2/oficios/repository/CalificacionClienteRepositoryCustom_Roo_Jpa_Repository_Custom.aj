// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.repository;

import ar.edu.um.programacion2.oficios.domain.CalificacionCliente;
import ar.edu.um.programacion2.oficios.repository.CalificacionClienteRepositoryCustom;
import io.springlets.data.domain.GlobalSearch;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

privileged aspect CalificacionClienteRepositoryCustom_Roo_Jpa_Repository_Custom {
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<CalificacionCliente> CalificacionClienteRepositoryCustom.findAll(GlobalSearch globalSearch, Pageable pageable);
    
}