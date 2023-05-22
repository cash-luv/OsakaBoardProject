package com.icia.OsakaBoard.service;

import com.icia.OsakaBoard.dto.MemberDTO;
import com.icia.OsakaBoard.dto.MemberFileDTO;
import com.icia.OsakaBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public MemberDTO findByMemberId(String memberId) {

        return memberRepository.findByMemberId(memberId);
    }

        public void MemberSave(MemberDTO memberDTO) throws IOException {
            if (memberDTO.getProfile().get(0).isEmpty()) {
                System.out.println("파일없음");
                System.out.println("memberDTO = " + memberDTO);
                memberDTO.setFileAttached(0);
                memberRepository.MemberSave(memberDTO);

            } else {
                memberDTO.setFileAttached(1);
                MemberDTO dto = memberRepository.MemberSave(memberDTO);
                for (MultipartFile Profile : memberDTO.getProfile()) {
                    String fileName = Profile.getOriginalFilename();
                    String filePath = System.currentTimeMillis() + "-" + fileName;
                    MemberFileDTO memberFileDTO = new MemberFileDTO();
                    memberFileDTO.setOriginalFileName(fileName);
                    memberFileDTO.setStoredFileName(filePath);
                    memberFileDTO.setMember_Id(dto.getMember_id());

                    String savePath = "C:\\Users\\tenah\\IdeaProjects\\springframework_img" + filePath;

                    Profile.transferTo(new File(savePath));
                    memberRepository.saveFile(memberFileDTO);

                }
            }
        }
    }

