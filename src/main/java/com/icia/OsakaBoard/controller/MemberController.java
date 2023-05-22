package com.icia.OsakaBoard.controller;

import com.icia.OsakaBoard.dto.MemberDTO;
import com.icia.OsakaBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/save")
    public String memberSave(){
        return "MemberPage/memberSave";
    }
    @GetMapping("/login")
    public String memberLogin(){
        return "MemberPage/memberLogin";
    }

    @PostMapping("/save")
    public String saveform(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberDTO.setMemberBirth(memberDTO.getBirthYY()+"-"+memberDTO.getBirthMM()+"-"+memberDTO.getBirthDD());
        memberDTO.setMemberAddress(memberDTO.getMemberAddress1()+memberDTO.getMemberAddress2()+memberDTO.getMemberAddress3());
        memberService.MemberSave(memberDTO);
        return "MemberPage/memberLogin";
    }
}
