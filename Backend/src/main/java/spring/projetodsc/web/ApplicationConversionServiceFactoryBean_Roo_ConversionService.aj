// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package spring.projetodsc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import spring.projetodsc.domain.Advogado;
import spring.projetodsc.domain.Cliente;
import spring.projetodsc.domain.Processo;
import spring.projetodsc.service.AdvogadoService;
import spring.projetodsc.service.ClienteService;
import spring.projetodsc.service.ProcessoService;
import spring.projetodsc.web.ApplicationConversionServiceFactoryBean;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    AdvogadoService ApplicationConversionServiceFactoryBean.advogadoService;
    
    @Autowired
    ClienteService ApplicationConversionServiceFactoryBean.clienteService;
    
    @Autowired
    ProcessoService ApplicationConversionServiceFactoryBean.processoService;
    
    public Converter<Advogado, String> ApplicationConversionServiceFactoryBean.getAdvogadoToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<spring.projetodsc.domain.Advogado, java.lang.String>() {
            public String convert(Advogado advogado) {
                return new StringBuilder().append(advogado.getName()).append(' ').append(advogado.getDatanascimento()).append(' ').append(advogado.getEmail()).append(' ').append(advogado.getEndereco()).toString();
            }
        };
    }
    
    public Converter<Long, Advogado> ApplicationConversionServiceFactoryBean.getIdToAdvogadoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, spring.projetodsc.domain.Advogado>() {
            public spring.projetodsc.domain.Advogado convert(java.lang.Long id) {
                return advogadoService.findAdvogado(id);
            }
        };
    }
    
    public Converter<String, Advogado> ApplicationConversionServiceFactoryBean.getStringToAdvogadoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, spring.projetodsc.domain.Advogado>() {
            public spring.projetodsc.domain.Advogado convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Advogado.class);
            }
        };
    }
    
    public Converter<Cliente, String> ApplicationConversionServiceFactoryBean.getClienteToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<spring.projetodsc.domain.Cliente, java.lang.String>() {
            public String convert(Cliente cliente) {
                return new StringBuilder().append(cliente.getName()).append(' ').append(cliente.getSexo()).append(' ').append(cliente.getTelefone()).append(' ').append(cliente.getEndereco()).toString();
            }
        };
    }
    
    public Converter<Long, Cliente> ApplicationConversionServiceFactoryBean.getIdToClienteConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, spring.projetodsc.domain.Cliente>() {
            public spring.projetodsc.domain.Cliente convert(java.lang.Long id) {
                return clienteService.findCliente(id);
            }
        };
    }
    
    public Converter<String, Cliente> ApplicationConversionServiceFactoryBean.getStringToClienteConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, spring.projetodsc.domain.Cliente>() {
            public spring.projetodsc.domain.Cliente convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Cliente.class);
            }
        };
    }
    
    public Converter<Processo, String> ApplicationConversionServiceFactoryBean.getProcessoToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<spring.projetodsc.domain.Processo, java.lang.String>() {
            public String convert(Processo processo) {
                return new StringBuilder().append(processo.getName()).append(' ').append(processo.getStatus()).append(' ').append(processo.getAutor()).append(' ').append(processo.getDescricao()).toString();
            }
        };
    }
    
    public Converter<Long, Processo> ApplicationConversionServiceFactoryBean.getIdToProcessoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, spring.projetodsc.domain.Processo>() {
            public spring.projetodsc.domain.Processo convert(java.lang.Long id) {
                return processoService.findProcesso(id);
            }
        };
    }
    
    public Converter<String, Processo> ApplicationConversionServiceFactoryBean.getStringToProcessoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, spring.projetodsc.domain.Processo>() {
            public spring.projetodsc.domain.Processo convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Processo.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getAdvogadoToStringConverter());
        registry.addConverter(getIdToAdvogadoConverter());
        registry.addConverter(getStringToAdvogadoConverter());
        registry.addConverter(getClienteToStringConverter());
        registry.addConverter(getIdToClienteConverter());
        registry.addConverter(getStringToClienteConverter());
        registry.addConverter(getProcessoToStringConverter());
        registry.addConverter(getIdToProcessoConverter());
        registry.addConverter(getStringToProcessoConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
