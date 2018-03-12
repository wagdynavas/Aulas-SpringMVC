package ca.com.navasgroup.springmvc.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ca.com.navasgroup.springmvc.dominios.Usuario;
import ca.com.navasgroup.springmvc.repositorios.RepositorioUsuario;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private RepositorioUsuario repositorio;
	
	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	public String listar(Model model){
		List<Usuario> usuarios = repositorio.findAll();
		model.addAttribute("usuarios", usuarios);
		return "usuario.listar.tiles";
	}

	@RequestMapping(value = "/adicionar", method = RequestMethod.GET)
	public String adicionar(Model model){
		model.addAttribute("usuario", new Usuario());
		return "usuario.adicionar.tiles";
	}
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionar(@ModelAttribute("usuario") @Valid Usuario novoUsuario, 
			BindingResult result){
		if(result.hasErrors()){
			return"usuario.adicionar.tiles";
		}
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		novoUsuario.setPassword(encoder.encode(novoUsuario.getPassword()));
		repositorio.save(novoUsuario);
		return"redirect:/usuarios/listar";
	}
	
	@RequestMapping(value = "/alterar/{id}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long id, Model model){
		Usuario UsuarioASerAlterado = repositorio.findOne(id);
		model.addAttribute("usuario", UsuarioASerAlterado);
		return"usuario.alterar.tiles";
	}
	
	@RequestMapping(value= "/alterar", method = RequestMethod.POST)
	public String alterar(@ModelAttribute("usuario") @Valid Usuario usuario, BindingResult result){
		if(result.hasErrors()){
			return "usuario.alterar.tiles";
		}
		repositorio.save(usuario);
		return"redirect:/usuarios/listar";
	}
	
	@RequestMapping(value = "/excluir/{id}", method = RequestMethod.GET)
	public String excluir(@PathVariable("id") Long id){
		repositorio.delete(id);
		return"redirect:/usuarios/listar";
	}
}
