package com.example.banson5s.SanPham.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "khoi_luong")
public class KhoiLuong {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ten_khoi_luong")
    private String tenKhoiLuong;

    @Column(name = "trang_thai")
    private Integer trangThai;

    // Getters và Setters
}
