package dto;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import lombok.Data;

@Entity
@Data
public class Student {
	@Id
	@GeneratedValue(generator = "regno")
	@SequenceGenerator(initialValue = 121001, allocationSize = 1, name = "regno", sequenceName = "regno")
	int regno;
	String name;
	@Column(nullable = false, unique = true)
	String email;
	@Column(nullable = false, unique = true)
	long mobile;
	String password;
	int standard;
	@Lob
	byte[] picture;

	@OneToMany
	List<MarksCard> cards;

	public int getRegno() {
		return regno;
	}

	public void setRegno(int regno) {
		this.regno = regno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStandard() {
		return standard;
	}

	public void setStandard(int standard) {
		this.standard = standard;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public List<MarksCard> getCards() {
		return cards;
	}

	public void setCards(List<MarksCard> cards) {
		this.cards = cards;
	}

}
