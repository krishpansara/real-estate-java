package com.team.realestate.controller;

import java.io.File;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team.realestate.dao.PropertyDAO;
import com.team.realestate.dao.UserDAO;
import com.team.realestate.model.Property;
import com.team.realestate.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {

    private UserDAO userDAO = new UserDAO();
    private PropertyDAO propertyDAO = new PropertyDAO();

    // ─── PROFILE PAGE ───────────────────────────────────────────────
    @GetMapping("/profile")
    public String showProfile(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            return "redirect:/page?name=login";
        }

        int userId = (int) session.getAttribute("userId");

        User user = userDAO.getUserProfileById(userId);
        if (user == null) return "redirect:/page?name=login";

        List<Property> userProperties = propertyDAO.getPropertiesByUserId(userId);
        int[] stats = userDAO.getUserPropertyStats(userId);

        // ── Format createdAt as readable string ──
        String memberSince = user.getCreatedAt().getMonth().getDisplayName(
            java.time.format.TextStyle.FULL, java.util.Locale.ENGLISH
        ) + " " + user.getCreatedAt().getYear();

        model.addAttribute("user", user);
        model.addAttribute("memberSince", memberSince);
        model.addAttribute("userProperties", userProperties);
        model.addAttribute("totalProperties", stats[0]);
        model.addAttribute("activeProperties", stats[1]);
        model.addAttribute("soldProperties", stats[2]);

        return "Profile_pages/profile";
    }

    // ─── EDIT PROFILE PAGE (GET) ─────────────────────────────────────
    @GetMapping("/edit-profile")
    public String showEditProfile(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            return "redirect:/page?name=login";
        }

        int userId = (int) session.getAttribute("userId");
        User user = userDAO.getUserProfileById(userId);
        if (user == null) return "redirect:/page?name=login";

        model.addAttribute("user", user);
        return "Profile_pages/edit_profile";
    }

    // ─── UPDATE PROFILE (POST) ───────────────────────────────────────
    @PostMapping("/update-profile")
    public String updateProfile(
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam(value = "dateOfBirth", required = false) String dateOfBirth,
            @RequestParam(value = "gender", required = false) String gender,
            @RequestParam(value = "address", required = false) String address,
            @RequestParam(value = "city", required = false) String city,
            @RequestParam(value = "state", required = false) String state,
            @RequestParam(value = "zipCode", required = false) String zipCode,
            @RequestParam(value = "country", required = false) String country,
            @RequestParam(value = "aadhar", required = false) String aadhar,
            @RequestParam(value = "currentPassword", required = false) String currentPassword,
            @RequestParam(value = "newPassword", required = false) String newPassword,
            @RequestParam(value = "confirmPassword", required = false) String confirmPassword,
            @RequestParam(value = "profilePicture", required = false) MultipartFile profilePicture,
            HttpServletRequest request,
            Model model) {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            return "redirect:/page?name=login";
        }

        int userId = (int) session.getAttribute("userId");
        User existingUser = userDAO.getUserProfileById(userId);
        if (existingUser == null) return "redirect:/page?name=login";

        // ── Handle profile picture upload ──
        String picturePath = existingUser.getProfilePicture();
        if (profilePicture != null && !profilePicture.isEmpty()) {
            try {
                String uploadPath = request.getServletContext()
                        .getRealPath("/assets/images/profile_pictures/");
                new File(uploadPath).mkdirs();
                String fileName = "user_" + userId + "_" + System.currentTimeMillis()
                        + "_" + profilePicture.getOriginalFilename();
                profilePicture.transferTo(new File(uploadPath + fileName));
                picturePath = fileName;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // ── Build updated user ──
        existingUser.setFirstName(firstName.trim());
        existingUser.setLastName(lastName.trim());
        existingUser.setEmail(email.trim());
        existingUser.setPhone(phone.trim());
        existingUser.setGender(gender);
        existingUser.setStreetAddress(address);
        existingUser.setCity(city);
        existingUser.setState(state);
        existingUser.setZipCode(zipCode);
        existingUser.setCountry(country);
        existingUser.setProfilePicture(picturePath);
        existingUser.setAadharNumber(aadhar);

        if (dateOfBirth != null && !dateOfBirth.isEmpty()) {
            existingUser.setDateOfBirth(java.sql.Date.valueOf(dateOfBirth));
        }

        boolean updated = userDAO.updateUserProfile(existingUser);

        // ── Handle password change ──
        if (newPassword != null && !newPassword.isEmpty()) {
            if (currentPassword != null && BCrypt.checkpw(currentPassword, existingUser.getPasswordHash())) {
                if (newPassword.equals(confirmPassword)) {
                    String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
                    userDAO.updatePassword(userId, hashed);
                } else {
                    model.addAttribute("user", existingUser);
                    model.addAttribute("error", "Passwords do not match");
                    return "Profile_pages/edit_profile";
                }
            } else {
                model.addAttribute("user", existingUser);
                model.addAttribute("error", "Current password is incorrect");
                return "Profile_pages/edit_profile";
            }
        }

        if (updated) {
            session.setAttribute("userName", firstName.trim() + " " + lastName.trim());
            return "redirect:/profile?success=true";
        } else {
            model.addAttribute("user", existingUser);
            model.addAttribute("error", "Update failed. Please try again.");
            return "Profile_pages/edit_profile";
        }
    }

    // ─── DELETE PROPERTY ─────────────────────────────────────────────
    @PostMapping("/property/delete")
    public String deleteProperty(
            @RequestParam("propertyId") int propertyId,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            return "redirect:/page?name=login";
        }

        int userId = (int) session.getAttribute("userId");
        PropertyDAO dao = new PropertyDAO();
        dao.deletePropertyByIdAndUser(propertyId, userId);

        return "redirect:/profile";
    }
}