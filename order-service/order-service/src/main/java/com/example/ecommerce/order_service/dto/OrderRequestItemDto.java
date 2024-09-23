package com.example.ecommerce.order_service.dto;

import lombok.Data;

@Data
public class OrderRequestItemDto {

    private Long id;
    private Long productId;
    private Integer quantity;
}
