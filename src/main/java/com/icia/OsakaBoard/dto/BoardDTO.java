package com.icia.OsakaBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Data

public class BoardDTO {
    private Long id;
    private String boardTitle;
    private String boardWriter;
    private String boardContents;
    private int boardHits = 0;
    private Timestamp boardCreatedTime;
    private int fileAttached = 0;
    private Long member_id;
    private Long boardCategory;
    private List<MultipartFile> boardFile;


}
