package com.wwf.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wwf.mapper.UserMapper;
import com.wwf.pojo.MultiQuery;
import com.wwf.pojo.User;
import com.wwf.pojo.UserLogin;

@Controller
public class UserController {
	// 初始化容器
	private ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	// 获得bean
	private UserMapper userMapper = ctx.getBean(UserMapper.class);

	@RequestMapping("/register")
	public String userRegister() {
		return "register";
	}

	@RequestMapping("/registerSubmit")
	public String registerSubmit(@ModelAttribute User user) {
		userMapper.insert(user);
		return "login";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/loginSubmit")
	public String loginSubmit(@ModelAttribute UserLogin userLogin, Model mod, HttpServletRequest request) {
		if (userLogin.getUsername() != null || userLogin.getPassword() != null) {
			List<User> list = userMapper.selectByUserLogin(userLogin);
			if (list.size() != 0) {
				User user = list.get(0);
				HttpSession session = request.getSession();
				session.setAttribute("loginingUser", user);
				return "forward:/multiSearch";
			}
		}
		mod.addAttribute("tip", "用户名或密码错误，请重新输入！");
		mod.addAttribute("username", userLogin.getUsername());
		mod.addAttribute("password", userLogin.getPassword());
		return "relogin";
	}

	// 多条件查询
	@RequestMapping(value = "/multiSearch")
	public String multiSearchController(@ModelAttribute("mqw") MultiQuery mqw, Model mod, HttpServletRequest request,
			HttpServletResponse response) {
		// 访问数据库
		List<User> showList = userMapper.selectByMultiQuery(mqw);
		mod.addAttribute("users", showList);
		HttpSession session = request.getSession();
		User loginer = (User)session.getAttribute("loginingUser");
		if(loginer == null) return "login";
		Cookie cookie=new Cookie("JSESSIONID",session.getId());
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(60*100*10);
		response.addCookie(cookie);
		
		mod.addAttribute("loginer", loginer);
		return "userView";
	}
	
	@RequestMapping("/editUserSubmit")
	public String editUserSubmit(User newUser) {
		userMapper.updateByPrimaryKey(newUser);
		return "userView";
//		return "forward:/multiSearch";
	}
	
	// 修改用户跳转并显示将要修改的用户
	@RequestMapping(value = "/editUser")
	public String EditUserIdController(Model mod, Integer id) {
		User user = userMapper.selectByPrimaryKey(id);
		mod.addAttribute("item1", user);
		return "edituserID";
	}
	
	@RequestMapping("/deleteUser")
	public String deleterUser(@RequestParam Integer id) {
		userMapper.deleteByPrimaryKey(id);
		return "userView";
	}
	
}
