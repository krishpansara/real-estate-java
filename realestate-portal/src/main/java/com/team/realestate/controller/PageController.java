package com.team.realestate.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/page")
public class PageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");

        if ("contact_us".equals(name)) {
            request.getRequestDispatcher(
                "/WEB-INF/views/contact_us.jsp"
            ).forward(request, response);

        } else if ("explore".equals(name)) {
            request.getRequestDispatcher(
                "/WEB-INF/views/explore/explore.jsp"
            ).forward(request, response);

        } else {
            // default page
            request.getRequestDispatcher(
                "/index.jsp"
            ).forward(request, response);
        }
    }
}
