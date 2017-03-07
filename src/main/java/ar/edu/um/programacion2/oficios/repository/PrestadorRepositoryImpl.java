package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.domain.Prestador;

/**
 * = PrestadorRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = PrestadorRepositoryCustom.class)
public class PrestadorRepositoryImpl extends QueryDslRepositorySupportExt<Prestador> {

    /**
     * TODO Auto-generated constructor documentation
     */
    PrestadorRepositoryImpl() {
        super(Prestador.class);
    }
}