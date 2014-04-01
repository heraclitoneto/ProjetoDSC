// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package spring.projetodsc.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import spring.projetodsc.domain.Advogado;

privileged aspect Advogado_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Advogado.entityManager;
    
    public static final List<String> Advogado.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "datanascimento", "email", "endereco", "telefone", "sexo", "clientes");
    
    public static final EntityManager Advogado.entityManager() {
        EntityManager em = new Advogado().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Advogado.countAdvogadoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Advogado o", Long.class).getSingleResult();
    }
    
    public static List<Advogado> Advogado.findAllAdvogadoes() {
        return entityManager().createQuery("SELECT o FROM Advogado o", Advogado.class).getResultList();
    }
    
    public static List<Advogado> Advogado.findAllAdvogadoes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Advogado o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Advogado.class).getResultList();
    }
    
    public static Advogado Advogado.findAdvogado(Long id) {
        if (id == null) return null;
        return entityManager().find(Advogado.class, id);
    }
    
    public static List<Advogado> Advogado.findAdvogadoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Advogado o", Advogado.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Advogado> Advogado.findAdvogadoEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Advogado o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Advogado.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Advogado.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Advogado.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Advogado attached = Advogado.findAdvogado(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Advogado.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Advogado.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Advogado Advogado.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Advogado merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}