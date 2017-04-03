package ar.edu.um.programacion2.oficios.repository;
import ar.edu.um.programacion2.oficios.reference.Historial;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.annotations.finder.RooFinder;

/**
 * = HistorialRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = Historial.class, finders = { @RooFinder(value = "findByServicio", returnType = Historial.class) })
public interface HistorialRepository {
}
