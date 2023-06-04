package com.icia.OsakaBoard.service;

import com.icia.OsakaBoard.dto.CommentDTO;
import com.icia.OsakaBoard.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;
    public List<CommentDTO> findAll(Long boardId) {
        return  commentRepository.findAll(boardId);
    }

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public void update(CommentDTO commentDTO) {
        commentRepository.update(commentDTO);
    }

    public void delete(Long commentId) {
        commentRepository.delete(commentId);
    }

    public CommentDTO findById(Long id) {
       return commentRepository.findById(id);
    }
}
