// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.domain.Calificacion;
import ar.edu.um.programacion2.oficios.service.api.CalificacionService;
import ar.edu.um.programacion2.oficios.web.CalificacionDeserializer;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import io.springlets.web.NotFoundException;
import java.io.IOException;
import org.springframework.boot.jackson.JsonComponent;
import org.springframework.core.convert.ConversionService;

privileged aspect CalificacionDeserializer_Roo_EntityDeserializer {
    
    declare @type: CalificacionDeserializer: @JsonComponent;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return CalificacionService
     */
    public CalificacionService CalificacionDeserializer.getCalificacionService() {
        return calificacionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param calificacionService
     */
    public void CalificacionDeserializer.setCalificacionService(CalificacionService calificacionService) {
        this.calificacionService = calificacionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ConversionService
     */
    public ConversionService CalificacionDeserializer.getConversionService() {
        return conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param conversionService
     */
    public void CalificacionDeserializer.setConversionService(ConversionService conversionService) {
        this.conversionService = conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param jsonParser
     * @param context
     * @param codec
     * @param tree
     * @return Calificacion
     * @throws IOException
     */
    public Calificacion CalificacionDeserializer.deserializeObject(JsonParser jsonParser, DeserializationContext context, ObjectCodec codec, JsonNode tree) throws IOException {
        String idText = tree.asText();
        Long id = conversionService.convert(idText, Long.class);
        Calificacion calificacion = calificacionService.findOne(id);
        if (calificacion == null) {
            throw new NotFoundException("Calificacion not found");
        }
        return calificacion;
    }
    
}
