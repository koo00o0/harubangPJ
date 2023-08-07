package com.project.harubang.userFriend;

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
public class UserFriendVO {

	private String id;
	private String RECIVE_id;
	private String send_id;
	private String success;
	private String refuse;
	
}
