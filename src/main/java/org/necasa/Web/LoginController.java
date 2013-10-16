package org.Necasa.Web;

import org.Necasa.Background.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	@Autowired
	private AccountRepository accountRepository;

	@RequestMapping(value = "login.opo", method = RequestMethod.POST)
	public String login(Account account, Model model) {
//		loginRepository.

//		account.getUserid();
		return "";

	}
}
