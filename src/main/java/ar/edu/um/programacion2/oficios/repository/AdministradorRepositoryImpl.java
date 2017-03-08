package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.domain.Administrador;

/**
 * = AdministradorRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = AdministradorRepositoryCustom.class)
public class AdministradorRepositoryImpl extends QueryDslRepositorySupportExt<Administrador> {

    /**
     * TODO Auto-generated constructor documentation
     */
    AdministradorRepositoryImpl() {
        super(Administrador.class);
    }
}