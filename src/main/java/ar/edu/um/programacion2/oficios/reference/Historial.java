package ar.edu.um.programacion2.oficios.reference;

import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Version;

import org.springframework.roo.addon.javabean.annotations.RooEquals;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;

import ar.edu.um.programacion2.oficios.domain.CalificacionCliente;
import ar.edu.um.programacion2.oficios.domain.CalificacionPrestador;
import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.domain.Servicio;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooEquals(isJpaEntity = true)
public class Historial {
	
    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @Version
    private Integer version;
    
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cliente_id")
    private Cliente cliente;
    
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="servicio_id")
    private Servicio servicio;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="calificacion_id")
    private CalificacionCliente calificacion_cliente;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="calificacion_prestador_id")
    private CalificacionPrestador calificacion_prestador;
    
}
