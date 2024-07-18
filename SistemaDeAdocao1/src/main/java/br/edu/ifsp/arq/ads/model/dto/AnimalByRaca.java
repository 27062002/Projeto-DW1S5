package br.edu.ifsp.arq.ads.model.dto;

public class AnimalByRaca {

	private String raca;
	private Integer count;

	public AnimalByRaca(String raca, Integer count) {
		this.raca = raca;
		this.count = count;
	}
	
	public AnimalByRaca() {
	}

	public String getRaca() {
		return raca;
	}

	public void setRaca(String raca) {
		this.raca = raca;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}
