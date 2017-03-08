package ar.edu.um.programacion2.oficios.repository;
import ar.edu.um.programacion2.oficios.reference.Persona;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.annotations.finder.RooFinder;

/**
 * = PersonaRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = Persona.class, finders = { @RooFinder(value = "findByUsername", returnType = Persona.class) })
public interface PersonaRepository {
}
