package com.tap.DAO;

import com.tap.model.OrderItem;
import java.util.List;

public interface OrderItemDAO {
	void addOrderItem(OrderItem orderItem);
	void updateOrderItem(OrderItem orderItem);
	void deleteOrderItem(int orderId);
	OrderItem getOrderItem(int orderId);
	List<OrderItem> getAllOrderItem();
	List<OrderItem> getAllOrderItemSpecificOrderId(int orderId);
}
