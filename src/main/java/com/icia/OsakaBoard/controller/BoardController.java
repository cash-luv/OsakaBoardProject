package com.icia.OsakaBoard.controller;

import com.icia.OsakaBoard.dto.*;
import com.icia.OsakaBoard.service.BoardService;
import com.icia.OsakaBoard.service.CommentService;
import com.icia.OsakaBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
                       @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
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
        model.addAttribute("type", type);
        return "BoardPage/boardListNo1";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model,
                         @RequestParam(value = "boardCategory", required = false, defaultValue = "0") int boardCategory,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                         HttpSession session) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("boardCategory", boardCategory);
        model.addAttribute("page", page);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        String writer = boardDTO.getBoardWriter();
        String loginId = (String) session.getAttribute("loginId");
        Long loginId2 = (Long) session.getAttribute("id");
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTO);
        }
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        CommentDTO commentDTO = new CommentDTO();
        model.addAttribute("comment",commentDTO);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        if (writer.equals(loginId)) {
            // 작성자와 로그인한 사용자가 같은 경우, 수정/삭제 버튼을 보여줌
            model.addAttribute("editable", true);
        } else {
            // 작성자와 로그인한 사용자가 다른 경우, 수정/삭제 버튼을 보여주지 않음
            model.addAttribute("editable", false);
        }
        // 좋아요 수 출력
        LikeDTO likeDTO = new LikeDTO();
        likeDTO.setBoardId(id);
        likeDTO.setMemberId(loginId2);
        LikeDTO likeDTO1 = boardService.findLike(likeDTO);
        if (likeDTO1 != null) {
            model.addAttribute("board_like", 1);
        } else {
            model.addAttribute("board_like", 0);
        }
        return "/BoardPage/boardDetail";
    }

    @PostMapping("/likeUp")
    public ResponseEntity likeUp(@RequestParam("boardId") Long boardId,
                                 @RequestParam("memberId") Long memberId) {
        LikeDTO likeDTO = new LikeDTO();
        likeDTO.setBoardId(boardId);
        likeDTO.setMemberId(memberId);
        boardService.like(likeDTO);
        boardService.likeUp(boardId);
//        boardService.likeUp(likeDTO.getMemberId());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/likeDown")
    public ResponseEntity likeDown(@RequestParam("boardId") Long boardId,
                                   @RequestParam("memberId") Long memberId) {
        LikeDTO likeDTO = new LikeDTO();
        likeDTO.setBoardId(boardId);
        likeDTO.setMemberId(memberId);
        boardService.unLike(likeDTO);
        boardService.likeDown(boardId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Long id,
                         @RequestParam(value = "boardCategory", required = false, defaultValue = "0") int boardCategory,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                         @ModelAttribute BoardDTO boardDTO,
                         Model model) {
        boardDTO.setId(id);
        System.out.println("BoardDTO" + boardDTO);
        boardService.update(boardDTO);
//        BoardDTO dto = boardService.findById(boardDTO.getId());
//        model.addAttribute("board", dto);
//        return "BoardPage/boardDetail";
        return "redirect:/board/detail?id=" + id + "&boardCategory=" + boardCategory + "&page=" + page + "&q=" + q + "&type=" + type;
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/BoardPage/list";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model,
                             @RequestParam(value = "boardCategory", required = false, defaultValue = "0") int boardCategory,
                             @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                             @RequestParam(value = "q", required = false, defaultValue = "") String q,
                             @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("boardCategory", boardCategory);
        model.addAttribute("page", page);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        return "BoardPage/boardUpdate";
    }

//    @GetMapping("/bestPost")
//    public String bestPost(Model model) {
//        List<boardDTO> bestPost = boardService.findbestPost(20); // Change the number as per your requirement
//        model.addAttribute("bestPost", bestPost);
//        return "BoardPage/boardListNo2";
//    }


}






