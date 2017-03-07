package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.domain.Cliente;

/**
 * = ClienteRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = ClienteRepositoryCustom.class)
public class ClienteRepositoryImpl extends QueryDslRepositorySupportExt<Cliente> {

    /**
     * TODO Auto-generated constructor documentation
     */
    ClienteRepositoryImpl() {
        super(Cliente.class);
    }
}