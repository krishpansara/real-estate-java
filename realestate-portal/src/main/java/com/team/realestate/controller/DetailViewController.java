package com.team.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.team.realestate.dao.PropertyDAO;
import com.team.realestate.model.Property;

@Controller
public class DetailViewController {

    @GetMapping("/property/detail")
    public String detailView(
            @RequestParam("id") int id,
            @RequestParam(value = "status", required = false) String status,
            Model model) {

        PropertyDAO dao = new PropertyDAO();
        Property property = dao.getPropertyById(id);

        if (property == null) {
            return "redirect:/page?name=home";
        }

        model.addAttribute("property", property);
        model.addAttribute("status", status);

        return "detail_offer/detail_offer";
    }
}