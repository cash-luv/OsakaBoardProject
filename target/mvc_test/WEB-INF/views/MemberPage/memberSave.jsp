<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: PM 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>OsakaBoard</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/save.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

    <link rel="stylesheet" href="/resources/css/rpg.css">
</head>
<body class="pt-5">
<%@include file="../component/nav.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="../component/category.jsp" %>
        <div class="col-lg-9 my-4 mb-4">
            <%--                여기서부터 본문내용 입력--%>
                <section class="bg-white">
                    <div class="container py-4">
                        <div class="row align-items-center justify-content-between">
                            <a class="navbar-brand h1 text-center" href="/member/save">
                                <span class="text-dark h2">회원가입</span>
                            </a>
                        </div>
                        <form action="/member/save" method="post" onsubmit="return ValidationName()" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="Profile" class="form-label mt-4"><b>프로필사진</b></label>
                                <input type="file" name="Profile" id="Profile" multiple>
                            </div>
                            <div class="form-group">
                                <label for="memberId" class="form-label mt-4">아이디</label>
                                <input type="text" class="form-control" id="memberId" name="memberId"  aria-describedby="emailHelp" onblur="id_check()">
                                <p id="check-result"></p>
                            </div>

                            <div class="form-group" id="passwordFormGroup">
                                <label class="form-label mt-4" for="memberPassword">비밀번호</label>
                                <input type="text" class="form-control " id="memberPassword" name="memberPassword" onblur="checkPassword()">
                                <p id="valid-feedback"> </p>
                            </div>

                            <div class="form-group" id="passwordCheckFormGroup">
                                <label class="form-label mt-4" for="PasswordCheck">비밀번호 재확인</label>
                                <input type="text" class="form-control " id="PasswordCheck"  onblur="checkPassword()">
                                <p id="invalid-feedback"></p>
                            </div>

                            <div class="form-group">
                                <label for="memberName" class="form-label mt-4">이름</label>
                                <input type="text" class="form-control" id="memberName" name="memberName" aria-describedby="emailHelp">
                            </div>

                            <div class="bir_wrap">
                                <label class="form-label mt-4">생년월일</label>
                                <div class="bir_yy">
                                    <span class="ps_box">
                                        <input type="text" name="birthYY" class="form-control" id="memberBirth" placeholder="년(4자)" maxlength="4">
                                    </span>
                                </div>
                                <div class="bir_mm">
                                    <span class="ps_box focus">
                                        <select class="form-select" id="mm" name="birthMM">
                                            <option value="">월</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </span>
                                </div>
                                <div class="bir_dd">
                                    <span class="ps_box">
                                        <input type="text" class="form-control" id="dd" name="birthDD" placeholder="일" maxlength="2">
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="memberGender" class="form-label mt-4">성별</label>
                                <select class="form-select" id="memberGender" name="memberGender">
                                    <option value="">선택</option>
                                    <option value="남자">남자</option>
                                    <option value="여자">여자</option>
                                    <option value="시크릿">비밀</option>
                                </select>
                            </div>
                            <div class="form-group" >
                                <label for="sample4_postcode" class="form-label mt-4">주소</label>
                                <div class="row mt-2">
                                    <div class="col">
                                        <input type="text" class="form-control" id="sample4_postcode"  name="memberAddress" placeholder="우편번호">
                                    </div>
                                    <div class="col-auto">
                                        <input type="button" class="btn btn-secondary" onclick="searchAddress()" value="우편번호 찾기">
                                    </div>
                                </div>
                                <input type="text" class="form-control mt-2" id="sample4_roadAddress" name="memberAddress1" placeholder="도로명주소">
                                <input type="text" class="form-control mt-2" id="sample4_jibunAddress" name="memberAddress2" placeholder="지번주소">
                                <span id="guide" style="color:#999; display:none"></span>
                                <input type="text" class="form-control mt-2" id="sample4_detailAddress" name="memberAddress3" placeholder="상세주소">
                                <input type="text" class="form-control mt-2" id="sample4_extraAddress" placeholder="참고항목">
                            </div>
                            <div class="form-group">
                                <label for="memberEmail1" class="form-label mt-4">이메일 본인확인</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="memberEmail1" name="memberEmail" aria-describedby="emailHelp" placeholder="Email">
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="emailAddon">@</span>
                                    </div>
                                    <input type="text" class="form-control" id="emailDomain" name="memberDomain" placeholder="직접입력">
                                    <select class="form-select" id="domainOptions" onchange="selectDomain()">
                                        <option value="">직접입력</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="hanmail.com">hanmail.com</option>
                                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                                        <option value="example.com">example.com</option>
                                        <option value="domain.com">domain.com</option>
                                        <option value="test.com">test.com</option>
                                    </select>
                                </div>
                                <div class="mail-check-box">
                                    <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
                                </div>
                                <div class="input-group-append">
                                    <button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
                                </div>
                                <span id="mail-check-warn"></span>
                            </div>

                            <div class="d-grid gap-2">
                                <input class="btn btn-dark btn-lg" type="submit" id="submitBtn" value="가입하기">
                            </div>
                        </form>
                    </div>
                </section>
        </div>
    </div>
</div>
<%@include file="../component/footer.jsp" %>


