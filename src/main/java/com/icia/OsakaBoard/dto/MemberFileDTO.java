package com.icia.OsakaBoard.dto;

import lombok.Data;

@Data
public class MemberFileDTO {
    private Long id;
    private String originalFileName;
    private String storedFileName;
    private Long member_Id;

}
