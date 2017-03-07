package ar.edu.um.programacion2.oficios.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import ar.edu.um.programacion2.oficios.reference.Persona;

/**
 * = PersonaRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = PersonaRepositoryCustom.class)
public class PersonaRepositoryImpl extends QueryDslRepositorySupportExt<Persona> {

    /**
     * TODO Auto-generated constructor documentation
     */
    PersonaRepositoryImpl() {
        super(Persona.class);
    }
}