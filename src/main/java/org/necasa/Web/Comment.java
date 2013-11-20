package org.Necasa.Web;

import org.codehaus.jackson.annotate.JsonIgnore;

import javax.persistence.*;

@Entity
public class Comment {


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private Long getId() {
		return id;
	}

	public Comment() {

	}

	@ManyToOne
	private @JsonIgnore Photo photo;

	public Photo getPhoto() {
		return photo;
	}

	public Comment(Photo photo, String comment, String userid) {
		this.photo = photo;
		this.comment = comment;
		this.userid = userid;
	}

	@Column(length = 500, nullable = false)
	private String comment;
	@Column(length = 50, nullable = false)
	private String userid;

	public String getComment() {
		return comment;
	}

	public String getUserid() {
		return userid;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Comment{" +
				"id=" + id +
				", photo=" + photo +
				", comment='" + comment + '\'' +
				'}';
	}
}
