package org.nhnnext.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping(value="/board/view")
	public String board() {
		return "view";
	}

	@RequestMapping(value="/board/upload")
	public String uploadForm() {
		return "upload";
	}

	@RequestMapping(value="/board/upload_complete", method=RequestMethod.POST)
	public String uploadComplete() {
		return "uploadC";
	}

}
