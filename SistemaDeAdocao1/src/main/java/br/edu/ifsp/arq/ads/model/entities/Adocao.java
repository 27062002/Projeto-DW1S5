package br.edu.ifsp.arq.ads.model.entities;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;
import br.edu.ifsp.arq.ads.model.entities.User;

public class Adocao implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private LocalDate date;
	private User user;
	private int animal;
	private String email;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public int getAnimal() {
		return animal;
	}
	
	public void setAnimal(int animal) {
		this.animal = animal;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Adocao other = (Adocao) obj;
		return Objects.equals(id, other.id);
	}
	
}