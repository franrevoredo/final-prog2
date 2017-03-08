package ar.edu.um.programacion2.oficios.repository;
import ar.edu.um.programacion2.oficios.reference.Categoria;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.annotations.finder.RooFinder;

/**
 * = CategoriaRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = Categoria.class, finders = { @RooFinder(value = "findByNombre", returnType = Categoria.class) })
public interface CategoriaRepository {
}
