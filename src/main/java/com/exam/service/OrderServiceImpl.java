package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.dto.MemberDTO;
import com.exam.dto.OrderDTO;
import com.exam.mapper.MemberMapper;
import com.exam.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderMapper orderMapper;

	@Override
	public void insertOrder(OrderDTO orderDTO) {
		orderMapper.insertOrder(orderDTO);
		
	}

	@Override
	public List<OrderDTO> orderList(String userId) {
		return orderMapper.orderList(userId);
	}

	
	

}
