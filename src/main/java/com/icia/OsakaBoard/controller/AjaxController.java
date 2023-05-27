package com.icia.OsakaBoard.controller;


import com.icia.OsakaBoard.dto.MemberDTO;
import com.icia.OsakaBoard.service.MailSendService;
import com.icia.OsakaBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private MailSendService mailSendService;
    @PostMapping("/id-check")
    public ResponseEntity IdCheck(@RequestParam("memberId") String memberId) {
        System.out.println("memberId = " + memberId);
        MemberDTO memberDTO = memberService.findByMemberId(memberId);
        System.out.println("memberdto="+ memberDTO);
        if(memberDTO == null){
            return new ResponseEntity<>(HttpStatus.OK);
        }else{
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(String email) {
        System.out.println("이메일 인증 요청이 들어옴!");
        System.out.println("이메일 인증 이메일 : " + email);
        return mailSendService.joinEmail(email);
    }
}
