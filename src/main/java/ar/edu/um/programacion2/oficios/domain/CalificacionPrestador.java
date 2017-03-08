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
	
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="calificacion_id")
    private CalificacionCliente calificacion_destino;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="prestador_id")
    private Prestador autor;
    
}
