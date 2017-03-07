package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.reference.Categoria;

/**
 * = CategoriaRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = CategoriaRepositoryCustom.class)
public class CategoriaRepositoryImpl extends QueryDslRepositorySupportExt<Categoria> {

    /**
     * TODO Auto-generated constructor documentation
     */
    CategoriaRepositoryImpl() {
        super(Categoria.class);
    }
}