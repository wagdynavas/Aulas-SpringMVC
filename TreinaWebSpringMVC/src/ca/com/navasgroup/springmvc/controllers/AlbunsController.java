package ca.com.navasgroup.springmvc.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ca.com.navasgroup.springmvc.dominios.Album;

@Controller
@RequestMapping("/albuns")
public class AlbunsController {
	
	@RequestMapping( value = "/adicionar", method = RequestMethod.GET)
	public String adicionar(Model model){
		model.addAttribute("album", new Album());
		return "albuns.adicionar.tiles"; 
	}
	
	//A anotion @Valid valida o objeto marcado. As regras e validacao, foram todas feitas na propria classe Album
	//BindingResult contem o resultado da validacao a ser aplicada dentro de Album
	@RequestMapping(value = "/adicionar", method = RequestMethod.POST) 
	public String adicionar(@ModelAttribute("album") @Valid Album novoAlbum, BindingResult result, Model model){
		//Caso o cliente preencha algum campo incorretamete, volte para a pagida de adicionar album
		if(result.hasErrors()){
			return "albuns.adicionar.tiles";
		}
		model.addAttribute("album", novoAlbum);
		return "albuns.exibir.tiles";
	}
}
