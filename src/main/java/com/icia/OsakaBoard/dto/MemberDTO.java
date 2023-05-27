package com.icia.OsakaBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

@Data

public class MemberDTO {
    private Long member_id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String birthYY;
    private String birthMM;
    private String birthDD;
    private String memberBirth;
    private String memberGender;
    private String memberAddress;
    private String memberAddress1;
    private String memberAddress2;
    private String memberAddress3;
    private String memberEmail;
    private String memberDomain;
    private int fileAttached;
    private List<MultipartFile> Profile;
}
