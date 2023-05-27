package com.icia.OsakaBoard.repository;

import com.icia.OsakaBoard.dto.MemberDTO;
import com.icia.OsakaBoard.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO findByMemberId(String memberId) {
        return sql.selectOne("Member.findByMemberId", memberId);
    }

    public MemberDTO MemberSave(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        sql.insert("Member.Save", memberDTO);
        return memberDTO;
    }

    public void saveFile(MemberFileDTO memberFileDTO) {
        sql.insert("Member.saveFile", memberFileDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }

    public void delete(String memberId) {
        sql.delete("Member.delete", memberId);
    }
}

