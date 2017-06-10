package ca.com.navasgroup.springmvc.controllers;



import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/hello")
public class HelloController {
	
	//  http://localhost:8080/hello/message
	
	@RequestMapping("/message")
	public String message(){
		return "hello";
	}
	
	@RequestMapping("/servermessage")
	public String servermessage(Model model){
		model.addAttribute("mensagem",new Date().toString());
		return "servermessage";
	}
	
	@RequestMapping("/servermessage2")
	public ModelAndView servermessagev2(){
		return new ModelAndView("servermessage", "mensagem","Date " + new Date().toString());
	}
	
	//Usuario passa a msg que vai aparecer na tela atravez da rota. "URL"
	@RequestMapping("/recevemessage/{text}")
	public String clientMessage(Model model,@PathVariable("text") String msg){
		model.addAttribute("mensagem", msg);
		return "servermessage";
	}
	
	@RequestMapping("/recevemessage2")
	public String clientMessage2(Model model, @RequestParam(value = "text", required = false, defaultValue = "Mensagem padrao.") String msg){
		model.addAttribute("mensagem", msg);
		return "servermessage";
	}
}
