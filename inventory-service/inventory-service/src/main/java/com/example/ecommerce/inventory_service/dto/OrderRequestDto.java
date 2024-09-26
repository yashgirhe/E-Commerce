package com.example.ecommerce.inventory_service.dto;

import lombok.Data;

import java.util.List;

@Data
public class OrderRequestDto {

    private List<OrderRequestItemDto> items;
}
