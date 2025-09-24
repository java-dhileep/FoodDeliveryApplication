package com.tap.model;

public class OrderItem {
private int orderItemId;
private int orderId;
private int menuId;
private int quantity;
private double totalPrize;
public OrderItem()
{
	
}
public OrderItem(int orderItemId, int orderId, int menuId,int quantity, double totalPrize) {
	super();
	this.orderItemId = orderItemId;
	this.orderId = orderId;
	this.menuId = menuId;
	this.quantity = quantity;
	this.totalPrize = totalPrize;
}

public OrderItem(int orderId, int menuId, int quantity, double totalPrize) {
	super();
	this.orderId = orderId;
	this.menuId = menuId;
	this.quantity = quantity;
	this.totalPrize = totalPrize;
}
public int getOrderItemId() {
	return orderItemId;
}
public void setOrderItemId(int orderItemId) {
	this.orderItemId = orderItemId;
}
public int getOrderId() {
	return orderId;
}
public void setOrderId(int orderId) {
	this.orderId = orderId;
}
public int getMenuId() {
	return menuId;
}
public void setMenuId(int menuId) {
	this.menuId = menuId;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public double getTotalPrize() {
	return totalPrize;
}
public void setTotalPrize(double totalPrize) {
	this.totalPrize = totalPrize;
}
@Override
public String toString() {
	return "OrderItem [orderItemId=" + orderItemId + ", orderId=" + orderId + ", menuId=" + menuId + ", quantity="
			+ quantity + ", totalPrize=" + totalPrize + "]";
}

}
