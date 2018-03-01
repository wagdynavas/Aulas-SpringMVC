package ca.com.navasgroup.springmvc.dominios;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "alb_albuns")
public class Album {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "alb_id")
	private Long id;

	@NotNull(message = "O nome deve ser preechido!")
	@NotEmpty(message = "O nome deve ser preenchido!")
	@Column(name = "alb_nome", nullable = false)
	private String nome;

	@NotNull(message = "O ano de  lancamento deve ser preenchido!")
	@Min(value = 1948, message = "O ano de lancamento deve ser apartir de 1948.")
	@Max(value = 2020, message = "O ano de lancamento deve ser até 2020.")
	@Column(name = "alb_ano_lancamento", nullable = false)
	private int anoDeLancamento;

	@OneToMany(mappedBy = "album", fetch = FetchType.EAGER, cascade = CascadeType.MERGE, orphanRemoval = true)
	private Set<Musica> musicas;
	
	public Album(){
		this.musicas = new HashSet<Musica>();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getAnoDeLancamento() {
		return anoDeLancamento;
	}

	public void setAnoDeLancamento(int anoDeLancamento) {
		this.anoDeLancamento = anoDeLancamento;
	}

	public void setMusicas(Set<Musica> musicas) {
		this.musicas = musicas;
	}

	public Set<Musica> getMusicas() {
		return musicas;
	}
}
