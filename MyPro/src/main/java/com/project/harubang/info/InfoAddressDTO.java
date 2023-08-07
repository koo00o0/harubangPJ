package com.project.harubang.info;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class InfoAddressDTO {
	private String addressId;
	private String addressName;
	private float latitude;
	private float longitude;
}
