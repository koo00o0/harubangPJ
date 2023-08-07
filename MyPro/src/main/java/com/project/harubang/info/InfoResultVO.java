package com.project.harubang.info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class InfoResultVO {
	
	private InfoAddressDTO infoAddressDTO;
	private InfoDTO infoDTO;
	private InfoHeartCheck InfoHeartCheck;

}
