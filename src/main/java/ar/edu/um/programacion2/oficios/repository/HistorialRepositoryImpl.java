package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.reference.Historial;

/**
 * = HistorialRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = HistorialRepositoryCustom.class)
public class HistorialRepositoryImpl extends QueryDslRepositorySupportExt<Historial> {

    /**
     * TODO Auto-generated constructor documentation
     */
    HistorialRepositoryImpl() {
        super(Historial.class);
    }
}