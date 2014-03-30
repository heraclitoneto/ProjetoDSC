package spring.projetodsc;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import spring.projetodsc.domain.Advogado;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Advogado.class)
@Controller
@RequestMapping("/advogadoes")
@RooWebScaffold(path = "advogadoes", formBackingObject = Advogado.class)
public class AdvogadoController {
}
