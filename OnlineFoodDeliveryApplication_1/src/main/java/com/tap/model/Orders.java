package com.tap.model;

import java.sql.Timestamp;

public class Orders {
private int orderId;
private int userId;
private int restaurantId;
private Timestamp orderDate;
private double totalAmount;
private String status;
private String payMentMode;
private String deliveryAddress;

public Orders(int userId, int restaurantId, Timestamp orderDate, double totalAmount, String status, String payMentMode,
		String deliveryAddress) {
	super();
	this.userId = userId;
	this.restaurantId = restaurantId;
	this.orderDate = orderDate;
	this.totalAmount = totalAmount;
	this.status = status;
	this.payMentMode = payMentMode;
	this.deliveryAddress = deliveryAddress;
}
public Orders() {

}
public Orders(int userId, int restaurantId, double totalAmount, String status, String payMentMode) {
	super();
	this.userId = userId;
	this.restaurantId = restaurantId;
	this.totalAmount = totalAmount;
	this.status = status;
	this.payMentMode = payMentMode;
}

public Orders(int orderId, int userId, int restaurantId, Timestamp orderDate, double totalAmount, String status,
		String payMentMode) {
	super();
	this.orderId = orderId;
	this.userId = userId;
	this.restaurantId = restaurantId;
	this.orderDate = orderDate;
	this.totalAmount = totalAmount;
	this.status = status;
	this.payMentMode = payMentMode;
}

public Orders(int orderId, int userId, int restaurantId, Timestamp orderDate, double totalAmount, String status,
		String payMentMode, String deliveryAddress) {
	super();
	this.orderId = orderId;
	this.userId = userId;
	this.restaurantId = restaurantId;
	this.orderDate = orderDate;
	this.totalAmount = totalAmount;
	this.status = status;
	this.payMentMode = payMentMode;
	this.deliveryAddress = deliveryAddress;
}
public String getDeliveryAddress() {
	return deliveryAddress;
}
public void setDeliveryAddress(String deliveryAddress) {
	this.deliveryAddress = deliveryAddress;
}
public int getOrderId() {
	return orderId;
}
public void setOrderId(int orderId) {
	this.orderId = orderId;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public int getRestaurantId() {
	return restaurantId;
}
public void setRestaurantId(int restaurantId) {
	this.restaurantId = restaurantId;
}
public Timestamp getOrderDate() {
	return orderDate;
}
public void setOrderDate(Timestamp orderDate) {
	this.orderDate = orderDate;
}
public double getTotalAmount() {
	return totalAmount;
}
public void setTotalAmount(double totalAmount) {
	this.totalAmount = totalAmount;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getPayMentMode() {
	return payMentMode;
}
public void setPayMentMode(String payMentMode) {
	this.payMentMode = payMentMode;
}

@Override
public String toString() {
	return "Orders [orderId=" + orderId + ", userId=" + userId + ", restaurantId=" + restaurantId + ", orderDate="
			+ orderDate + ", totalAmount=" + totalAmount + ", status=" + status + ", payMentMode=" + payMentMode + "]";
}


}
