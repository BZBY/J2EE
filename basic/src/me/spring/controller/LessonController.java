package me.spring.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import me.spring.bean.Result;
import me.spring.entity.PageInfo;
import me.spring.entity.SystemTable;
import me.spring.entity.TableInfo;
import me.spring.entity.User;
import me.spring.entity.UserView;
import me.spring.service.UserService;

// 127.0.0.1:8080/basic/lesson/index

@Controller
@RequestMapping("/lesson")
public class LessonController {
	public static List<Integer> pageList = Arrays.asList(1, 2, 5, 10);

	public static List<String> tableList = Arrays.asList("面积分类", "装修分类", "物业分类", "套件分类", "朝向分类", "展示位置", "产权分类", "所属楼盘",
			"角色分类", "房屋状态");

	@Autowired
	UserService userService;

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
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	public String login(@RequestParam("loginname") String loginname, @RequestParam("password") String password,
			Model model, HttpServletRequest request) {
		System.out.println("loginname = " + loginname);
		System.out.println("password = " + password);
		User user = userService.findByLoginname(loginname);
		Result result = new Result();
		if (user != null) {
			if (user.getPassword().equals(password)) {
				List<UserView> userViewList = userService.getUserView(user);
				result.setCode(0);
				result.setMsg("登录成功");
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("userViewList", userViewList);
				request.getSession().setAttribute("pageVal", 1);
				model.addAttribute("result", result);
				// model.addAttribute("user", user);
				// model.addAttribute("userViewList", userViewList);
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
	public String getRegistPage(@RequestParam("loginname") String loginname, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("comfirmPassword") String comfirmPassword,
			@RequestParam("phone") String phone, Model model) {
		UserView userView = new UserView();
		Result result = new Result();

		User user = userService.findByLoginname(loginname);
		if (user != null) { // 如果数据库中存在该用户 不能注册
			model.addAttribute("existLoginname", "此用户名已被注册！");
			model.addAttribute("userView", userView);
			result.setCode(-1);
			result.setMsg("注册失败");
			model.addAttribute("result", result);
			return "regist";
		}

		boolean b = true; // 注册不成功标志
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
			userView.setRoleCode("00"); // 新注册的员工默认是普通用户
			userView.setCaption("普通用户");
			int val = userService.add(userView); // 写入数据库
			System.out.println("val = " + val);
			if (val > 0) {
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

	@RequestMapping(value = "/exit", produces = "text/html;charset=utf-8")
	public String exit(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:index";
	}

	@RequestMapping(value = "/userInfo", produces = "text/html;charset=utf-8")
	public String userInfo(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		Result result = new Result();
		model.addAttribute("user", user);
		result.setCode(0);
		result.setMsg("无");
		model.addAttribute("result", result);
		System.out.println("user.loginname = " + user.getLoginname());
		return "userInfo";
	}

	// 页面信息
	@RequestMapping(value = "/list", produces = "text/html;charset=utf-8")
	public String getList(@RequestParam(defaultValue = "5") String pageSize, HttpServletRequest request, User user,
			Model model) {
		Result result = new Result();
		result.setCode(0);
		result.setMsg("查询成功");
		result.setData(userService.listAll());

		user = userService.getById(user);

		if (user == null) {
			user = new User();
		} else {

			model.addAttribute("flag", true);
		}

		model.addAttribute("user", user);
		model.addAttribute("result", result);

		request.getSession().setAttribute("pageVal", 1);

		PageInfo pageInfo = new PageInfo();
		pageInfo.setCapacity(pageSize);
		int len = userService.listAll().size();
		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		return "list";
	}

	// 删除
	@RequestMapping(value = "/delete", produces = "text/html;charset=utf-8")
	public String delete(User user, Model model, HttpServletRequest request) {
		Result result = new Result();
		System.out.println("delete删除");
		try {
			int resultCount = userService.delete(user);
			if (resultCount > 0) {
				result.setCode(0);
				result.setMsg("删除成功");
			} else {
				result.setCode(-1);
				result.setMsg("删除失败");
			}
			result.setData(resultCount);
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("删除失败");
			e.printStackTrace();
		}
		result.setData(userService.listAll());
		model.addAttribute("user", user);
		model.addAttribute("result", result);

		// 分页处理
		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		int len = userService.listAll().size();
		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);

		return "list";
	}

	// 模糊查询
	@RequestMapping(value = "/fuzzyQuery", produces = "text/html;charset=utf-8")
	public String fuzzyQuery(@RequestParam("loginname") String loginname, @RequestParam("username") String username,
			@RequestParam("phone") String phone, Model model, HttpServletRequest request) throws Exception {
		System.out.println("loginname = " + loginname);
		System.out.println("username = " + username);
		System.out.println("phone = " + phone);
		Result result = new Result();
		result.setCode(0);
		result.setMsg("查询成功");

		User user = new User();
		user.setId(0);
		user.setLoginname(loginname);
		user.setUsername(username);
		user.setPhone(phone);
		user.setPassword("");

		int len = userService.getByFuzzyQuery(user).size();
		result.setData(userService.getByFuzzyQuery(user));

		model.addAttribute("user", user);
		model.addAttribute("result", result);

		// 分页处理
		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		return "list";
	}

	// 更新数据
	@RequestMapping(value = "/update", produces = "text/html;charset=utf-8")
	public String update(User user, Model model, HttpServletRequest request) {
		Result result = new Result();
		try {
			int resultCount = userService.update(user);
			if (resultCount > 0) {
				result.setCode(0);
				result.setMsg("更新成功");
			} else {
				result.setCode(-1);
				result.setMsg("更新失败");
			}
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("更新失败");
			e.printStackTrace();
		}
		result.setData(userService.listAll());
		model.addAttribute("user", user);
		model.addAttribute("result", result);

		// 分页处理
		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		int len = userService.listAll().size();
		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);

		return "list";
	}

	// 添加
	@RequestMapping(value = "/add", produces = "text/html;charset=utf-8")
	public String add(User user, Model model, HttpServletRequest request) {
		UserView userView = new UserView();

		System.out.print(user);
		userView.setLoginname(user.getLoginname());
		userView.setUsername(user.getUsername());
		userView.setPhone(user.getPhone());
		userView.setPassword(user.getPassword());
		userView.setRoleCode("00"); // 新注册的员工默认是普通用户
		userView.setCaption("普通用户");

		Result result = new Result();
		try {
			int resultCount = userService.add(userView); // 写入数据库
			if (resultCount > 0) {
				result.setCode(0);
				result.setMsg("添加成功");
			} else {
				result.setCode(-1);
				result.setMsg("添加失败");
			}
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("添加失败");
			e.printStackTrace();
		}

		result.setData(userService.listAll());
		model.addAttribute("user", user);
		model.addAttribute("result", result);

		// 分页处理
		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		int len = userService.listAll().size();
		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		return "list";
	}

	// 翻页
	@RequestMapping(value = "/updatePageCapacity", produces = "text/html;charset=utf-8")
	public String updatePageCapacity(User user, HttpServletRequest request, Model model, @RequestParam String start,
			@RequestParam String state) {
		Result result = new Result();
		result.setCode(0);
		result.setMsg("查询成功");
		result.setData(userService.listAll());

		user = userService.getById(user);

		if (user == null) {
			user = new User();
		} else {
			model.addAttribute("flag", true);
		}
		model.addAttribute("user", user);
		model.addAttribute("result", result);

		System.out.println(state);

		int pageVal = (int) request.getSession().getAttribute("pageVal");
		if (state.equals("next")) {
			pageVal += 1;
		} else if (state.equals("before")) {
			pageVal -= 1;
		}
		request.getSession().setAttribute("pageVal", pageVal);
		model.addAttribute("pageVal", pageVal);

		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		int len = userService.listAll().size();
		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);

		model.addAttribute("pageList", pageList);
		return "list";
	}

	@RequestMapping(value = "/systemTable", produces = "text/html;charset=utf-8")
	public String getsyStemTable(@RequestParam(defaultValue = "5") String pageSize, SystemTable systemTable,
			@RequestParam(defaultValue = "面积分类") String tableName, HttpServletRequest request, Model model)
			throws Exception {
		Result result = new Result();
		result.setCode(0);
		result.setMsg("查询成功");

		TableInfo tableInfo = new TableInfo();
		tableInfo.setTableName(tableName);
		

		// systemTable = userService.getById(systemTable);

		if (systemTable == null) {
			systemTable = new SystemTable();
		} else {
			model.addAttribute("flag", true);
		}

		int len = getLen(tableName, userService, result);
		model.addAttribute("systemTable", systemTable);
		model.addAttribute("result", result);

		PageInfo pageInfo = new PageInfo();
		pageInfo.setCapacity(pageSize);

		request.getSession().setAttribute("pageInfo", pageInfo);
		request.getSession().setAttribute("tableInfo", tableInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		model.addAttribute("tableList", tableList);
		model.addAttribute("tableInfo", tableInfo);
		return "systemTable";
	}
	
	// 将sql 的查询结果添加到data中 并返回行数
	public static int getLen(String tableName, UserService userService, Result result) {
		int len = 0;
		if (tableName.equals("面积分类")) {
			tableName = "t_areaclass";			
		} else if (tableName.equals("装修分类")) {
			tableName = "t_decorateclass";			
		}else if (tableName.equals("物业分类")) {
			tableName = "t_propertyclass";			
		}else if (tableName.equals("套件分类")) {
			tableName = "t_suiteclass";			
		}else if (tableName.equals("朝向分类")) {
			tableName = "t_decorateclass";			
		}else if (tableName.equals("展示位置")) {
			tableName = "t_displaylocation";			
		}else if (tableName.equals("产权分类")) {
			tableName = "t_ownership";			
		}else if (tableName.equals("所属楼盘")) {
			tableName = "t_building";			
		}else if (tableName.equals("角色分类")) {
			tableName = "t_decorateclass";
		}else if (tableName.equals("房屋状态")) {
			tableName = "t_housingcondition";
		}
		result.setData(userService.getInfo(tableName));
		len = userService.getInfo(tableName).size();
		return len;
	}

	// 翻页
	@RequestMapping(value = "/updatePageCapacity2", produces = "text/html;charset=utf-8")
	public String updatePageCapacity2(User user, HttpServletRequest request, Model model) {
		SystemTable systemTable = new SystemTable();
		Result result = new Result();
		result.setCode(0);
		result.setMsg("查询成功");
		// result.setData(userService.listAll());

		// user = userService.getById(user);
		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		TableInfo tableInfo = (TableInfo) request.getSession().getAttribute("tableInfo");

		String tableName = tableInfo.getTableName();
		int len = getLen(tableName, userService, result);
		model.addAttribute("user", user);
		model.addAttribute("result", result);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		model.addAttribute("tableList", tableList);
		model.addAttribute("tableInfo", tableInfo);
		model.addAttribute("systemTable", systemTable);


		return "systemTable";
	}

	// 翻页
	@RequestMapping(value = "/updatePageCapacity3", produces = "text/html;charset=utf-8")
	public String updatePageCapacity3(HttpServletRequest request, Model model) {
		Result result = new Result();
		result.setCode(0);
		result.setMsg("查询成功");
		String loginname = request.getParameter("loginname");
		String caption = request.getParameter("caption");

		UserView userView = new UserView();
		if (caption == null) {
			caption = "";
		}
		if (loginname == null) {
			loginname = "";
		}
		if (caption.equals("所有")) {
			userView.setCaption(caption);
		} else {
			userView.setCaption("");
		}
		userView.setLoginname(loginname);
		result.setData(userService.fuzzyQueryUV(userView));
		int len = userService.fuzzyQueryUV(userView).size();
		// user = userService.getById(user);

		model.addAttribute("userView", userView);
		model.addAttribute("result", result);

		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		return "captionList";
	}

	@RequestMapping(value = "/captionList", produces = "text/html;charset=utf-8")
	public String captionList(@RequestParam(defaultValue = "5") String pageSize, HttpServletRequest request,
			Model model) {
		Result result = new Result();
		result.setCode(0);
		result.setMsg("查询成功");
		String loginname = request.getParameter("loginname");
		String caption = request.getParameter("caption");

		UserView userView = new UserView();
		if (caption == null) {
			caption = "";
		}
		if (loginname == null) {
			loginname = "";
		}
		if (caption.equals("所有")) {
			userView.setCaption(caption);
		} else {
			userView.setCaption("");
		}
		userView.setLoginname(loginname);
		result.setData(userService.fuzzyQueryUV(userView));
		int len = userService.fuzzyQueryUV(userView).size();
		// user = userService.getById(user);

		model.addAttribute("userView", userView);
		model.addAttribute("result", result);

		PageInfo pageInfo = new PageInfo();
		pageInfo.setCapacity(pageSize);

		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		return "captionList";
	}

	
	
	@RequestMapping(value = "/informationControl", produces = "text/html;charset=utf-8")
	
	public String informationControl(@RequestParam(defaultValue = "5") String pageSize, SystemTable systemTable,
			@RequestParam(defaultValue = "面积分类") String tableName, HttpServletRequest request, Model model)
			throws Exception {
		Result result = new Result();
		result.setCode(0);
		result.setMsg("查询成功");

		TableInfo tableInfo = new TableInfo();
		tableInfo.setTableName(tableName);
		

		// systemTable = userService.getById(systemTable);

		if (systemTable == null) {
			systemTable = new SystemTable();
		} else {
			model.addAttribute("flag", true);
		}

		int len = getLen(tableName, userService, result);
		model.addAttribute("systemTable", systemTable);
		model.addAttribute("result", result);

		PageInfo pageInfo = new PageInfo();
		pageInfo.setCapacity(pageSize);

		request.getSession().setAttribute("pageInfo", pageInfo);
		request.getSession().setAttribute("tableInfo", tableInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		model.addAttribute("tableList", tableList);
		model.addAttribute("tableInfo", tableInfo);
	
		return "informationControl";
	}
	
	
	
	
	@RequestMapping(value = "/updateUserInfo", produces = "text/html;charset=utf-8")
	public String updateUserInfo(@RequestParam("loginname") String loginname, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("comfirmPassword") String comfirmPassword,
			@RequestParam("phone") String phone, Model model) {

		int id = ((User) userService.findByLoginname(loginname)).getId();
		User user = new User();
		Result result = new Result();

		boolean b = true; // 修改标志
		if (loginname.equals("")) {
			model.addAttribute("emptyLoginname", "❌ 用户登录名不能为空");
			b = false;
		}
		if (username.equals("")) {
			model.addAttribute("emptyUsername", "❌用户昵称不能为空");
			b = false;
		}
		if (!(comfirmPassword.equals(password) && !password.equals(""))) {
			model.addAttribute("passwordError", "❌两次密码必须一致");
			b = false;
		}

		if (phone.equals("")) {
			model.addAttribute("emptyPhone", "❌电话不得为空");
			b = false;
		}
		user.setId(id);
		user.setLoginname(loginname);
		user.setUsername(username);
		user.setPhone(phone);

		if (b) {
			user.setPassword(password);
			System.out.println("password = " + password);
			int val = userService.updateUserInfo(user); // 写入数据库
			System.out.println("val = " + val);
			if (val > 0) {
				result.setCode(0);
				result.setMsg("修改成功");
				model.addAttribute("userView", user);
				model.addAttribute("result", result);
				return "userInfo";
			} else {
				model.addAttribute("userView", user);
				result.setCode(-1);
				result.setMsg("修改失败");
				model.addAttribute("result", result);
				return "userInfo";
			}
		}
		return "userInfo";
	}

	@RequestMapping(value = "/updateSystemtable", produces = "text/html;charset=utf-8")
	public String updateSystemtable(@RequestParam("code") String code, @RequestParam("caption") String caption,
			HttpServletRequest request, Model model) {
		TableInfo tableInfo = (TableInfo) request.getSession().getAttribute("tableInfo");
		Result result = new Result();
		String tableName = getTableName(tableInfo.getTableName());
		SystemTable systemTable = new SystemTable();
		boolean b = true; // 修改标志
		if (code.equals("")) {
			model.addAttribute("codeEmpty", "❌ code不能为空");
			b = false;
		}
		if (caption.equals("")) {
			model.addAttribute("captionEmpty", "❌标题不能为空");
			b = false;
		}
		
		if (b) {
			// 需要修改的systemTable 信息

			systemTable.setCode(code);
			systemTable.setCaption(caption);
			systemTable.setTableName(tableName);	
			try {
				int resultCount = userService.updateSystemTable(systemTable);
				if (resultCount > 0) {
					result.setCode(0);
					result.setMsg("修改成功");
				} else {
					result.setCode(-1);
					result.setMsg("修改失败");
				}
			} catch (Exception e) {
				result.setCode(-1);
				result.setMsg("修改失败");
				e.printStackTrace();
			}
		}
		result.setData(userService.getInfo(tableName));
		

		// 分页处理
		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		int len = getLen(tableName, userService, result);
		model.addAttribute("result", result);

		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		model.addAttribute("tableInfo", tableInfo);
		model.addAttribute("tableList", tableList);
		model.addAttribute("systemTable", systemTable);

		return "systemTable";
	}

	public static String getTableName(String tableName) {
		if (tableName.equals("面积分类")) {
			tableName = "t_areaclass";			
		} else if (tableName.equals("装修分类")) {
			tableName = "t_decorateclass";			
		}else if (tableName.equals("物业分类")) {
			tableName = "t_propertyclass";			
		}else if (tableName.equals("套件分类")) {
			tableName = "t_suiteclass";			
		}else if (tableName.equals("朝向分类")) {
			tableName = "t_decorateclass";			
		}else if (tableName.equals("展示位置")) {
			tableName = "t_displaylocation";			
		}else if (tableName.equals("产权分类")) {
			tableName = "t_ownership";			
		}else if (tableName.equals("所属楼盘")) {
			tableName = "t_building";			
		}else if (tableName.equals("角色分类")) {
			tableName = "t_roleclass";
		}else if (tableName.equals("房屋状态")) {
			tableName = "t_housingcondition";
		}
		return tableName;
	}
	
	@RequestMapping(value = "/addSystemTable", produces = "text/html;charset=utf-8")
	public String addSystemTable(@RequestParam("code") String code, @RequestParam("caption") String caption,
			HttpServletRequest request, Model model) {
		TableInfo tableInfo = (TableInfo) request.getSession().getAttribute("tableInfo");
		SystemTable systemTable = new SystemTable();
		Result result = new Result();
		String tableName = getTableName(tableInfo.getTableName());


		System.out.println("code = " + code);
		System.out.println("caption = " + caption);
		
		boolean b = true; // 修改标志
		if (code.equals("")) {
			model.addAttribute("codeEmpty", "❌ code不能为空");
			b = false;
		}
		if (caption.equals("")) {
			model.addAttribute("captionEmpty", "❌标题不能为空");
			b = false;
		}
		
		if (b) {
			// 需要修改的systemTable 信息
			systemTable.setId(0);
			systemTable.setCode(code);
			systemTable.setCaption(caption);
			systemTable.setTableName(tableName);
			
			SystemTable temp = (SystemTable) userService.getByCode(systemTable);
			System.out.println("temp = " + temp);
			if (temp != null) {
				result.setCode(-1);
				result.setMsg("添加失败");
				model.addAttribute("codesame", "❌ code值唯一");
			} else {
				System.out.println("add = ");
				
				userService.addSystemTable(systemTable);
				result.setCode(0);
				result.setMsg("添加成功");
			}
		}
		System.out.println("tableName + " + tableName);

		int len = getLen(tableInfo.getTableName(), userService, result);

		// 分页处理
		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		model.addAttribute("tableInfo", tableInfo);
		model.addAttribute("tableList", tableList);
		model.addAttribute("systemTable", systemTable);
		model.addAttribute("result", result);

		
		return "systemTable";
	}

	
	@RequestMapping(value = "/deleteSystemTable", produces = "text/html;charset=utf-8")
	public String deleteSystemTable(SystemTable systemtable, HttpServletRequest request, Model model) {
		TableInfo tableInfo = (TableInfo) request.getSession().getAttribute("tableInfo");
		
		String tableName = getTableName(tableInfo.getTableName());
		systemtable.setTableName(tableName);
		
		System.out.println("systemtable = " + systemtable.getId());
		Result result = new Result();
		System.out.println("delete删除");
		try {
			int resultCount = userService.deleteSystemTable(systemtable);
			if (resultCount > 0) {
				result.setCode(0);
				result.setMsg("删除成功");
			} else {
				result.setCode(-1);
				result.setMsg("删除失败");
			}
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("删除失败");
			e.printStackTrace();
		}
		result.setData(userService.getInfo(tableName));
		model.addAttribute("result", result);

		// 分页处理
		PageInfo pageInfo = (PageInfo) request.getSession().getAttribute("pageInfo");
		int len = getLen(tableName, userService, result);
		request.getSession().setAttribute("pageInfo", pageInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getCapacity());
		model.addAttribute("len", len);
		model.addAttribute("pageList", pageList);
		model.addAttribute("tableInfo", tableInfo);
		model.addAttribute("tableList", tableList);
		
		return "redirect:systemTable";
	}
	@RequestMapping(value = "/test", produces = "text/html;charset=utf-8")
	public String test(HttpServletRequest request, Model model) {
		request.getSession().invalidate();
		return "redirect:index";
	}

}
