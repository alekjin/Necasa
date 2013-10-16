package org.Necasa.Web;

import javax.persistence.*;

@Entity
public class Account {
	public Account() {
	}

@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(length=12, nullable = false)
	private String userid;
	@Column(length=40, nullable = false)
	private String passwd;

	public String getUserid() {
		return userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	@Override
	public String toString() {
		return "Account{" +
				"id=" + id +
				", userid='" + userid + '\'' +
				", passwd='" + passwd + '\'' +
				'}';
	}
}
