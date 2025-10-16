package com.t2404.test.repository;

import com.t2404.test.entity.Player;

import java.util.List;

public interface PlayerRepository {
    List<Player> findAll();
    Player findById(int id);
    boolean insert(Player player);
    boolean update(Player player);
    boolean delete(int id);
}
