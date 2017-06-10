package ca.com.navasgroup.springmvc.dominios;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Album {

	@NotNull(message ="O nome deve ser preechido!")
	@NotEmpty(message = "O nome deve ser preenchido!")
	private String nome;

	@NotNull(message = "O ano de  lancamento deve ser preenchido!")
	@Min(value = 1948, message = "O ano de lancamento deve ser apartir de 1948.")
	@Max(value = 2016, message = "O ano de lancamento deve ser até 2016.")
	private int anoDeLancamento;

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

}
