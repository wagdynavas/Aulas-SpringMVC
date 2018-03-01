package ca.com.navasgroup.springmvc.dominios;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "usr_usuario")
public class Usuario {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "usr_id")
	private Long Id;
	
	@Column(name = "usr_username", length = 10, nullable = false)
	@Size(min = 3, max = 10, message = "Nome de usuário precisa estar entre 3 e 10 caracteres! ")
	@NotEmpty(message = "Nome de usuário é obrigatório")
	private String username;
	
	@Column(name = "usr_password", length = 150, nullable = false)
	private String password;
	
	@Column(name = "usr_role", length = 20, nullable = false)
	private String role;
	
	public Usuario(){
		
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	
}
