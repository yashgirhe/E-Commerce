package com.example.ecommerce.inventory_service.dto;

import lombok.Data;

@Data
public class OrderRequestItemDto {

    private Long productId;
    private Integer quantity;
}
