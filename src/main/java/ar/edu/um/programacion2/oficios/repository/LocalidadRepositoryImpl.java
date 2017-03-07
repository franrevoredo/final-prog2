package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.reference.Localidad;

/**
 * = LocalidadRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = LocalidadRepositoryCustom.class)
public class LocalidadRepositoryImpl extends QueryDslRepositorySupportExt<Localidad> {

    /**
     * TODO Auto-generated constructor documentation
     */
    LocalidadRepositoryImpl() {
        super(Localidad.class);
    }
}