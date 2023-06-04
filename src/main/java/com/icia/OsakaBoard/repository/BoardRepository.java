package com.icia.OsakaBoard.repository;

import com.icia.OsakaBoard.dto.BoardDTO;
import com.icia.OsakaBoard.dto.BoardFileDTO;
import com.icia.OsakaBoard.dto.LikeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList", pagingParams);
    }

    public int boardCount() { return sql.selectOne("Board.count"); }

    public List<BoardDTO> searchList(Map<String, Object> pagingParam) {
        return sql.selectList("Board.searchList", pagingParam);
    }

    public int boardSearchCount(String q) {
        return sql.selectOne("Board.searchCount", q);
    }

    public List<BoardDTO> categoryList(Map<String, Object> pagingParam) {
        return sql.selectList("Board.categoryList", pagingParam);
    }

    public int categoryCount(int boardCategory) {
        return sql.selectOne("Board.categoryCount", boardCategory);
    }

    public List<BoardDTO> categorySearchList(Map<String, Object> pagingParam) {
        return sql.selectList("Board.categorySearchList", pagingParam);
    }

    public int categorySearchCount(Map<String, Object> pagingParams) {
        return sql.selectOne("Board.categorySearchCount", pagingParams);
    }

    public BoardDTO doubleCheck(BoardDTO boardDTO) {
        return sql.selectOne("Board.doubleCheck", boardDTO);
    }

    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }

    public void saveFile(BoardFileDTO boardFileDTO) {
        sql.insert("Board.saveFile",boardFileDTO);
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById",id);
    }

    public List<BoardFileDTO> findFile(Long boardId) {
        return sql.selectList("Board.findFile", boardId);
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits",id);
    }

    public void update(BoardDTO boardDTO) {
        System.out.println("boardDTO" + boardDTO);
        sql.update("Board.update", boardDTO);
    }

    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    public void likeUp(Long id) {
        sql.update("Board.likeUp",  id);
    }

    public void likeDown(Long id) {
        sql.delete("Board.likeDown",  id);
    }

    public LikeDTO findLike(LikeDTO likeDTO) {
        return sql.selectOne("findLike",likeDTO);
    }

    public void like(LikeDTO likeDTO) {
        sql.insert("Board.like", likeDTO);
    }

    public void unLike(LikeDTO likeDTO) {
        sql.delete("Board.unLike", likeDTO);
    }

}
