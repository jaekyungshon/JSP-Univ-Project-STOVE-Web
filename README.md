
<div align="center">
  
  ![header](https://capsule-render.vercel.app/api?type=waving&color=timeAuto&height=180&section=header&text=STOVE&fontSize=70)
  ### JSP + WAS
</div>

<br/>

## 🖥️ 프로젝트 소개
Clone 프로젝트로, STOVE 게임사 사이트의 회원가입 절차 페이지를 직접 구현해보았습니다.
- 대상 URL : [STOVE](https://accounts.onstove.com/login?redirect_url=https%3A%2F%2Fwww.onstove.com%2F)

<div align="center">

  <img src="https://github.com/jaekyungshon/JSP-Univ-Project-Web-STOVE/assets/61006212/38a298ea-9d95-40e0-a4aa-1c1640f026f2" width="300" height="300">
  <img src="https://github.com/jaekyungshon/JSP-Univ-Project-Web-STOVE/assets/61006212/1d43748d-6956-4169-923f-e31e27130c53" width="300" height="300">
</div>

<br/>

## ⏰ 개발 기간
- 2023.05.19 ~ 2023.05.22

### 🧑‍🤝‍🧑 멤버 구성
- jaekyungShon : 총괄

### ⚙️ 개발 환경
- `Java 8`
- `OpenJDK 11`
- UI : Chrome
- DB : Java Instance (static)
- WAS : Tomcat Apache
- IDLE : Eclipse

### 📋 버전 히스토리
- Ver 1.0 : 2023.05.19 ~
- Ver 2.0 : 차후 예정
  
<br/>

## 📌 개발 제약조건
- DB Table 대신, **Java Static Instance**를 이용하여 유저 데이터를 관리. (서버 구동동안만 유지된다는 한계점)
- 이메일 인증은 Google 서비스 대신, **6자리 인증번호 랜덤 부여**를 통해 진행.
  
> **차후, 개선점**
> - Oracle DBMS로 교체
> - 페이지 간 데이터 주고받기 : 내장객체 request / response로 변경
> - 모듈화
> - Bootstrap CRA 방식으로 교체
> - Injection Attack 방어를 위한 웹프레임워크 React로 변경

<br/>

## 📌 주요 기능
- 유효성 검사 : JS 구현
  
    > *아이디*
    > - 정규식을 통한 이메일(아이디) 형식 확인.
    > - 인증 버튼을 통한 인증 번호 일치 여부 확인.
    > - DAO를 통해 이메일 중복 여부 체크.

    > *비밀번호*
    > - 정규식을 통한 영문+숫자+특수기호 형식 확인.
    > - 길이 체크를 통한 안전 등급 고지.

- 닉네임 랜덤 부여

    > - ASCII Code를 통해 0~z까지 15자리의 혼합 닉네임 생성 및 부여.
    > - Java Class(Name : RandomNickName)를 통해 메서드 접근.

> **차후, 개선점**
> - 실제 이메일로 인증번호 보내기를 통한, 이메일인증+중복여부 함께 체크.
> - 사용자의 사람여부 체크를 위한 Google 인증 API 도입.
