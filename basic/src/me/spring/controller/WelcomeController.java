package me.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/welcome")
public class WelcomeController {
	@RequestMapping(value = "/index", produces = "text/html;charset=utf-8")	
	@ResponseBody
	public String index() {
		return "恭喜，当你看到我时，表示你成功了！";
	}}
