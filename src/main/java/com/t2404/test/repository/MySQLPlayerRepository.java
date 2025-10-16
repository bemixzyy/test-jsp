package com.t2404.test.repository;

import com.t2404.test.entity.Player;
import com.t2404.test.helper.MySQLHelper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLPlayerRepository {
    public List<Player> getAllPlayers() {
        List<Player> players = new ArrayList<>();
        try (Connection conn = MySQLHelper.getConnection()) {
            String sql = "SELECT * FROM player";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Player p = new Player();
                p.setPlayerId(rs.getInt("player_id"));
                p.setName(rs.getString("name"));
                p.setFullName(rs.getString("full_name"));
                p.setAge(rs.getString("age"));
                p.setIndexId(rs.getInt("index_id"));
                players.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return players;
    }

    public void insertPlayer(Player p) {
        try (Connection conn = MySQLHelper.getConnection()) {
            String sql = "INSERT INTO player (name, full_name, age, index_id) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getFullName());
            ps.setString(3, p.getAge());
            ps.setInt(4, p.getIndexId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Player getPlayerById(int id) {
        Player p = null;
        try (Connection conn = MySQLHelper.getConnection()) {
            String sql = "SELECT * FROM player WHERE player_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Player();
                p.setPlayerId(rs.getInt("player_id"));
                p.setName(rs.getString("name"));
                p.setFullName(rs.getString("full_name"));
                p.setAge(rs.getString("age"));
                p.setIndexId(rs.getInt("index_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public void updatePlayer(Player p) {
        try (Connection conn = MySQLHelper.getConnection()) {
            String sql = "UPDATE player SET name=?, full_name=?, age=?, index_id=? WHERE player_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getFullName());
            ps.setString(3, p.getAge());
            ps.setInt(4, p.getIndexId());
            ps.setInt(5, p.getPlayerId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deletePlayer(int id) {
        try (Connection conn = MySQLHelper.getConnection()) {
            String sql = "DELETE FROM player WHERE player_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
