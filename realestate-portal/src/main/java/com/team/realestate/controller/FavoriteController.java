package com.team.realestate.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.team.realestate.dao.FavoriteDAO;
import com.team.realestate.model.Property;
import jakarta.servlet.http.HttpSession;

@Controller
public class FavoriteController {

    private FavoriteDAO favoriteDAO = new FavoriteDAO();

    // Page: show all favorites
    @GetMapping("/favorites")
    public String favoritesPage(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/page?name=login";
        }
        List<Property> favorites = favoriteDAO.getFavoritePropertiesByUserId(userId);
        model.addAttribute("favorites", favorites);
        return "Favorite/Favorite";
    }

    // AJAX: toggle favorite (add/remove)
    @PostMapping("/favorite/toggle")
    @ResponseBody
    public String toggleFavorite(
            @RequestParam("propertyId") int propertyId,
            HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "NOT_LOGGED_IN";
        }
        boolean added = favoriteDAO.toggleFavorite(userId, propertyId);
        return added ? "ADDED" : "REMOVED";
    }

    // AJAX: check if a property is favorited by current user
    @GetMapping("/favorite/check")
    @ResponseBody
    public String checkFavorite(
            @RequestParam("propertyId") int propertyId,
            HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "NOT_LOGGED_IN";
        boolean fav = favoriteDAO.isFavorite(userId, propertyId);
        return fav ? "YES" : "NO";
    }

    // POST: remove favorite (from favorites page button)
    @PostMapping("/favorite/remove")
    public String removeFavorite(
            @RequestParam("propertyId") int propertyId,
            HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");
        if (userId != null) {
            favoriteDAO.removeFavorite(userId, propertyId);
        }
        return "redirect:/favorites";
    }
}