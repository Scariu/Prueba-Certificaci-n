package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.models.Vehiculo;

public interface VehiculoRepository extends JpaRepository<Vehiculo, Long> {
	List<Vehiculo> findByUsuarioId(Long usuarioId);
}