package com.exam.service;

import java.util.List;

import com.exam.dto.OrderDTO;

public interface OrderService {
	public void insertOrder(OrderDTO orderDTO);
	public List<OrderDTO> orderList(String userId);
}
