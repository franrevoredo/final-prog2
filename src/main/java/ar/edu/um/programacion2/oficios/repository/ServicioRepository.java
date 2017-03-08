package ar.edu.um.programacion2.oficios.repository;
import ar.edu.um.programacion2.oficios.domain.Servicio;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.annotations.finder.RooFinder;

/**
 * = ServicioRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = Servicio.class, finders = { @RooFinder(value = "findByTelefono", returnType = Servicio.class), @RooFinder(value = "findByNombreLike", returnType = Servicio.class), @RooFinder(value = "findByPuntaje", returnType = Servicio.class), @RooFinder(value = "findByCategoria", returnType = Servicio.class), @RooFinder(value = "queryByCategoria", returnType = Servicio.class) })
public interface ServicioRepository {
}
