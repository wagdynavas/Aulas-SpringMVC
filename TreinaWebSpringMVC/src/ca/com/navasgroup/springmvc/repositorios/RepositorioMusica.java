package ca.com.navasgroup.springmvc.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ca.com.navasgroup.springmvc.dominios.Musica;

public interface RepositorioMusica extends JpaRepository<Musica, Long>{

	@Query("SELECT a FROM Musica a WHERE a.nome LIKE %:nome%")
	List<Musica> findByNome(@Param("nome") String nome);
}
