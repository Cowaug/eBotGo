package com.ebot.ebotgo;


//import com.ebot.MikoBot.MainClass;
import com.github.javafaker.Faker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class WebController {
    @Autowired
    JawMySQL jawMySQL;

    public static final String USER_INFO = "sr_nf";
    public static final String REDIRECT_BACK = "rdrct_bck";

    @RequestMapping({"/","/home"})
    public String viewHome(ModelMap modelMap, HttpServletRequest request) {
        try {
            User user = (User) request.getSession().getAttribute(USER_INFO);
            modelMap.addAttribute("username", user.getUsername());
        } catch (NullPointerException ignored) {
            Faker faker = new Faker();
            modelMap.addAttribute("username", faker.name().fullName());//todo
        }
        return "home";
    }

    //LOGIN 1

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String viewLogin(ModelMap modelMap, HttpServletRequest request) {
        User user;
        if ((user = (User) request.getSession().getAttribute(USER_INFO)) != null) {
            return "redirect:" + (request.getHeader("referer") != null ? request.getHeader("referer") : "home");
        } else {
            modelMap.addAttribute("message", "Give me new password :>");
            modelMap.addAttribute("color", "dimgray");
            return "login";
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String viewLoginPOST(ModelMap modelMap, HttpServletRequest request) {
        try {
            // authentication
            User user = jawMySQL.login(request.getParameter("user-id"), request.getParameter("password"));

            if (user != null) {
                request.getSession().setAttribute(USER_INFO, user);
                return "redirect:" + (request.getSession().getAttribute(REDIRECT_BACK) == null ? "home" : request.getSession().getAttribute(REDIRECT_BACK));
            }
            modelMap.addAttribute("message", "Forgot <strong>User ID</strong> or <strong>Password</strong>?");
        } catch (Exception ex) {
            ex.printStackTrace();
            modelMap.addAttribute("message", "Server issue :< Please try again");
            System.out.println("Login error: " + ex.getMessage());
        }
        modelMap.addAttribute("color", "darkred");
        return "login";
    }

    //LOGIN 2

    @RequestMapping(value = "/login2", method = RequestMethod.GET)
    public String viewLogin2(ModelMap modelMap, HttpServletRequest request) {
        User user;
        if ((user = (User) request.getSession().getAttribute(USER_INFO)) != null) {
            return "redirect:" + (request.getHeader("referer") != null ? request.getHeader("referer") : "home");
        } else {
            modelMap.addAttribute("message", "Give me new password :>");
            modelMap.addAttribute("color", "dimgray");
            return "login2";
        }
    }

    @RequestMapping(value = "/login2", method = RequestMethod.POST)
    public String viewLogin2POST(ModelMap modelMap, HttpServletRequest request) {
        try {
            // authentication
            User user = jawMySQL.login2(request.getParameter("user-id"), request.getParameter("password"));

            if (user != null) {
                request.getSession().setAttribute(USER_INFO, user);
                return "redirect:" + (request.getSession().getAttribute(REDIRECT_BACK) == null ? "home" : request.getSession().getAttribute(REDIRECT_BACK));
            }
            modelMap.addAttribute("message", "Forgot <strong>User ID</strong> or <strong>Password</strong>?");
        } catch (Exception ex) {
            ex.printStackTrace();
            modelMap.addAttribute("message", "Server issue :< Please try again");
            System.out.println("Login error: " + ex.getMessage());
        }
        modelMap.addAttribute("color", "darkred");
        return "login2";
    }

    //LOGIN 3

    @RequestMapping(value = "/login3", method = RequestMethod.GET)
    public String viewLogin3(ModelMap modelMap, HttpServletRequest request) {
        User user;
        if ((user = (User) request.getSession().getAttribute(USER_INFO)) != null) {
            return "redirect:" + (request.getHeader("referer") != null ? request.getHeader("referer") : "home");
        } else {
            modelMap.addAttribute("message", "Give me new password :>");
            modelMap.addAttribute("color", "dimgray");
            return "login3";
        }
    }

    @RequestMapping(value = "/login3", method = RequestMethod.POST)
    public String viewLogin3POST(ModelMap modelMap, HttpServletRequest request) {
        try {
            // authentication
            User user = jawMySQL.login3(request.getParameter("user-id"), request.getParameter("password"));

            if (user != null) {
                request.getSession().setAttribute(USER_INFO, user);
                return "redirect:" + (request.getSession().getAttribute(REDIRECT_BACK) == null ? "home" : request.getSession().getAttribute(REDIRECT_BACK));
            }
            modelMap.addAttribute("message", "Forgot <strong>User ID</strong> or <strong>Password</strong>?");
        } catch (Exception ex) {
            ex.printStackTrace();
            modelMap.addAttribute("message", "Server issue :< Please try again");
            System.out.println("Login error: " + ex.getMessage());
        }
        modelMap.addAttribute("color", "darkred");
        return "login3";
    }

    //LOGIN 3

    @RequestMapping(value = "/login4", method = RequestMethod.GET)
    public String viewLogin4(ModelMap modelMap, HttpServletRequest request) {
        User user;
        if ((user = (User) request.getSession().getAttribute(USER_INFO)) != null) {
            return "redirect:" + (request.getHeader("referer") != null ? request.getHeader("referer") : "home");
        } else {
            modelMap.addAttribute("message", "Give me new password :>");
            modelMap.addAttribute("color", "dimgray");
            return "login4";
        }
    }

    @RequestMapping(value = "/login4", method = RequestMethod.POST)
    public String viewLogin4POST(ModelMap modelMap, HttpServletRequest request) {
        try {
            // authentication
            User user = jawMySQL.login3(request.getParameter("user-id"), request.getParameter("password"));

            if (user != null) {
                request.getSession().setAttribute(USER_INFO, user);
                return "redirect:" + (request.getSession().getAttribute(REDIRECT_BACK) == null ? "home" : request.getSession().getAttribute(REDIRECT_BACK));
            }
            modelMap.addAttribute("message", "Forgot <strong>User ID</strong> or <strong>Password</strong>?");
        } catch (Exception ex) {
            ex.printStackTrace();
            modelMap.addAttribute("message", "Server issue :< Please try again");
            System.out.println("Login error: " + ex.getMessage());
        }
        modelMap.addAttribute("color", "darkred");
        return "login4";
    }

    //

    @RequestMapping(value = "/logout")
    public String viewLogout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:" + (request.getParameter(REDIRECT_BACK) != null ? request.getParameter(REDIRECT_BACK) : "home");
    }

    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public String viewForgot(HttpServletRequest request) {
        return "forgot";
    }

    @RequestMapping(value = "/forgot", method = RequestMethod.POST)
    public String viewForgotPOST(HttpServletRequest request) {
        return "forgot";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    public String viewChangePassword(ModelMap modelMap, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user;
        if ((user = (User) request.getSession().getAttribute(USER_INFO)) != null) {
            modelMap.addAttribute("username", user.getUsername());
            modelMap.addAttribute("message", "Let me give you a new identity <strong>" + user.getUsername() + "</strong>");
            modelMap.addAttribute("color", "dimgray");
            return "changePassword";
        } else {
            session.setAttribute(REDIRECT_BACK, "changePassword");
            return "redirect:login";
        }
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String viewChangePasswordPOST(ModelMap modelMap, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user;

        if ((user = (User) request.getSession().getAttribute(USER_INFO)) != null) {
            if (request.getParameter("newPassword").equals(request.getParameter("newPassword2")))
                try {
                    if (jawMySQL.changePassword(
                            user.getUserId(),
                            request.getParameter("oldPassword"),
                            request.getParameter("newPassword")) == 1)
                        return "redirect:/home";
                } catch (Exception e) {
                    System.out.println("Change password: " + e.getMessage());
                }

            modelMap.addAttribute("username", user.getUsername());
            modelMap.addAttribute("message", "Wrong password");
            modelMap.addAttribute("color", "darkred");
            return "changePassword";
        } else {
            session.setAttribute(REDIRECT_BACK, "changePassword");
            return "redirect:login";
        }
    }

    @RequestMapping(value = "/config")
    public String viewConfig(ModelMap modelMap, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user;

        if ((user = (User) request.getSession().getAttribute(USER_INFO)) != null) {

            modelMap.addAttribute("data", "Hello " + user.getUsername());
            return "config";
        } else {
            session.setAttribute(REDIRECT_BACK, "config");
            return "redirect:login";
        }
    }
}