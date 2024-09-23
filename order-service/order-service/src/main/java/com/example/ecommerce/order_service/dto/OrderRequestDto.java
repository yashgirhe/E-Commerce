package com.example.ecommerce.order_service.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class OrderRequestDto {

    private Long id;
    private List<OrderRequestItemDto> items;
    private BigDecimal totalPrice;
}
