package com.example.banson5s.BanHang.Repository;

import com.example.banson5s.ChucNang.Entity.PhieuGiamGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhieuGiamGiaRepository extends JpaRepository<PhieuGiamGia, Long> {
}
