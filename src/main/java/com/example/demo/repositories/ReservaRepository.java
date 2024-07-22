package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.models.Reserva;

public interface ReservaRepository extends JpaRepository<Reserva, Long> {
	List<Reserva> findByUsuarioId(Long usuarioId);
}