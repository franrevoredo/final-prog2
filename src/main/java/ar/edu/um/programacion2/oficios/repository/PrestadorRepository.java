package ar.edu.um.programacion2.oficios.repository;
import ar.edu.um.programacion2.oficios.domain.Prestador;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.annotations.finder.RooFinder;

/**
 * = PrestadorRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = Prestador.class, finders = { @RooFinder(value = "findByUsername", returnType = Prestador.class), @RooFinder(value = "findByEmail", returnType = Prestador.class) })
public interface PrestadorRepository {
}
