package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountBook {
	private int id;
	private String regDate;
	private String updateDate;
	private String category;
	private int price;
	private String title;
	private String body;
	
	public String getForPrintBody() {
		return this.body.replaceAll("\n", "<br />");
	}
}
