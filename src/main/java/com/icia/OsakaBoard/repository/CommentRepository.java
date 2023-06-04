package com.icia.OsakaBoard.repository;

import com.icia.OsakaBoard.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public List<CommentDTO> findAll(Long boardId) {
        return sql.selectList("Comment.findAll", boardId);
    }

    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save",commentDTO);
    }

    public void update(CommentDTO commentDTO) {
        sql.update("Comment.update",commentDTO);
    }

    public void delete(Long commentId) {
        sql.delete("Comment.delete",commentId);
    }

    public CommentDTO findById(Long id) {
        return sql.selectOne("Comment.findById",id);
    }
}
