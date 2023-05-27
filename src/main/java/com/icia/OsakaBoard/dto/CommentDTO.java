package com.icia.OsakaBoard.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    private Long id;
    private String commentWriter;
    private String commentContents;
    private Long memberId;
    private Long boardId;
    private Timestamp commentCreatedTime;
}
