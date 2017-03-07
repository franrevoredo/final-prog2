package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.domain.Calificacion;

/**
 * = CalificacionRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = CalificacionRepositoryCustom.class)
public class CalificacionRepositoryImpl extends QueryDslRepositorySupportExt<Calificacion> {

    /**
     * TODO Auto-generated constructor documentation
     */
    CalificacionRepositoryImpl() {
        super(Calificacion.class);
    }
}