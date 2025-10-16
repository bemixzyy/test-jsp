package com.t2404.test.controller;

import com.t2404.test.entity.Player;
import com.t2404.test.repository.MySQLPlayerRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AddPlayerServlet extends HttpServlet {
    private MySQLPlayerRepository mySQLPlayerRepository = new MySQLPlayerRepository();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name = req.getParameter("name");
        String fullName = req.getParameter("full_name");
        String age = req.getParameter("age");
        int indexId = Integer.parseInt(req.getParameter("index_id"));

        // Validation
        if (name == null || name.isEmpty() || fullName == null || fullName.isEmpty()) {
            req.setAttribute("error", "All fields are required!");
            req.getRequestDispatcher("add-player.jsp").forward(req, resp);
            return;
        }

        Player p = new Player();
        p.setName(name);
        p.setFullName(fullName);
        p.setAge(age);
        p.setIndexId(indexId);
        mySQLPlayerRepository.insertPlayer(p);

        resp.sendRedirect("players");
    }
}
