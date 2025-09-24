package com.tap.DAOimp;

import java.util.HashMap;
import java.util.Map;

import com.tap.DAO.CartDAO;
import com.tap.model.CartItem;

public class Cart implements CartDAO {
	
Map<Integer,CartItem> items=new HashMap<Integer,CartItem>();

@Override
public void addItem(CartItem cartItem) {
 int itemId=cartItem.getId();
 if(items.containsKey(itemId))
 {
	 CartItem existingItem=items.get(itemId);
	 existingItem.setQuantity(existingItem.getQuantity()+cartItem.getQuantity());
 }
 else
 {
	 items.put(itemId, cartItem);
 }
}

public void addItemsFromReorder(int menuId,CartItem item) {
	items.put(menuId, item);	
}

@Override
public void updateItem(int itemId, int quantity) {
	if(items.containsKey(itemId))
	{
		if(quantity <=0)
		{
			items.remove(itemId);
		}
		else
		{
			items.get(itemId).setQuantity(quantity);
		}
		
	}
	
}

@Override
public void removeItem(int itemId) {
	items.remove(itemId);
}


public Map<Integer,CartItem> getItems()
{
	return items;
}

public void clear()
{
	items.clear();
}

}
