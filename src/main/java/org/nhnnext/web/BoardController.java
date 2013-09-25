package org.nhnnext.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@RequestMapping(value="/board/view.opo")
	public String board() {
		return "view";
	}

	@RequestMapping(value="/board/upload.opo")
	public String uploadForm() {
		return "upload";
	}

	@RequestMapping(value="/board/upload_complete.opo", method=RequestMethod.POST)
	public String uploadComplete(String photo, String photoname, String photocomment) {
		System.out.println( "Photo : " + photo +
							"Photoname : " + photoname +
							"Photocomment : " + photocomment);
		return "uploadC";
	}

}
