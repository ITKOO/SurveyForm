<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Survey</title>
    <!-- 구글 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Pacifico|Nanum+Gothic" rel="stylesheet">
    <!-- chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
     <!-- 마테리얼라이즈 css -->
    <link rel="stylesheet" href="css/materialize.css">
    <!-- 마테리얼라이즈 icon css -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 마테리얼라이즈 js -->
    <script src="js/materialize.min.js"></script>
     <!-- survey관련 css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%!
	int live[] = new int[2];
	int age[] = new int[4];
	int conversation[] = new int[8];
	int count;
%>

<%
	request.setCharacterEncoding("UTF-8");

	BufferedReader reader = null;
	PrintWriter writer = null;
	
	// 첫번째 질문 답변 수 구하기(live)
		try {
			for(int i = 0; i < 2; i++)
			{
				String filePath = application.getRealPath("/WEB-INF/question/live/" + (i + 1) + ".txt");
				
				reader = new BufferedReader(new FileReader(filePath));
			
				while(true) {
					String stat = reader.readLine();
					if(stat==null) break;	
					live[i] = Integer.parseInt(stat);
				} //end of while
			} // end of for
	
			}
			catch(Exception e) {
				out.println("지정된 파일을 찾을 수 없습니다.");
			}
	
		// 두번째 질문 답변 수 구하기(age)
				try {
					for(int i = 0; i < 4; i++)
					{
						String filePath = application.getRealPath("/WEB-INF/question/age/" + (i + 1) + ".txt");
						
						reader = new BufferedReader(new FileReader(filePath));
					
						while(true) {
							String stat = reader.readLine();
							if(stat==null) break;	
							age[i] = Integer.parseInt(stat);
						} //end of while
					} // end of for
			
					}
					catch(Exception e) {
						out.println("지정된 파일을 찾을 수 없습니다.");
					}	
	
				// 세번째 질문 답변 수 구하기(conversation)
				try {
					for(int i = 0; i < 8; i++)
					{
						String filePath = application.getRealPath("/WEB-INF/question/conversation/" + (i + 1) + ".txt");
						
						reader = new BufferedReader(new FileReader(filePath));
					
						while(true) {
							String stat = reader.readLine();
							if(stat==null) break;	
							conversation[i] = Integer.parseInt(stat);
						} //end of while
					} // end of for
			
					}
					catch(Exception e) {
						out.println("지정된 파일을 찾을 수 없습니다.");
					}
	

%>
<div class="survey">
        <!-- 설문조사 배경부분 -->
        <div class="surveyBg">
            <br>
            <br>
            <i class="waves-effect waves-light material-icons white-text" id="backBtn" onclick = "location.href='index.jsp'">arrow_back</i>
        </div>

        <!-- 설문조사 결과부분 -->
        <div class="resultMain">
            <p class="title">결과</p>
            <hr><br><br>
            <div class = "rContent">
            <%count = live[0] + live[1]; %>
             	<p class="rTitle"><span class = "boldLetter">총 투표자 수 : </span><%=count %>명</p>
	            <br><br>
	            <p class="rTitle">Q. 현재 가족과 함께 살고 계십니까?</p>
	            <br>
		        <div class = "chart">
	        		<canvas id="liveChart" width="100" height="60"></canvas>
	    		</div>
	    		
	    		<br><br>	
	            <p class="rTitle">Q. 귀하의 연령이 어떻게 되십니까?</p>
	            <br>
		         <div class = "chart">
	        		<canvas id="ageChart" width="100" height="65"></canvas>
	    		</div>
	    		
	    		<br><br>	
	            <p class="rTitle">Q. 하루 동안 가족과 얼마나 대화 하십니까?</p>
	            <br>
		        <div class = "chart">
	        		<canvas id="conversationChart" width="100" height="70"></canvas>
	    		</div>
            </div>
                      
        </div>
</div>


<script>

        var liveChart = document.getElementById("liveChart").getContext('2d');
        var ageChart = document.getElementById("ageChart").getContext('2d');
        var conversationChart = document.getElementById("conversationChart").getContext('2d');
        
        var myChart = new Chart(liveChart, {
            type: 'pie',
            data: {
                labels: ["살고있습니다", "살고있지않습니다"],
                datasets: [{
                    label: '투표수',
                    data: [<%=live[0]%>,<%=live[1]%>],
                    backgroundColor: [
                        'rgb(255, 122, 135)',
                        'rgba(54, 162, 235, 1)',

                    ],
                    borderColor: [
                        'rgb(255, 122, 135)',
                        'rgba(54, 162, 235, 1)',
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
        
        var myChart = new Chart(ageChart, {
            type: 'bar',
            data: {
                labels: ["10대", "20대", "30대 ~ 40대", "50대 이상"],
                datasets: [{
                    label: '투표수',
                    data: [<%=age[0]%>,<%=age[1]%>,<%=age[2]%>,<%=age[3]%>],
                    backgroundColor: [
                    	'rgb(255, 122, 135)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',

                    ],
                    borderColor: [
                        'rgb(255, 122, 135)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',  
                        
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
        
        var myChart = new Chart(conversationChart, {
            type: 'doughnut',
            data: {
                labels: ["아예하지않는다", "5분미만", "5분 이상 10분 미만", "10분 이상 20분 미만", "20분 이상 30분 미만", "30분 이상 1시간 미만", "1시간 이상 2시간 미만", "2시간 이상 3시간 미만"],
                datasets: [{
                    label: '투표수',
                    data: [<%=conversation[0]%>,<%=conversation[1]%>,<%=conversation[2]%>,<%=conversation[3]%>,<%=conversation[4]%>,<%=conversation[5]%>,<%=conversation[6]%>,<%=conversation[7]%>],
                    backgroundColor: [
                    	 'rgb(255, 122, 135)',
                         'rgba(54, 162, 235, 1)',
                         'rgba(255, 206, 86, 1)',
                         'rgba(75, 192, 192, 1)',
                         'rgba(153, 102, 255, 1)',
                         'rgba(255, 159, 64, 1)',
                         'rgba(38, 105, 24)',
                         'rgba(76, 243, 42)',
                    ],
                    borderColor: [
                    	 'rgb(255, 122, 135)',
                         'rgba(54, 162, 235, 1)',
                         'rgba(255, 206, 86, 1)',
                         'rgba(75, 192, 192, 1)',
                         'rgba(153, 102, 255, 1)',
                         'rgba(255, 159, 64, 1)',
                         'rgba(38, 105, 24)',
                         'rgba(76, 243, 42)',
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });


</script>

</body>
</html>