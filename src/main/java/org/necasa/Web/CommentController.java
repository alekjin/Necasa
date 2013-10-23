package org.Necasa.Web;

import org.Necasa.Background.CommentRepository;
import org.Necasa.Background.PhotoRepository;
import org.Necasa.Web.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class CommentController {
	@Autowired
	private CommentRepository commentRepository;

	@Autowired
	private PhotoRepository photoRepository;

	@RequestMapping(value = "/board/view/{id}/comment", method = RequestMethod.POST)
	public String CommentWrite(HttpSession httpSession, @PathVariable Long id, String comment) {
		Photo photo = photoRepository.findOne(id);
		Comment savedcomment = new Comment(photo, comment, (String) httpSession.getAttribute("userId"));
		commentRepository.save(savedcomment);

		return "/board/view/" + id + ".opo";
	}





}
