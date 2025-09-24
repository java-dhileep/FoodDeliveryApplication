package com.tap.DAO;

import java.util.List;
import com.tap.model.Orders;
public interface OrdersDAO {
	int addOrder(Orders orders);
	void updateOrder(Orders orders);
	void deleteOrder(int orderId);
	Orders getOrder(int orderId);
	List<Orders> getAllOrders();
	List<Orders> getAllOrders_SpecificId(int userId);
}
