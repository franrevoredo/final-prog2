package ar.edu.um.programacion2.oficios.domain;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;

/**
 * = CalificacionPrestador
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity
public class CalificacionPrestador extends Calificacion {
	
    public CalificacionPrestador(CalificacionCliente calificacion_destino, Prestador autor) {
		super();
		this.calificacion_destino = calificacion_destino;
		this.autor = autor;
	}

	@OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="calificacion_id")
    private CalificacionCliente calificacion_destino;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="prestador_id")
    private Prestador autor;
    

	/**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String toString() {
        return autor + " en respuesta a {" + calificacion_destino + "} - " + super.toString();
    }
}
