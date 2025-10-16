package com.t2404.test.controller;

import com.t2404.test.entity.Player;
import com.t2404.test.repository.MySQLPlayerRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class PlayerServlet extends HttpServlet {
    private MySQLPlayerRepository  mySQLPlayerRepository = new MySQLPlayerRepository();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Player> list = mySQLPlayerRepository.getAllPlayers();
        req.setAttribute("players", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        dispatcher.forward(req, resp);
    }
}
