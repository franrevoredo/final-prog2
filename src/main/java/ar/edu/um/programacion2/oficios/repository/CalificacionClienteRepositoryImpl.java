package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.domain.CalificacionCliente;

/**
 * = CalificacionClienteRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = CalificacionClienteRepositoryCustom.class)
public class CalificacionClienteRepositoryImpl extends QueryDslRepositorySupportExt<CalificacionCliente> {

    /**
     * TODO Auto-generated constructor documentation
     */
    CalificacionClienteRepositoryImpl() {
        super(CalificacionCliente.class);
    }
}