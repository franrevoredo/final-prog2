package ar.edu.um.programacion2.oficios.repository;
import ar.edu.um.programacion2.oficios.domain.Cliente;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.annotations.finder.RooFinder;

/**
 * = ClienteRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = Cliente.class, finders = { @RooFinder(value = "findByUsername", returnType = Cliente.class), @RooFinder(value = "findByEmail", returnType = Cliente.class) })
public interface ClienteRepository {
}
