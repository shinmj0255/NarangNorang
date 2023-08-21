package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TravleArea {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String category;
	private String title;
	private String summary;
	private String body;
	private String address;
	private double latitude;
	private double longitude;
	private int hit;
	
	public String getForPrintBody() {
		return this.body.replaceAll("\n", "<br />");
	}
}
