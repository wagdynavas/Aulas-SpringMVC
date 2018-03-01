package ca.com.navasgroup.springmvc.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import ca.com.navasgroup.springmvc.dominios.Usuario;

public interface RepositorioUsuario extends JpaRepository<Usuario, Long>{

	Usuario findByUsername(String username);
}
