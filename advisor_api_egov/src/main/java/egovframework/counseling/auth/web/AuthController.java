package egovframework.counseling.auth.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
	

	@GetMapping("/api/auth/login.do")
	public String moveLogin(@RequestParam(name = "pni_token") String pniToken, Model model){
		
        model.addAttribute("pni_token", pniToken);
        
	    return "main/page_login";
	}
	
	@GetMapping("/api/auth/logout.do")
	public String moveLoOut(HttpServletRequest request) {

	    	return "redirect:/SSOService.do?pname=spLogout";
	        
	}

	
}
