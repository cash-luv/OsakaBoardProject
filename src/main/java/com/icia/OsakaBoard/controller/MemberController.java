package com.icia.OsakaBoard.controller;

import com.icia.OsakaBoard.dto.MemberDTO;
import com.icia.OsakaBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/save")
    public String memberSave(){
        return "MemberPage/memberSave";
    }

    @PostMapping("/save")
    public String saveform(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberDTO.setMemberBirth(memberDTO.getBirthYY()+"-"+memberDTO.getBirthMM()+"-"+memberDTO.getBirthDD());
        memberDTO.setMemberAddress(memberDTO.getMemberAddress1()+memberDTO.getMemberAddress2()+memberDTO.getMemberAddress3());
        memberDTO.setMemberEmail(memberDTO.getMemberEmail()+"@"+memberDTO.getMemberDomain());
        memberService.MemberSave(memberDTO);
        return "MemberPage/memberLogin";
    }

    @GetMapping("/login")
    public String memberLogin(){
        return "MemberPage/memberLogin";
    }

    @PostMapping("/login") // url
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
//        boolean loginResult = memberService.login(memberDTO);
        MemberDTO dto = memberService.login(memberDTO);
        if (dto.getMemberId().equals("admin")) {
            session.setAttribute("loginId", dto.getMemberId());
            session.setAttribute("id", dto.getMember_id());
            return "/MemberPage/memberAdmin";
        } else if (dto != null) {
//            model.addAttribute("loginEmail", memberDTO.getMemberEmail());
            session.setAttribute("loginId", dto.getMemberId());
            session.setAttribute("id", dto.getMember_id());
            return "/BoardPage/boardListNo1";
        } else {
            return "/MemberPage/memberLogin";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 세션에 담긴 값 전체 삭제
        session.invalidate();
        // 특정 파라미터만 삭제
//        session.removeAttribute("loginEmail");
        return "redirect:/";
    }

    @GetMapping("/mypage")
    public String mypage(){
        return "/MemberPage/memberMypage";
    }

    @GetMapping("/members")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "/MemberPage/memberList";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model){
        String loginId = (String) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.findByMemberId(loginId);
        model.addAttribute("member", memberDTO);
        return "/MemberPage/memberUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        memberDTO.setMemberAddress(memberDTO.getMemberAddress1()+memberDTO.getMemberAddress2()+memberDTO.getMemberAddress3());
        memberDTO.setMemberEmail(memberDTO.getMemberEmail()+"@"+memberDTO.getMemberDomain());
        memberService.update(memberDTO);
        System.out.println("memberDTO = " + memberDTO );
        return "MemberPage/memberMain";
    }

    @GetMapping("/delete")
    public String deleteForm(HttpSession session, Model model) {
        // 세션에 들어있는 로그인된 id 가져오기
        String loginId = (String) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.findByMemberId(loginId);
        model.addAttribute("member", memberDTO);
        return "MemberPage/memberDelete";
    }

    @PostMapping("/delete")
    public String delete(HttpSession session) {
        // 세션에 들어있는 로그인된 id 가져오기
        String loginId = (String) session.getAttribute("loginId");
        memberService.delete(loginId);
        return "redirect:/member/logout";
    }


}
