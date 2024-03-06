<%@page import="dto.Member"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>

<%
    request.setCharacterEncoding("utf-8");

    // 양식에 입력되었던 값 읽기
    String title   = request.getParameter("title");
    String content = request.getParameter("content");
	

    // 빈 칸이 하나라도 있으면 오류 출력하고 종료
    if (title   == null || title.length()   == 0 ||
        content == null || content.length() == 0) {
%>
<script>
	alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
	history.back();
</script>
<%        
        return;
    }

    String memberId = (String) session.getAttribute("ID");
    if (memberId == null) {
    	response.sendRedirect("index.jsp");
    }
    
    // memberId 값이 숫자 형식인지 확인
    int memberIdValue = 0;
    try {
        memberIdValue = Integer.parseInt(memberId);
    } catch (NumberFormatException e) {
        // memberId가 숫자 형식이 아닌 경우, 기본값이나 오류 처리를 수행
        // 여기서는 0을 기본값으로 사용하도록 설정
        memberIdValue = 0;
    }

    // 새로운 Board 객체 생성
    

    // 나머지 코드는 그대로 유지
    // ...


    
	Member member = (Member)session.getAttribute("member");
   
    // 현재 시간 정보를 가진 LocalDateTime 객체 생성
    LocalDateTime regtime = LocalDateTime.now();
	Board newBoard = new Board(0, title, content, regtime, 0, member.getMemberno());
    // 새로운 Board 객체 생성
   
    // BoardDao 객체 생성 및 게시글 등록
    BoardDao dao = BoardDao.getInstance();
    int result = dao.insert(newBoard);
   
    if (result > 0) {
        // 정상적으로 등록되었을 때의 로그
        System.out.println("게시글이 성공적으로 등록되었습니다.");
    } else {
        // 등록 실패 시의 로그
        System.out.println("게시글 등록에 실패했습니다.");
    }

   

   
    //Board board = new Board(0, writer, title, content, "", 0);
    /*Board board = new Board();
    board.setWriter(writer);
    board.setTitle(title);
    board.setContent(content);*/
    
    // 목록보기 화면으로 돌아감
    response.sendRedirect("list.jsp");
%>



