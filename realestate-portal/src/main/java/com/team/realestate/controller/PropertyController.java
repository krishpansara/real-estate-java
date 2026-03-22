package com.team.realestate.controller;

import java.io.File;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.team.realestate.dao.PropertyDAO;
import com.team.realestate.model.Property;

@Controller
@RequestMapping("/property")
public class PropertyController {

    @PostMapping("/add")
    public String addProperty(
            @RequestParam Map<String, String> params,
            @RequestParam("images") MultipartFile[] images,
            Model model) {

        Map<String, String> errors = new HashMap<>();

        // 🔴 VALIDATION
        if (params.get("title") == null || params.get("title").isEmpty())
            errors.put("title", "Title required");

        if (params.get("price") == null || params.get("price").isEmpty())
            errors.put("price", "Price required");

        if (params.get("city") == null || params.get("city").isEmpty())
            errors.put("city", "City required");

        if (images == null || images.length == 0)
            errors.put("images", "Upload at least 1 image");

        if (!errors.isEmpty()) {
            model.addAttribute("errors", errors);
            return "property_listing/property_listing";
        }

        Property p = new Property();

        try {
            p.setTitle(params.get("title"));
            p.setDescription(params.get("description"));
            p.setPurpose(params.get("purpose"));
            p.setPropertyType(params.get("propertyType"));
            p.setPrice(Double.parseDouble(params.get("price")));
            p.setBedrooms(Integer.parseInt(params.get("bedrooms")));
            p.setBathrooms(Integer.parseInt(params.get("bathrooms")));
            p.setAreaSize(Integer.parseInt(params.get("areaSize")));

            p.setPropertyAge(params.get("propertyAge") == null || params.get("propertyAge").isEmpty()
                    ? 0 : Integer.parseInt(params.get("propertyAge")));

            p.setFurnishing(params.get("furnishing"));
            p.setFacing(params.get("facing"));
            p.setAvailability(params.get("availability"));
            p.setPriceNegotiable("Yes".equals(params.get("negotiable")));

            p.setCity(params.get("city"));
            p.setLocality(params.get("locality"));
            p.setGoogleMapUrl(params.get("mapEmbedUrl"));

        } catch (Exception e) {
            e.printStackTrace();
            return "property_listing/property_listing";
        }

        PropertyDAO dao = new PropertyDAO();
        int propertyId = dao.insertProperty(p);

        // 🔵 FILE UPLOAD
        String uploadPath = "C:/realestate_images/";
        new File(uploadPath).mkdirs();

        List<String> imagePaths = new ArrayList<>();

        for (MultipartFile file : images) {
            try {
                if (!file.isEmpty()) {
                    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                    file.transferTo(new File(uploadPath + fileName));
                    imagePaths.add(fileName);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        dao.insertImages(propertyId, imagePaths);

        return "redirect:/page?name=home";
    }
}