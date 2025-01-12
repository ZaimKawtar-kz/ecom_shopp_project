package cn.model;

public class OrdersBuy extends Product {
	private int orderId;
	private int uid;
	private String date;
	private int qunatity;
	
 public OrdersBuy() {
	
}
 public OrdersBuy(int orderId, int uid, int qunatity, String date) {
		
		this.orderId = orderId;
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
	}

	public OrdersBuy(int uid, int qunatity, String date) {
		super();
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
	}

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getQunatity() {
		return qunatity;
	}
	public void setQunatity(int qunatity) {
		this.qunatity = qunatity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
