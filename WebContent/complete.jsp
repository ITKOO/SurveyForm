<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Survey</title>
    <!-- 구글 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Pacifico|Nanum+Gothic" rel="stylesheet">
    <!-- survey관련 css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- 마테리얼라이즈 css -->
    <link rel="stylesheet" href="css/materialize.css">
    <!-- 마테리얼라이즈 icon css -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 마테리얼라이즈 js -->
    <script src="js/materialize.min.js"></script>
</head>

<body>

<%!
	int liveValue;
	int ageValue;
	int conversationValue;
%>

<%
	request.setCharacterEncoding("UTF-8");

	//Q. 현재 가족과 함께 살고 계십니까? 의 값
	String live = request.getParameter("live");
	
	//Q. 귀하의 연령이 어떻게 되십니까? 의 값
	String age = request.getParameter("age");
	
	//Q. 하루 동안 가족과 얼마나 대화 하십니까? 의 값
	String conversation = request.getParameter("conversation");
	
	BufferedReader reader = null;
	PrintWriter writer = null;
	
	// live 투표결과 수를 읽는 부분
	try {
			String filePath = application.getRealPath("/WEB-INF/question/live/" + live + ".txt");
				
			reader = new BufferedReader(new FileReader(filePath));
			
			while(true) {
				String stat = reader.readLine();
				if(stat==null) break;	
				liveValue = Integer.parseInt(stat) + 1;
			
			} // end of while
	
		}
			
		catch(Exception e) {
				out.println("지정된 파일을 찾을 수 없습니다.");
		}
	
	// live 투표결과 수에 +1 한 것을 쓰는 부분
	try{
		String filePath = application.getRealPath("/WEB-INF/question/live/" + live + ".txt");
		
		writer = new PrintWriter(filePath);

		writer.printf("%s", liveValue);

		writer.flush();	
		
	}
	
	catch(Exception e){
		out.println("오류발생이다 잦슥아~");	
	}
	
	
	// age 투표결과 수를 읽는 부분
		try {
				String filePath = application.getRealPath("/WEB-INF/question/age/" + age + ".txt");
					
				reader = new BufferedReader(new FileReader(filePath));
				
				while(true) {
					String stat = reader.readLine();
					if(stat==null) break;	
					ageValue = Integer.parseInt(stat) + 1;
				
				} // end of while
		
			}
				
			catch(Exception e) {
					out.println("지정된 파일을 찾을 수 없습니다.");
			}
		
		// age 투표결과 수에 +1 한 것을 쓰는 부분
		try{
			String filePath = application.getRealPath("/WEB-INF/question/age/" + age + ".txt");
			
			writer = new PrintWriter(filePath);

			writer.printf("%s", ageValue);

			writer.flush();	
			
		}
		
		catch(Exception e){
			out.println("오류발생이다 잦슥아~");	
		}	
	
		
		// conversation 투표결과 수를 읽는 부분
				try {
						String filePath = application.getRealPath("/WEB-INF/question/conversation/" + conversation + ".txt");
							
						reader = new BufferedReader(new FileReader(filePath));
						
						while(true) {
							String stat = reader.readLine();
							if(stat==null) break;	
							conversationValue = Integer.parseInt(stat) + 1;
						
						} // end of while
				
					}
						
					catch(Exception e) {
							out.println("지정된 파일을 찾을 수 없습니다.");
					}
				
				// conversation 투표결과 수에 +1 한 것을 쓰는 부분
				try{
					String filePath = application.getRealPath("/WEB-INF/question/conversation/" + conversation + ".txt");
					
					writer = new PrintWriter(filePath);

					writer.printf("%s", conversationValue);

					writer.flush();	
					
				}
				
				catch(Exception e){
					out.println("오류발생이다 잦슥아~");	
				}	

	
%>
    <div class="survey">
        <!-- 설문조사 배경부분 -->
        <div class="surveyBg">
            <br>
            <br>
            <i class="waves-effect waves-light material-icons white-text" id="backBtn" onclick = "location.href='index.jsp'">arrow_back</i>
        </div>

        <!-- 설문조사 내용부분 -->
        <div class="completeMain">
            <br>
            <p class="title">설문 완료</p>
            <hr>
            <div class = "completeContent">
                설문에 참여해주셔서 진심으로 감사드립니다. 평소에 가족들과 대화를 많이 나누고 계신가요? <br> 
                좋은일 가득하시길 바라며, 이상 IT를 향해 나아가는 이쿠,  @ITKOO 였습니다. :)
            </div>         
        </div>

      
        <button class="waves-effect waves-light btn right" type="submit" onclick="location.href = 'result.jsp'" id="okBtn">결 과 보 기</button>

    </div>
</body>

</html>