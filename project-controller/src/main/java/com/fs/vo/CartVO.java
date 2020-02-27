package com.fs.vo;

import com.fs.entity.order.OrderCart;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartVO {
	private Map<Integer, OrderCart> carts = new HashMap<Integer, OrderCart>();
	
	public void addCartItem(OrderCart cart) {
		OrderCart itemInCart = carts.get(cart.getProductId());
		if(itemInCart != null) {
			itemInCart.setProductAmount(itemInCart.getProductAmount()+ cart.getProductAmount());
		}else {
			carts.put(cart.getProductId(), cart);
		}
	}
	
	public List<OrderCart> getItems() {
		return new ArrayList<OrderCart>(carts.values());
	}
	
	public int getCategoryCount() {
		return carts.size();
	}
	
	public int getProductCount() {
		int total = 0;
		for(OrderCart cart : carts.values()) {
			total += cart.getProductAmount();
		}
		return total;
	}
	
	public void removeProduct(Integer id, Integer amount) {
		OrderCart cart = carts.get(id);
		if(cart == null) {return;}
		if (amount > 0){
			cart.setProductAmount(amount);
		}
		carts.remove(id);
	}
	
	public BigDecimal getTotal() {
		BigDecimal total = new BigDecimal(0);
		for (OrderCart cart : carts.values()) {
			if (cart.getChecked().equals("true")) {
				total = total.add(cart.getPrice().multiply(BigDecimal.valueOf(cart.getProductAmount())));
			}
		}
		return total;
	}
}
