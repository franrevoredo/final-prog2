package ar.edu.um.programacion2.oficios.domain;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;

/**
 * = CalificacionCliente
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity
public class CalificacionCliente extends Calificacion {
	
	
	public CalificacionCliente(Cliente autor, Servicio servicio) {
		this.autor = autor;
		this.servicio = servicio;
	}
	
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cliente_id")
    private Cliente autor;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="servicio_id")
    private Servicio servicio;
}
