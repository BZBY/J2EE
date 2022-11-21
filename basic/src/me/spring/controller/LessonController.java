package me.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import me.spring.bean.Result;
import me.spring.entity.User;
import me.spring.entity.UserView;
import me.spring.service.UserService;

// 127.0.0.1:8080/basic/lesson/index

@Controller
@RequestMapping("/lesson")
public class LessonController {
	@Autowired UserService userService;
	// 首页
	@RequestMapping(value = "/index", produces = "text/html;charset=utf-8")	
	public String getIndexPage(Model model) {
		Result result = new Result();
		result.setCode(0);
        result.setMsg("无");
        model.addAttribute("result", result);
		return "login";
	}
	
	// 登录过程
	@RequestMapping(value = "/login", method=RequestMethod.POST, produces = "text/html;charset=utf-8")	
	public String login(@RequestParam("loginname") String loginname, @RequestParam("password") String password,  Model model, HttpServletRequest request) {
		System.out.println("loginname = " + loginname);
		System.out.println("password = " + password);
		User user = userService.findByLoginname(loginname);
		Result result = new Result();
		if (user != null) {
			if (user.getPassword().equals(password)) {
				
		        result.setCode(0);
		        result.setMsg("登录成功");
		        request.getSession().setAttribute("user", user);
		        model.addAttribute("result", result);
				return "redirect:userCenter";
			}
		}
		result.setCode(-1);
        result.setMsg("登录失败");
        model.addAttribute("result", result);
		System.out.println("数据库中未查询到");
		return "login";
	}
	
	// 去往注册界面
	@RequestMapping(value = "/toRegist", produces = "text/html;charset=utf-8")	
	public String toRegist(Model model) {
		Result result = new Result();
		result.setCode(0);
        result.setMsg("无");
        model.addAttribute("result", result);
		return "regist";
	}
	
	// 注册过程代码
	@RequestMapping(value = "/regist", produces = "text/html;charset=utf-8")	
	public String getRegistPage(@RequestParam("loginname") String loginname, 
								@RequestParam("username") String username,
								@RequestParam("password") String password,
								@RequestParam("comfirmPassword") String comfirmPassword,
								@RequestParam("phone") String phone,
								Model model) {
		UserView userView = new UserView();
		Result result = new Result();
		
		User user = userService.findByLoginname(loginname);
		if (user != null) {  // 如果数据库中存在该用户  不能注册
			model.addAttribute("existLoginname", "此用户名已被注册！");
			model.addAttribute("userView", userView);
			result.setCode(-1);
	        result.setMsg("注册失败");
	        model.addAttribute("result", result);
	        return "regist";
		}
		
		boolean b = true;  // 注册不成功标志
		if (loginname.equals("")) {
			model.addAttribute("emptyLoginname", "用户登录名不能为空");
			b = false;
		}
		if (username.equals("")) {
			model.addAttribute("emptyUsername", "用户昵称不能为空");
			b = false;
		}
		if (!(comfirmPassword.equals(password) && !password.equals(""))) {
			model.addAttribute("passwordError", "两次密码必须一致");
			b = false;
		}
		
		if (phone.equals("")) {
			model.addAttribute("emptyPhone", "电话不得为空");
			b = false;
		}
		userView.setLoginname(loginname);
		userView.setUsername(username);
		userView.setPhone(phone);
		if (b) {
			userView.setPassword(password);
			userView.setRoleCode("00");  // 新注册的员工默认是普通用户
			userView.setCaption("普通用户");
			int val = userService.add(userView);  // 写入数据库
			System.out.println("val = " + val);
			if (val > 1) {
				result.setCode(0);
		        result.setMsg("注册成功，点击返回");
		        model.addAttribute("userView", userView);
		        model.addAttribute("result", result);
		        return "regist";
			}
			return "regist";
		} else {
			model.addAttribute("userView", userView);
			result.setCode(-1);
	        result.setMsg("注册失败");
	        model.addAttribute("result", result);
			return "regist";
		}
		
	}
	
	@RequestMapping(value = "/userCenter", produces = "text/html;charset=utf-8")	
	public String userCenter() {
		return "main";
	}
	
	@RequestMapping(value = "/list", produces = "text/html;charset=utf-8")	
	public String getList(User user, Model model) {
		Result result = new Result();
        result.setCode(0);
        result.setMsg("查询成功");
        result.setData(userService.listAll());      
       //  user = userService.getById(user);
        if(user==null) {
            user = new User();
        }
        model.addAttribute("user", user);
        model.addAttribute("result", result);
        return "list";
	}
}
