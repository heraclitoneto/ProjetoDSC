// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package spring.projetodsc.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.projetodsc.domain.Processo;
import spring.projetodsc.service.ProcessoServiceImpl;

privileged aspect ProcessoServiceImpl_Roo_Service {
    
    declare @type: ProcessoServiceImpl: @Service;
    
    declare @type: ProcessoServiceImpl: @Transactional;
    
    public long ProcessoServiceImpl.countAllProcessoes() {
        return Processo.countProcessoes();
    }
    
    public void ProcessoServiceImpl.deleteProcesso(Processo processo) {
        processo.remove();
    }
    
    public Processo ProcessoServiceImpl.findProcesso(Long id) {
        return Processo.findProcesso(id);
    }
    
    public List<Processo> ProcessoServiceImpl.findAllProcessoes() {
        return Processo.findAllProcessoes();
    }
    
    public List<Processo> ProcessoServiceImpl.findProcessoEntries(int firstResult, int maxResults) {
        return Processo.findProcessoEntries(firstResult, maxResults);
    }
    
    public void ProcessoServiceImpl.saveProcesso(Processo processo) {
        processo.persist();
    }
    
    public Processo ProcessoServiceImpl.updateProcesso(Processo processo) {
        return processo.merge();
    }
    
}
