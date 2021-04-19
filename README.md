<details>
  <summary> 목차 </summary>  
  1. 프로젝트 소개   
    1.1 프로젝트 기능    
    1.2 개발 환경
    1.3 프로젝트 구조
  2. Fronend architecture
  3. Backend architecture   
    3.1 DB 스키마   
    3.2 Endpoints       
  4. 느낀점 및 향후 계획
 </details>
 
# Soodagram(Instagram clone)
## 1. 프로젝트 소개
  Spring을 공부하면서 공부한 내용을 실제 사용하는 어플리케이션에 적용하여 구현하는 클론코딩을 해봄으로써, 어떻게 서비스가 동작이 되는지 경험해 보고자 시작한 개인 프로젝트 입니다.
혼자 독학하며 제작을 하기 때문에, 많은 내용이 부족하고 기초가 부족하다 느껴지는 프로젝트이나, 차근차근 공부할 수 있는 계기가 되는 프로젝트 입니다.

### 1.1 프로젝트 기능
  클론코딩이기 때문에 인스타그램에 존재하고 있는 기본 기능을 구현해보고자 했습니다.    
- 회원가입 및 로그인        
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199410-25d1b500-a12e-11eb-8a5e-239e555f4dab.gif"/>    
- 유저 팔로잉/팔로우    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199523-439f1a00-a12e-11eb-8017-b39920766f6d.gif"/>    
- 피드 작성/삭제    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199569-531e6300-a12e-11eb-94a4-ecbfc37baf8a.gif"/>    
- 다른 유저 피드 열람    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199799-87921f00-a12e-11eb-8d4c-32da046119db.gif"/>    
- 댓글 등록 및 열람    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115200010-c031f880-a12e-11eb-9eb0-643b3e71ee48.gif"/>    
- 유저/해시태그 검색    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199848-94af0e00-a12e-11eb-8cec-737361d901c0.gif"/>    

### 1.2 개발 환경
운영체제: window 10
IDE: Eclipse 4.18.0
Backend: Spring Framework 4.3.8.RELEASE, Tomcat 9.0, mybatis 3.5.6
Database: MariaDB 

### 1.3 프로젝트 구조
  인스타그램은 SPA 구조지만, 아직 리액트와 같은 라이브러리를 공부 못한 관계로 SPA 구조로 만들지 못하고 jsp를 이용하여 view단을 구성하였습니다. 그래서 전체적으로는 서버 사이드 렌더링 방식의 구조를 취하고 있지만, 동적으로 필요한 데이터는 ajax 비동기 통신을 이용하여 데이터를 요청, Handlebar template을 이용하여 페이지에 렌더링하여 최대한 인스타그램과 비슷하게 효과를 가질 수 있도록 구현하였습니다. 또한 MVC 디자인 패턴으로 설계하여, 프로젝트의 유지 및 보수를 용이하도록 구성하며, RESTful API 설계 가이드를 최대한 따르며 RESTful 설계를 할 수 있도록 노력했습니다.    
  

