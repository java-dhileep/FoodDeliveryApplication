package com.tap.DAO;

import java.util.List;
import com.tap.model.Restaurant;
public interface RestaurantDAO {
	void addRestaurant(Restaurant restaurant);
	void updateRestaurant(Restaurant restaurant);
	void deleteRestaurant(int restaurantId);
	Restaurant getRestaurant(int restaurantId);
	List<Restaurant> getAllRestaurant();
}
