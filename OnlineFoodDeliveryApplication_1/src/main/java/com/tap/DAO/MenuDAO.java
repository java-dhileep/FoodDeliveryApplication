package com.tap.DAO;

import com.tap.model.Menu;
import java.util.List;
public interface MenuDAO {
	void addMenu(Menu menu);
	void updateMenu(Menu menu);
	void deleteMenu(int menuId);
	List getAllMenuByRestaurant(int restaurantId);
	Menu getMenu(int menuId);
	List<Menu> getAllMenus();
}
