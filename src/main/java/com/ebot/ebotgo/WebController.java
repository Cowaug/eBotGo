package com.ebot.ebotgo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class WebController {
    public static String REDIRECT_BACK = "rdrct_bck";

    @RequestMapping(value = "/")
    public String viewHome(ModelMap modelMap, HttpServletRequest request) {
        modelMap.addAttribute("textBox1", request.getSession().getId());
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String viewLogin(ModelMap modelMap, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") != null) {
            return "redirect:"+(request.getHeader("referer") != null ? request.getHeader("referer") : "/");
        }
        modelMap.addAttribute("message", "Give me new password :>");
        modelMap.addAttribute("color", "dimgray");
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String viewLoginPOST(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
        try {
            // authentication
            String auth = JawMySQL.login(request.getParameter("user-id"),request.getParameter("password"));
            if (auth !=null) {
                request.getSession().setAttribute("username", auth);
                return "redirect:/" + (request.getSession().getAttribute("redirect") == null ? "" : request.getSession().getAttribute("redirect"));
            }
            modelMap.addAttribute("message", "Forgot <strong>User ID</strong> or <strong>Password</strong>?");
        }catch (Exception ex){
            System.out.println("Stmt error: "+ ex.getMessage());
            modelMap.addAttribute("message", "<strong>Server is under maintain :(</strong>");
        }
        modelMap.addAttribute("color", "darkred");
        return "login";
    }

    @RequestMapping(value = "/logout")
    public String viewLogout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:" + (request.getParameter(REDIRECT_BACK) != null ? request.getParameter(REDIRECT_BACK) : "/");
    }

    @RequestMapping(value = "/forgot",method = RequestMethod.GET)
    public String viewForgot(HttpServletRequest request) {
        return "forgot";
    }

    @RequestMapping(value = "/forgot",method = RequestMethod.POST)
    public String viewForgotPOST(HttpServletRequest request) {
        return "forgot";
    }

    @RequestMapping(value = "/config")
    public String viewConfig(ModelMap modelMap, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") != null) {
            modelMap.addAttribute("data", "Hello " + session.getAttribute("username"));
            return "config";
        } else {
            session.setAttribute(REDIRECT_BACK, "config");
            return "redirect:login";
        }
    }
}