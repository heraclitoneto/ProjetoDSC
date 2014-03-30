package spring.projetodsc.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Past;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Advogado {

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @NotNull
    @Past
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date datanascimento;

    /**
     */
    @NotNull
    private String email;

    /**
     */
    @NotNull
    private String endereco;

    /**
     */
    @NotNull
    private String telefone;

    /**
     */
    @NotNull
    private String sexo;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL)
    private Set<Cliente> clientes = new HashSet<Cliente>();
}
