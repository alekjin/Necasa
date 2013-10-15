package org.Necasa.Web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

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
	@Column(length = 50, nullable = true)
	private String tags;

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

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	@Override
	public String toString() {
		return "Board{" +
				"title='" + title + '\'' +
				", contents='" + contents + '\'' +
				'}';
	}
}
