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
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Processo {

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @NotNull
    private String status;

    /**
     */
    @NotNull
    private String autor;

    /**
     */
    @NotNull
    private String descricao;

    /**
     */
    @NotNull
    @Past
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dataAbertura;

    /**
     */
    @NotNull
    private String codigo;

    /**
     */
    @NotNull
    @ManyToOne
    private Cliente cliente;
}
