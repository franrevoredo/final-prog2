package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.reference.Disponibilidad;

/**
 * = DisponibilidadRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = DisponibilidadRepositoryCustom.class)
public class DisponibilidadRepositoryImpl extends QueryDslRepositorySupportExt<Disponibilidad> {

    /**
     * TODO Auto-generated constructor documentation
     */
    DisponibilidadRepositoryImpl() {
        super(Disponibilidad.class);
    }
}