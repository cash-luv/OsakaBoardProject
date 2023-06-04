package com.icia.OsakaBoard.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data

public class LikeDTO {
    private Long likeId;
    private Long boardId;
    private Long memberId;
}
