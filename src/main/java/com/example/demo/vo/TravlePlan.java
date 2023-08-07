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
	private int term;
	private String title;
	private String body;
	private int boardId;
	private int theme;
	private int hit;
	private int VCnt;

	private String writerName;
	private int goodReactionPoint;
	private int badReactionPoint;
	private int sumReactionPoint;
	private boolean actorCanChangeData;
	
}