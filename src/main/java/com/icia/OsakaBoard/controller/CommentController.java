package com.icia.OsakaBoard.controller;

import com.icia.OsakaBoard.dto.BoardDTO;
import com.icia.OsakaBoard.dto.CommentDTO;
import com.icia.OsakaBoard.service.BoardService;
import com.icia.OsakaBoard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @Autowired
    private BoardService boardService;

    @PostMapping("/save")
    public ResponseEntity save(@ModelAttribute CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }

    @PostMapping("/update")
    public ResponseEntity update(@ModelAttribute CommentDTO commentDTO, HttpSession session ,Model model) {
        // Check if the logged-in user is the owner of the comment
        String loginId = (String) session.getAttribute("loginId");
        String writer = commentDTO.getCommentWriter();

        if (writer.equals(loginId)) {
            // 작성자와 로그인한 사용자가 같은 경우, 수정/삭제 버튼을 보여줌
            model.addAttribute("editable", true);
            commentService.update(commentDTO);
        } else {
            // 작성자와 로그인한 사용자가 다른 경우, 수정/삭제 버튼을 보여주지 않음
            model.addAttribute("editable", false);
        }

        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }

    @PostMapping("/delete")
    public ResponseEntity delete(@RequestParam("commentId") Long commentId, @RequestParam("boardId") Long boardId, HttpSession session, Model model) {
        // Check if the logged-in user is the owner of the comment
        String loginId = (String) session.getAttribute("loginId");
        CommentDTO commentDTO = commentService.findById(commentId);
        String writer = commentDTO.getCommentWriter();

        if (writer.equals(loginId)) {
            // 작성자와 로그인한 사용자가 같은 경우, 수정/삭제 버튼을 보여줌
            model.addAttribute("editable", true);
            commentService.delete(commentId);
        } else {
            // 작성자와 로그인한 사용자가 다른 경우, 수정/삭제 버튼을 보여주지 않음
            model.addAttribute("editable", false);
        }

        List<CommentDTO> commentDTOList = commentService.findAll(boardId);
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }
}