</body>
<script>

    const userEmailInput = document.getElementById("memberEmail1");
    const emailDomainInput = document.getElementById("emailDomain");
    const domainOptionsSelect = document.getElementById("domainOptions");
    const selectDomain = () => {
        emailDomainInput.value = domainOptionsSelect.value;
    }

    const searchAddress = () => {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }

    const ValidationName = () => {
        const memberId = document.getElementById("memberId");
        const memberPassword = document.getElementById("memberPassword");
        const Name = document.getElementById("memberName");
        const Birth = document.getElementById("memberBirth");
        const Address = document.getElementById("sample4_postcode");
        const Email = document.getElementById("memberEmail1");


        const exp1 = /^(?=.*[a-z])(?=.*\d)(?=.*[!#$%])[a-z\d!#$%]{8,16}$/;

        if (memberId.value.length == 0) {
            memberId.focus();
            alert("아이디가 입력되지 않았습니다")
            return false;
        } else if (memberPassword.value.length == 0) {
            alert("비밀번호를 입력하세요")
            memberPassword.focus();
            return false;
        }  else if (Name.value.length == 0) {
            alert("이름을 제대로 입력해주세요")
            Name.focus();
            return false;
        } else if (Birth.value.length == 0) {
            alert("생년월일을 입력해주세요")
            Birth.focus();
            return false;
        }else if(Address.value.length == 0){
            alert("주소를 입력해주세요")
            Address.focus();
            return false;
        }else if(Email.value.length == 0){
            alert("이메일을 입력해주세요");
            Email.focus();
            return false;
        }else {
            alert("회원가입완료")
            return true;
        }
    }
    const checkPassword = () => {
        const password = document.getElementById("memberPassword").value;
        const passwordCheck = document.getElementById("PasswordCheck").value;
        const passwordForm = document.getElementById("memberPassword");
        const passwordCheckForm = document.getElementById("PasswordCheck");
        const validFeedback = document.getElementById("valid-feedback");
        const invalidFeedback = document.getElementById("invalid-feedback");

        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[!#@$%])[a-z\d!#@$%]{8,16}$/;
        if(!password.match(exp)){
            passwordForm.classList.remove("is-valid");
            passwordForm.classList.add("is-invalid");
            validFeedback.style.color = "red";
            validFeedback.innerHTML = "8~16자리로 특수문자!#@$% 포함해서 만들어주세요 ";
        }else{
            passwordForm.classList.remove("is-invalid");
            passwordForm.classList.add("is-valid");
            validFeedback.style.color = "green";
            validFeedback.innerHTML = "좋은 비밀번호 입니다";
        }

        if (passwordCheck == password) {
            passwordForm.classList.remove("is-invalid");
            passwordForm.classList.add("is-valid");
            passwordCheckForm.classList.remove("is-invalid");
            passwordCheckForm.classList.add("is-valid");
            invalidFeedback.style.color = "green";
            invalidFeedback.innerHTML = "비밀번호가 맞습니다";
        } else if(passwordCheck !== password) {
            passwordForm.classList.remove("is-valid");
            passwordForm.classList.add("is-invalid");
            passwordCheckForm.classList.remove("is-valid");
            passwordCheckForm.classList.add("is-invalid");
            invalidFeedback.style.color = "red";
            invalidFeedback.innerHTML = "비밀번호가 틀립니다";
        }

    };

    const id_check = () => {
        const memberId = document.getElementById("memberId").value;
        const result = document.getElementById("check-result");
        $.ajax({
            url: "/id-check",
            type: "POST",
            data: {
                "memberId": memberId
            },
            success: function () {
                result.innerHTML = "사용가능한 아이디입니다";
                result.style.color = "green";

            },
            error: function (xhr, status, error) {
                result.innerHTML = "이미 사용중인  아이디입니다";
                result.style.color = "red"
            }
        });

    }

    $('#mail-Check-Btn').click(function() {
        const eamil = $('#memberEmail1').val() +"@"+ $('#emailDomain').val(); // 이메일 주소값 얻어오기!
        console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
        const checkInput = $('.mail-check-input') // 인증번호 입력하는곳

        $.ajax({
            type : 'get',
            url : '/mailCheck?email='+encodeURIComponent(eamil), // GET방식이라 Url 뒤에 email을 뭍힐수있다.
            success : function (data) {
                console.log("data : " +  data);
                checkInput.attr('disabled',false);
                code =data;
                alert('인증번호가 전송되었습니다.')
            }
        }); // end ajax
    }); // end send eamil

    // 인증번호 비교
    // blur -> focus가 벗어나는 경우 발생
    $('.mail-check-input').blur(function () {
        const inputCode = $(this).val();
        const $resultMsg = $('#mail-check-warn');

        if(inputCode === code){
            $resultMsg.html('인증번호가 일치합니다.');
            $resultMsg.css('color','green');
            $('#mail-Check-Btn').attr('disabled',true);
            $('#userEamil1').attr('readonly',true);
            $('#userEamil2').attr('readonly',true);
            $('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
            $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
            enableSubmitButton(true);
        }else{
            $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
            $resultMsg.css('color','red');
            enableSubmitButton(false);
        }
    });

    const enableSubmitButton = (enable) => {
        const submitBtn = document.getElementById("submitBtn");
        submitBtn.disabled = !enable;
    }






</script>
</html>
