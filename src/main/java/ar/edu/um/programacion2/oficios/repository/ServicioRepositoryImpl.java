package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.domain.Servicio;

/**
 * = ServicioRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = ServicioRepositoryCustom.class)
public class ServicioRepositoryImpl extends QueryDslRepositorySupportExt<Servicio> {

    /**
     * TODO Auto-generated constructor documentation
     */
    ServicioRepositoryImpl() {
        super(Servicio.class);
    }
}