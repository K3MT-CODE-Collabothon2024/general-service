package com.collabothon2024.k3mt.k3mt.mapper;

import com.collabothon2024.k3mt.k3mt.dto.CustomerDto;
import com.collabothon2024.k3mt.k3mt.entity.CustomerEntity;
import org.springframework.stereotype.Component;

@Component
public class CustomerMapper {
    // create a function that would convert CustomerEntity to CustomerDto
    public CustomerDto toDto(CustomerEntity customerEntity) {
        CustomerDto customerDto = new CustomerDto();
        customerDto.setCustomerId(customerEntity.getCustomerId());
        customerDto.setCompanyName(customerEntity.getCompanyName());
        customerDto.setCreatedDate(customerEntity.getCreatedDate());
        customerDto.setCash(customerEntity.getCash());
        return customerDto;
    }


    // create a function that would convert CustomerDto to CustomerEntity
    public CustomerEntity toEntity(CustomerDto customerDto) {
        CustomerEntity customerEntity = new CustomerEntity();
        customerEntity.setCustomerId(customerDto.getCustomerId());
        customerEntity.setCompanyName(customerDto.getCompanyName());
        customerEntity.setCreatedDate(customerDto.getCreatedDate());
        customerEntity.setCash(customerDto.getCash());
        return customerEntity;
    }
}
