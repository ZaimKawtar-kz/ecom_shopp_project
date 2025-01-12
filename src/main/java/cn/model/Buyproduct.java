package cn.model;

public class Buyproduct {
	
	private int id;
	private String date;
	private String quntity;
	private String email;
	private String categorie;
	
	
	
	public Buyproduct() {
	}

	
	public Buyproduct(int id, String date, String quntity, String email, String categorie) {
		
		this.id = id;
		this.date = date;
		this.quntity = quntity;
		this.email = email;
		this.categorie = categorie;
	}

	public String getCategorie() {
		return categorie;
	}
	public String getDate() {
		return date;
	}
	 public String getEmail() {
		return email;
	}
	 public int getId() {
		return id;
	}
	 public String getQuntity() {
		return quntity;
	}
	 public void setQuntity(String quntity) {
		this.quntity = quntity;
	}
	  public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	  public void setDate(String date) {
		this.date = date;
	}
	  public void setEmail(String email) {
		this.email = email;
	}
	  public void setId(int id) {
		this.id = id;
	}
	  
	  @Override
		public String toString() {
			return "Buyproduct[id=" + id + ", date=" + date+ ", quntity=" +quntity + ", email=" + email + ", categorie="
					+ categorie + "]";

	  }
}
