package com.project.harubang.user;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserVO {

	private String id;
	private String RECIVE_id;
	private String send_id;
	private String pw;
	private String email;
	private String name;
	private String phone;
	private String birthday;
	private String gender;
	private String success;
	private String refuse;
	
}
