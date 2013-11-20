package org.Necasa.Web;

import org.codehaus.jackson.annotate.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
public class Photo {

	public Photo() {
	}

@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private Long id;

	public Long getId() {
		return id;
	}

	@Column(length = 50, nullable = false)
	private String title;
	@Column(length = 1000, nullable = false)
	private String contents;
	@Column(length = 50, nullable = false)
	private String filename;



	@OneToMany(mappedBy = "photo", fetch = FetchType.EAGER)
	private List<Comment> comments;

	public List<Comment> getComments() {
		return comments;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String file) {
		this.filename = file;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Board{" +
				"title='" + title + '\'' +
				", contents='" + contents + '\'' +
				'}';
	}
}
