package org.Necasa.Web;

import org.Necasa.Background.AccountRepository;
import org.Necasa.Web.Account;
import org.Necasa.Web.Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Iterator;

@Controller
public class LoginController {
	@Autowired
	private AccountRepository accountRepository;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Account account, HttpSession httpSession) {
		Account targetAccount = accountRepository.findByuserid(account.getUserid());
				if (targetAccount.getUserid().equals(account.getUserid()) && targetAccount.getPasswd().equals(Encryption.SHA1encryption(account.getPasswd()))) {
					System.out.println("CHECK pass");
				httpSession.setAttribute("userId", targetAccount.getUserid());
			}
		return "redirect:/";

	}

	@RequestMapping(value = "logout.opo")
	public String logout() {
		return "logout.jsp";
	}
}
