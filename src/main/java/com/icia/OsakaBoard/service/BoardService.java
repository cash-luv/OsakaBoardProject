package com.icia.OsakaBoard.service;

import com.icia.OsakaBoard.dto.BoardDTO;
import com.icia.OsakaBoard.dto.BoardFileDTO;
import com.icia.OsakaBoard.dto.LikeDTO;
import com.icia.OsakaBoard.dto.PageDTO;
import com.icia.OsakaBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public List<BoardDTO> pagingList(int page) {
//        int pageLimit = 10;
//        int pagingStart = (page-1) * pageLimit;
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setPageLimit(10);   // pageStart(게시글 시작번호)까지 계산됨
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pageDTO.getPageStart());  // 게시글 시작번호
        pagingParams.put("limit", pageDTO.getPageLimit());
        List<BoardDTO> boardDTOList = boardRepository.pagingList(pagingParams);
        return boardDTOList;
    }

    public PageDTO pagingParam(int page) {
//        int pageLimit = 10;  // 한 페이지에 보여줄 글 갯수
//        int blockLimit = 5; //하단에 보여줄 페이지 번호 갯수
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setPageLimit(10);   // pageStart 까지 계산됨
        pageDTO.setBlockLimit(5);   // startPage(시작 페이지 값) 까지 계산됨
        // 전체 글 갯수 조회
        pageDTO.setBoardCount(boardRepository.boardCount());    //maxPage(전체 페이지 갯수)와 endPage(마지막 페이지 값) 까지 계산됨
        // 전체 페이지 갯수가 계산한 endPage 보다 작을 때 endPage 값을 maxPage 값과 같게 셋팅
        if (pageDTO.getEndPage() > pageDTO.getMaxPage()) {
            pageDTO.setEndPage(pageDTO.getMaxPage());
        }
        return pageDTO;
    }

    // 검색어 입력된 페이징 관련 리스트
    public List<BoardDTO> searchList(int page, String q) {
//        int pageLimit = 10;  // 한 페이지에 보여줄 글 갯수
//        int pagingStart = (page-1) * pageLimit;
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setPageLimit(10);   // pageStart(게시글 시작번호)까지 계산됨
        Map<String, Object> pagingParam = new HashMap<>();
        pagingParam.put("start", pageDTO.getPageStart());
        pagingParam.put("limit", pageDTO.getPageLimit());
        pagingParam.put("q", q);
        List<BoardDTO> boardDTOList = boardRepository.searchList(pagingParam);
        return boardDTOList;
    }

    public PageDTO pagingSearchParam(int page, String q) {
//        int pageLimit = 10;  // 한 페이지에 보여줄 글 갯수
//        int blockLimit = 5; // 하단에 보여줄 페이지 번호 갯수
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setPageLimit(10);   // pageStart 까지 계산됨
        pageDTO.setBlockLimit(5);   // startPage(시작 페이지 값) 까지 계산됨
        // 검색어에 해당하는 전체 글 갯수 조회
        pageDTO.setBoardCount(boardRepository.boardSearchCount(q));    //maxPage(전체 페이지 갯수)와 endPage(마지막 페이지 값) 까지 계산됨
        // 전체 페이지 갯수가 계산한 endPage 보다 작을 때 endPage 값이 maxPage 값과 같게 셋팅
        if (pageDTO.getEndPage() > pageDTO.getMaxPage()) {
            pageDTO.setEndPage(pageDTO.getMaxPage());
        }
        return pageDTO;
    }

    // 카테고리가 있는 게시글 페이징 관련 리스트
    public List<BoardDTO> categoryPagingList(int boardCategory, int page) {
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setPageLimit(10);   // pageStart(게시글 시작번호)까지 계산됨
        Map<String, Object> pagingParam = new HashMap<>();
        pagingParam.put("start", pageDTO.getPageStart());
        pagingParam.put("limit", pageDTO.getPageLimit());
        pagingParam.put("boardCategory", boardCategory);
        System.out.println("pagingParam = " + pagingParam);
        List<BoardDTO> boardDTOList = boardRepository.categoryList(pagingParam);
        return boardDTOList;
    }

    public PageDTO categoryPagingParam(int boardCategory, int page) {
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setPageLimit(10);   // pageStart 까지 계산됨
        pageDTO.setBlockLimit(5);   // startPage(시작 페이지 값) 까지 계산됨
        // 검색어에 해당하는 전체 글 갯수 조회
        pageDTO.setBoardCount(boardRepository.categoryCount(boardCategory));    //maxPage(전체 페이지 갯수)와 endPage(마지막 페이지 값) 까지 계산됨
        // 전체 페이지 갯수가 계산한 endPage 보다 작을 때 endPage 값이 maxPage 값과 같게 셋팅
        if (pageDTO.getEndPage() > pageDTO.getMaxPage()) {
            pageDTO.setEndPage(pageDTO.getMaxPage());
        }
        return pageDTO;
    }

    // 카테고리, 검색어가 있는 게시글 페이징 관련 리스트
    public List<BoardDTO> categorySearchList(int boardCategory, int page, String q) {
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setPageLimit(10);   // pageStart(게시글 시작번호)까지 계산됨
        Map<String, Object> pagingParam = new HashMap<>();
        pagingParam.put("start", pageDTO.getPageStart());
        pagingParam.put("limit", pageDTO.getPageLimit());
        pagingParam.put("boardCategory", boardCategory);
        pagingParam.put("q", q);
        List<BoardDTO> boardDTOList = boardRepository.categorySearchList(pagingParam);
        return boardDTOList;
    }

    public PageDTO categoryPagingSearchParam(int boardCategory, int page, String q) {
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setPageLimit(10);   // pageStart 까지 계산됨
        pageDTO.setBlockLimit(5);   // startPage(시작 페이지 값) 까지 계산됨
        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("q", q);
        pagingParams.put("boardCategory", boardCategory);
        // 검색어에 해당하는 전체 글 갯수 조회
        pageDTO.setBoardCount(boardRepository.categorySearchCount(pagingParams));    //maxPage(전체 페이지 갯수)와 endPage(마지막 페이지 값) 까지 계산됨
        // 전체 페이지 갯수가 계산한 endPage 보다 작을 때 endPage 값이 maxPage 값과 같게 셋팅
        if (pageDTO.getEndPage() > pageDTO.getMaxPage()) {
            pageDTO.setEndPage(pageDTO.getMaxPage());
        }
        return pageDTO;
    }

    public void save(BoardDTO boardDTO) throws IOException {
            if (boardDTO.getBoardFile().get(0).isEmpty()) {
                // 파일 없음.
                System.out.println("파일없음");
                boardDTO.setFileAttached(0);
                boardRepository.save(boardDTO);
            } else {
                // 파일 있음.
            /*
                1. 파일첨부 여부 값 1로 세팅하고 DB에 제목 등 내용 board_table에 저장 처리
                2. 파일의 이름을 가져오고 DTO 필드값에 세팅
                3. 저장용 파일 이름 만들고 DTO 필드값에 세팅
                4. 로컬에 파일 저장
                5. board_file_table에 저장 처리
             */
                System.out.println("파일있음");
                boardDTO.setFileAttached(1);
                BoardDTO dto = boardRepository.save(boardDTO);
                for (MultipartFile boardFile: boardDTO.getBoardFile()) {
                    // 원본 파일 이름 가져오기
                    String originalFilename = boardFile.getOriginalFilename();
                    System.out.println("originalFilename = " + originalFilename);
                    // 저장용 이름 만들기
                    System.out.println(System.currentTimeMillis());
                    System.out.println(UUID.randomUUID().toString());
                    String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                    System.out.println("storedFileName = " + storedFileName);
                    // 저장을 위한 BoardFileDTO 세팅
                    BoardFileDTO boardFileDTO = new BoardFileDTO();
                    boardFileDTO.setOriginalFileName(originalFilename);
                    boardFileDTO.setStoredFileName(storedFileName);
                    boardFileDTO.setBoardId(dto.getId());
                    // 로컬에 파일 저장
                    // 저장할 경로 설정 (저장할폴더+저장할이름)
                    String savePath = "C:\\Users\\tenah\\IdeaProjects\\springframework_img\\" + storedFileName;
                    // 저장처리
                    boardFile.transferTo(new File(savePath));
                    boardRepository.saveFile(boardFileDTO);
                }
            }
        }


    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public List<BoardFileDTO> findFile(Long id) {
        return boardRepository.findFile(id);
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public void likeUp(Long boardId) {
        boardRepository.likeUp( boardId);
    }

    public void likeDown(Long boardId) {
        boardRepository.likeDown(boardId);
    }

    public LikeDTO findLike(LikeDTO likeDTO) {
        return boardRepository.findLike(likeDTO);
    }

    public void like(LikeDTO likeDTO) {
        boardRepository.like(likeDTO);
    }

    public void unLike(LikeDTO likeDTO) {
        boardRepository.unLike(likeDTO);
    }

//    public List<boardDTO> findbestPost(int i) {
//
//    }
}


