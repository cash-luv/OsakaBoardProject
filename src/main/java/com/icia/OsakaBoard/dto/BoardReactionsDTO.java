package com.icia.OsakaBoard.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardReactionsDTO {
    private Long reactionId;
    private Long boardId;
    private Long memberId;
    private Timestamp reactionType;
    private String createdTime;


}
