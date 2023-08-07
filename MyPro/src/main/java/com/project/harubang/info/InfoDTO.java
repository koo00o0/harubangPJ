package com.project.harubang.info;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
public class InfoDTO {
	
	
	private String itemId;
	private String itemName;
	private String addressId;
	private String checkId;
	private int likeCnt;
	private String imgfile;
	private String detail;
	private String sort;
}
