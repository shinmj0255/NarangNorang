package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class TravlePlan {

	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String startDate;
	private String endDate;
	private String city;
	private String state;
	

	private String writerName;
	private int goodReactionPoint;
	private int badReactionPoint;
	private int sumReactionPoint;
	private boolean actorCanChangeData;
	
}