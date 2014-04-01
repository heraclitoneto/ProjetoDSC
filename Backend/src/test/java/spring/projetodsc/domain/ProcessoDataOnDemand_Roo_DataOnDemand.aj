// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package spring.projetodsc.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import spring.projetodsc.domain.Cliente;
import spring.projetodsc.domain.ClienteDataOnDemand;
import spring.projetodsc.domain.Processo;
import spring.projetodsc.domain.ProcessoDataOnDemand;
import spring.projetodsc.service.ProcessoService;

privileged aspect ProcessoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProcessoDataOnDemand: @Component;
    
    private Random ProcessoDataOnDemand.rnd = new SecureRandom();
    
    private List<Processo> ProcessoDataOnDemand.data;
    
    @Autowired
    ClienteDataOnDemand ProcessoDataOnDemand.clienteDataOnDemand;
    
    @Autowired
    ProcessoService ProcessoDataOnDemand.processoService;
    
    public Processo ProcessoDataOnDemand.getNewTransientProcesso(int index) {
        Processo obj = new Processo();
        setAutor(obj, index);
        setCliente(obj, index);
        setCodigo(obj, index);
        setDataAbertura(obj, index);
        setDescricao(obj, index);
        setName(obj, index);
        setStatus(obj, index);
        return obj;
    }
    
    public void ProcessoDataOnDemand.setAutor(Processo obj, int index) {
        String autor = "autor_" + index;
        obj.setAutor(autor);
    }
    
    public void ProcessoDataOnDemand.setCliente(Processo obj, int index) {
        Cliente cliente = clienteDataOnDemand.getRandomCliente();
        obj.setCliente(cliente);
    }
    
    public void ProcessoDataOnDemand.setCodigo(Processo obj, int index) {
        String codigo = "codigo_" + index;
        obj.setCodigo(codigo);
    }
    
    public void ProcessoDataOnDemand.setDataAbertura(Processo obj, int index) {
        Date dataAbertura = new Date(new Date().getTime() - 10000000L);
        obj.setDataAbertura(dataAbertura);
    }
    
    public void ProcessoDataOnDemand.setDescricao(Processo obj, int index) {
        String descricao = "descricao_" + index;
        obj.setDescricao(descricao);
    }
    
    public void ProcessoDataOnDemand.setName(Processo obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void ProcessoDataOnDemand.setStatus(Processo obj, int index) {
        String status = "status_" + index;
        obj.setStatus(status);
    }
    
    public Processo ProcessoDataOnDemand.getSpecificProcesso(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Processo obj = data.get(index);
        Long id = obj.getId();
        return processoService.findProcesso(id);
    }
    
    public Processo ProcessoDataOnDemand.getRandomProcesso() {
        init();
        Processo obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return processoService.findProcesso(id);
    }
    
    public boolean ProcessoDataOnDemand.modifyProcesso(Processo obj) {
        return false;
    }
    
    public void ProcessoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = processoService.findProcessoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Processo' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Processo>();
        for (int i = 0; i < 10; i++) {
            Processo obj = getNewTransientProcesso(i);
            try {
                processoService.saveProcesso(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}