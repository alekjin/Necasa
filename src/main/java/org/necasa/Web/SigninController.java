package org.Necasa.Web;

import org.Necasa.Background.AccountRepository;
import org.Necasa.Web.Account;
import org.Necasa.Web.Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SigninController {
	@Autowired
	private AccountRepository accountRepository;

	@RequestMapping(value = "signin.opo")
	public String signinpage() {
		return "signin.jsp";
	}

	@RequestMapping(value = "signing.opo", method = RequestMethod.POST)
	public String signin(Account account, Model model) {
		account.setPasswd(Encryption.SHA1encryption(account.getPasswd()));
		accountRepository.save(account);
		model.addAttribute("account", account);
		return "";
	}
}
