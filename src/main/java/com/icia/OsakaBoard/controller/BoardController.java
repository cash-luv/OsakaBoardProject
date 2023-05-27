package com.icia.OsakaBoard.controller;

import com.icia.OsakaBoard.dto.*;
import com.icia.OsakaBoard.service.BoardService;
import com.icia.OsakaBoard.service.CommentService;
import com.icia.OsakaBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private BoardService boardService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/save")
    public String save(HttpSession session) {
        // 세션에 들어있는 로그인된 id 가져오기
        String loginId = (String) session.getAttribute("loginId");
        memberService.findByMemberId(loginId);
        return "BoardPage/boardSave";
    }

    @PostMapping("/save") // /board/board/save
    public String save(HttpSession session, @ModelAttribute BoardDTO boardDTO) throws IOException {
        // 세션에 들어있는 로그인된 id 가져오기
        System.out.println(", id = " + (Long) session.getAttribute("id"));
        Long id = (Long) session.getAttribute("id");
        boardDTO.setMember_id(id);
        System.out.println("boardDTO = " + boardDTO);
        boardService.save(boardDTO);
        return "redirect:/board/list";
    }




    @GetMapping("/list")
    public String list(@RequestParam(value = "boardCategory", required = false, defaultValue = "0") int boardCategory,
                       @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                       @RequestParam(value = "q", required = false, defaultValue = "") String q,
                       Model model) {
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;
        if (boardCategory == 0) {
            if (q.equals("")) {
                boardDTOList = boardService.pagingList(page);
                pageDTO = boardService.pagingParam(page);
            } else {
                boardDTOList = boardService.searchList(page, q);
                pageDTO = boardService.pagingSearchParam(page, q);
            }
        } else {
            if (q.equals("")) {
                boardDTOList = boardService.categoryPagingList(boardCategory, page);
                pageDTO = boardService.categoryPagingParam(boardCategory, page);
            } else {
                boardDTOList = boardService.categorySearchList(boardCategory, page, q);
                pageDTO = boardService.categoryPagingSearchParam(boardCategory, page, q);
            }
        }
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("boardCategory", boardCategory);
        return "BoardPage/boardListNo1";
    }
    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type", required = false , defaultValue = "boardTitle") String type,
                         HttpSession session){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board",boardDTO);
        model.addAttribute("page",page);
        model.addAttribute("q",q);
        model.addAttribute("type",type);
        String writer = boardDTO.getBoardWriter();
        String loginId = (String) session.getAttribute("loginId");
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTO);
            System.out.println("boardFileDTO = " + boardFileDTO);
        }
        List<CommentDTO> commentDTOList = commentService.findAll(id);

        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        if(writer.equals(loginId)) {
            // 작성자와 로그인한 사용자가 같은 경우, 수정/삭제 버튼을 보여줌
            model.addAttribute("editable", true);
        } else {
            // 작성자와 로그인한 사용자가 다른 경우, 수정/삭제 버튼을 보여주지 않음
            model.addAttribute("editable", false);
        }
        return "/BoardPage/boardDetail";
    }
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           @RequestParam(value = "q", required = false, defaultValue = "") String q,
                           @RequestParam(value = "type", required = false , defaultValue = "boardTitle") String type,
                           HttpSession session) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page",page);
        model.addAttribute("q",q);
        model.addAttribute("type",type);
        String writer = boardDTO.getBoardWriter();
        String loginEmail = (String) session.getAttribute("loginEmail");
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTO);
            System.out.println("boardFileDTO = " + boardFileDTO);
        }
        List<CommentDTO> commentDTOList = commentService.findAll(id);

        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        if(writer.equals(loginEmail)) {
            // 작성자와 로그인한 사용자가 같은 경우, 수정/삭제 버튼을 보여줌
            model.addAttribute("editable", true);
        } else {
            // 작성자와 로그인한 사용자가 다른 경우, 수정/삭제 버튼을 보여주지 않음
            model.addAttribute("editable", false);
        }
        return "boardPage/boardDetail";
    }

}
