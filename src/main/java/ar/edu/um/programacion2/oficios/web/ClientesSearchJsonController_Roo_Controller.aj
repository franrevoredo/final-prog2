// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.service.api.ClienteService;
import ar.edu.um.programacion2.oficios.web.ClientesSearchJsonController;

privileged aspect ClientesSearchJsonController_Roo_Controller {
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private ClienteService ClientesSearchJsonController.clienteService;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ClienteService
     */
    public ClienteService ClientesSearchJsonController.getClienteService() {
        return clienteService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param clienteService
     */
    public void ClientesSearchJsonController.setClienteService(ClienteService clienteService) {
        this.clienteService = clienteService;
    }
    
}
