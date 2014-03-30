package spring.projetodsc;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import spring.projetodsc.domain.Processo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Processo.class)
@Controller
@RequestMapping("/processoes")
@RooWebScaffold(path = "processoes", formBackingObject = Processo.class)
public class ProcessoController {
}
