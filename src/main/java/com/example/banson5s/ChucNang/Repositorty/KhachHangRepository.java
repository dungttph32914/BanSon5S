package com.example.banson5s.ChucNang.Repositorty;

import com.example.banson5s.ChucNang.Entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {
}
