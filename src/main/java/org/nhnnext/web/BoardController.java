package org.nhnnext.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@RequestMapping(value="/view.opo")
	public String board() {
		return "view";
	}

	@RequestMapping(value="/upload.opo")
	public String uploadForm() {
		return "upload";
	}

	@RequestMapping(value="/upload_complete.opo", method=RequestMethod.POST)
	public String uploadComplete(String photo, String photoname, String photocomment) {
		System.out.println( "Photo : " + photo +
							"Photoname : " + photoname +
							"Photocomment : " + photocomment);
		return "uploadC";
	}

}
