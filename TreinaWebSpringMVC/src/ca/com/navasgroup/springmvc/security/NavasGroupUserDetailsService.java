package ca.com.navasgroup.springmvc.security;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import ca.com.navasgroup.springmvc.dominios.Usuario;
import ca.com.navasgroup.springmvc.repositorios.RepositorioUsuario;

public class NavasGroupUserDetailsService implements UserDetailsService{

	@Autowired
	private RepositorioUsuario repositorio;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuario usuario = repositorio.findByUsername(username);
		if(usuario == null){
			throw new UsernameNotFoundException("Usuário nao encontrado!");
		}
		Set<GrantedAuthority> perfis = new HashSet<GrantedAuthority>();
		perfis.add(new SimpleGrantedAuthority(usuario.getRole()));
		return new User(usuario.getUsername(), usuario.getPassword(), perfis);
	}

}
