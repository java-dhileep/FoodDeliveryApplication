package com.tap.DAO;

import com.tap.model.CartItem;

public interface CartDAO {
void addItem(CartItem carditem);
void updateItem(int itemId,int Quantity);
void removeItem(int id);

}
