<details>
  <summary> 목차 </summary>
  
  1. 프로젝트 소개   
    1.1 프로젝트 목표    
    1.2 구현 기능    
    
  2. 폴더 구조  
  3. Backend architecture   
    3.1 DB 스키마   
    3.2 Endpoints       
  4. 느낀점 및 향후 계획
 </details>
 
# Soodagram(Instagram clone)
## 1. 프로젝트 소개
Soodagram
기본이 되는 게시판 작성을 응용하여, 전 세계적으로 사용자가 많은 인스타그램을 스프링으로 구현

### 1-1 프로젝트 목표
* 기본적인 스프링의 활용
* MVC 디자인 패턴 활용
* REST 방식 설계를 통해 CRUD operation 활용
* 전반적인 웹페이지의 구성 및 흐름 파악
* 프론트엔드와 백엔드의 기초적인 역할 파악

### 1-2 구현 기능
* 사용자 관련
  - 회원가입
  - 로그인
  - 프로필 수정
* 게시물 관련
  - 게시물 작성
  - 게시물 삭제
  - 게시물 열람
  - 댓글 기능
* 소셜 관련
  - 유저간 팔로잉/팔로우
  - 게시물 좋아요
* 검색 관련
  - 유저 검색
  - 해시태그 검색

## 2. 폴더 구조

MVC 패턴을 적용하여, 각 기능별로 commons/feed/reply/search/user 로 구분    
공통 유틸을 제외한 각 기능별 패키지에는 controller - service - repository - domain 으로 분할    
Mapper 또한 각 기능에 따라 분리하여 작성    

## 3. Backend architecture
### 3-1 DB 스키마
### 3-2 Endpoints

## 4. 느낀점 및 향후 계획
해당 프로젝트와 연관성이 떨어진다 생각하여 블로그(링크)에 기술
