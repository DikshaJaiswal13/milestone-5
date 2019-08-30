package com.example.stockspring.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.stockspring.SendEmail;
import com.example.stockspring.model.Company;
import com.example.stockspring.model.Otp;
import com.example.stockspring.model.User;
import com.example.stockspring.service.UserService;
import com.example.stockspring.service.UserServiceImpl;

@Controller
public class UserControllerImpl implements UserController{

	@Autowired
	private UserService userService=new UserServiceImpl();

	User user=new User();
	SendEmail sendMail=new SendEmail();
	int otp1=0;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(ModelMap model) throws SQLException {
		System.out.println("inside get login");

		//e.setEmail("sdfsf");
		//	e.setSalary(4564.56f);

		model.addAttribute("l1", user);
		//model.addAttribute("sectorList", companyService.getSectorList());
		return "login";

	}


	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String submitLogin(@Valid User user, 
			BindingResult result, Model model, HttpSession session) throws SQLException {
		System.out.println("inside post login");
		//user.setUsertype("admin");
		//System.out.println(user);
		/*
		if(result.hasErrors()){
			System.out.println("errors");
			System.out.println(result.getAllErrors());
			model.addAttribute("l1", user);
			return "redirect:/login";
		}*/
		System.out.println(user.getUsername());
		System.out.println(user.getPassword());
		User u=new User();
		u=userService.login(user.getUsername(),user.getPassword());
		//model.addAttribute("name", employee.getName());
		System.out.println(u);
		/*	if((user.getUsername()==u.getUsername()) && (user.getPassword()==u.getPassword()))*/
		if(u!=null) {
			if(u.getPassword().equals(user.getPassword()))
				//session.setAttribute("user", u);
			{
				System.out.println("good credentials");
				System.out.println(u.getEmail());
				session.setAttribute("user", u);
				if(u.getUsertype().equals("admin"))
				return "redirect:/adminLandingPage";
				else
					return "redirect:/userLandingPage";

			}
			else
				return "redirect:/login";
		}
		else
			//JOptionPane.showMessageDialog(null, "message");
			return "redirect:/login";
	}


	@RequestMapping(value = "/register", method = RequestMethod.GET) 
	public String getRegister(ModelMap model) throws SQLException {
		//System.out.println("add company"); 
		User user=new User();
		//e.setEmail("sdfsf"); // e.setSalary(4564.56f);

		model.addAttribute("r1", user);

		//model.addAttribute("sectorList", companyService.getSectorList()); 
		return "register";

	}

	User u=new User();

	@RequestMapping(value = "/register1", method = RequestMethod.POST)
	public String adminLogin(@Valid User user, 
			BindingResult result, Model model) throws SQLException {
		System.out.println("inside post admin register");
		/*if(user.getUsername()==null || user.)
			return "redirect:/register";
		else {*/
		user.setUsertype("admin");
		System.out.println(user);
		u.setConfirmed(user.getConfirmed());
		u.setEmail(user.getEmail());
		u.setMobilenumber(user.getMobilenumber());
		u.setUsername(user.getUsername());
		u.setUsertype(user.getUsertype());
		u.setPassword(user.getPassword());
		if(result.hasErrors()){
			System.out.println("errors");
			System.out.println(result.getAllErrors());
			model.addAttribute("r1", user);
			return "redirect:/register";
		}
		//userService.insertUser(user);
		//call
		/*else {*/
		otp1=sendMail.sendMail(user.getEmail());
		return "redirect:/otpController";
		
	}
	

	@RequestMapping(value = "/register2", method = RequestMethod.POST)
	public String userLogin(@Valid User user, 
			BindingResult result, Model model) throws SQLException {
	/*	System.out.println("inside post user register");
		user.setUsertype("user");
		System.out.println(user);
		if(result.hasErrors()){
			System.out.println("errors");
			System.out.println(result.getAllErrors());
			model.addAttribute("r1", user);
			return "redirect:/register";
		}
		userService.insertUser(user);
		//model.addAttribute("name", employee.getName());
		return "redirect:/login";*/
		
		
		System.out.println("inside post user register");

		user.setUsertype("user");
		System.out.println(user);
		u.setConfirmed(user.getConfirmed());
		u.setEmail(user.getEmail());
		u.setMobilenumber(user.getMobilenumber());
		u.setUsername(user.getUsername());
		u.setUsertype(user.getUsertype());
		u.setPassword(user.getPassword());
		if(result.hasErrors()){
			System.out.println("errors");
			System.out.println(result.getAllErrors());
			model.addAttribute("r1", user);
			return "redirect:/register";
		}
		//userService.insertUser(user);
		//call

		otp1=sendMail.sendMail(user.getEmail());
		return "redirect:/otpController";
		
	}


	@RequestMapping(value = "/otpController", method = RequestMethod.GET)
	public String getOtpPage(ModelMap model) throws SQLException {
		Otp adminOtp=new Otp();
		model.addAttribute("c1", adminOtp);

		return "otpPage";

	}

	@RequestMapping(value = "/otpController", method = RequestMethod.POST)
	public String postOtpPage(@Valid Otp adminOtp, 
			BindingResult result, Model model) throws SQLException {
		System.out.println("inside post admin otp");

		//user.setUsertype("admin");
		System.out.println(adminOtp);

		if(result.hasErrors()){
			System.out.println("errors");
			System.out.println(result.getAllErrors());
			model.addAttribute("c1", adminOtp);
			return "redirect:/otpController";
		}
		
		System.out.println();

		if(otp1==adminOtp.getOtpVerification()) {

			if(userService.insertUser(u) && u.getUsertype().equals("admin"))
				return "redirect:/adminLandingPage";
			else
				return "redirect:/userLandingPage";
		}
		else
			return "redirect:/otpController";
		//return "redirect:/adminLandingPage";
		
		//return "redirect:/otpController";
	}

	@RequestMapping(value = "/adminLandingPage", method = RequestMethod.GET)
	public String getAdminLandingPage(ModelMap model) throws SQLException {

		return "adminLandingPage";

	}

	
	@RequestMapping(value = "/userLandingPage", method = RequestMethod.GET)
	public String getUserLandingPage(ModelMap model) throws SQLException {

		return "userLandingPage";

	}



}



