package org.Necasa.Web;

import org.Necasa.Background.CommentRepository;
import org.Necasa.Background.PhotoRepository;
import org.Necasa.Support.FileUploader;
import org.Necasa.Web.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {
	@Autowired
	private PhotoRepository photoRepository;
	private CommentRepository commentRepository;

	@RequestMapping(value="board/upload.opo")
	public String uploadForm() {
		return "upload.jsp";
	}

	@RequestMapping(value="board/view/main.opo")
	public String list(Model model) {
		model.addAttribute("photos", photoRepository.findAll());
		return "list.jsp";
	}

	@RequestMapping(value="board/view/{id}.opo")
	public String show(@PathVariable Long id, Model model) {
		Photo savedBoard = photoRepository.findOne(id);
		model.addAttribute("photo", savedBoard);
		return "view.jsp";
	}

	@RequestMapping(value="board/uploading.opo", method=RequestMethod.POST)
	public String create(Photo photo, MultipartFile file) {
		String filename = FileUploader.upload(photoRepository.count() + 1, file);
		photo.setFilename(filename);
		Photo savedPhoto = photoRepository.save(photo);
		System.out.println(savedPhoto.toString());
		return "redirect:/board/view/" + savedPhoto.getId() + ".opo";
	}

}
