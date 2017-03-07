package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.domain.CalificacionPrestador;

/**
 * = CalificacionPrestadorRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = CalificacionPrestadorRepositoryCustom.class)
public class CalificacionPrestadorRepositoryImpl extends QueryDslRepositorySupportExt<CalificacionPrestador> {

    /**
     * TODO Auto-generated constructor documentation
     */
    CalificacionPrestadorRepositoryImpl() {
        super(CalificacionPrestador.class);
    }
}