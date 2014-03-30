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
import spring.projetodsc.domain.Advogado;
import spring.projetodsc.domain.AdvogadoDataOnDemand;
import spring.projetodsc.service.AdvogadoService;

privileged aspect AdvogadoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AdvogadoDataOnDemand: @Component;
    
    private Random AdvogadoDataOnDemand.rnd = new SecureRandom();
    
    private List<Advogado> AdvogadoDataOnDemand.data;
    
    @Autowired
    AdvogadoService AdvogadoDataOnDemand.advogadoService;
    
    public Advogado AdvogadoDataOnDemand.getNewTransientAdvogado(int index) {
        Advogado obj = new Advogado();
        setDatanascimento(obj, index);
        setEmail(obj, index);
        setEndereco(obj, index);
        setName(obj, index);
        setSexo(obj, index);
        setTelefone(obj, index);
        return obj;
    }
    
    public void AdvogadoDataOnDemand.setDatanascimento(Advogado obj, int index) {
        Date datanascimento = new Date(new Date().getTime() - 10000000L);
        obj.setDatanascimento(datanascimento);
    }
    
    public void AdvogadoDataOnDemand.setEmail(Advogado obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void AdvogadoDataOnDemand.setEndereco(Advogado obj, int index) {
        String endereco = "endereco_" + index;
        obj.setEndereco(endereco);
    }
    
    public void AdvogadoDataOnDemand.setName(Advogado obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void AdvogadoDataOnDemand.setSexo(Advogado obj, int index) {
        String sexo = "sexo_" + index;
        obj.setSexo(sexo);
    }
    
    public void AdvogadoDataOnDemand.setTelefone(Advogado obj, int index) {
        String telefone = "telefone_" + index;
        obj.setTelefone(telefone);
    }
    
    public Advogado AdvogadoDataOnDemand.getSpecificAdvogado(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Advogado obj = data.get(index);
        Long id = obj.getId();
        return advogadoService.findAdvogado(id);
    }
    
    public Advogado AdvogadoDataOnDemand.getRandomAdvogado() {
        init();
        Advogado obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return advogadoService.findAdvogado(id);
    }
    
    public boolean AdvogadoDataOnDemand.modifyAdvogado(Advogado obj) {
        return false;
    }
    
    public void AdvogadoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = advogadoService.findAdvogadoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Advogado' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Advogado>();
        for (int i = 0; i < 10; i++) {
            Advogado obj = getNewTransientAdvogado(i);
            try {
                advogadoService.saveAdvogado(obj);
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
