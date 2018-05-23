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
    <!-- ���� ����Ʈ -->
    <link href="https://fonts.googleapis.com/css?family=Pacifico|Nanum+Gothic" rel="stylesheet">
    <!-- chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
     <!-- ���׸�������� css -->
    <link rel="stylesheet" href="css/materialize.css">
    <!-- ���׸�������� icon css -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- ���׸�������� js -->
    <script src="js/materialize.min.js"></script>
     <!-- survey���� css -->
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
	
	// ù��° ���� �亯 �� ���ϱ�(live)
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
				out.println("������ ������ ã�� �� �����ϴ�.");
			}
	
		// �ι�° ���� �亯 �� ���ϱ�(age)
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
						out.println("������ ������ ã�� �� �����ϴ�.");
					}	
	
				// ����° ���� �亯 �� ���ϱ�(conversation)
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
						out.println("������ ������ ã�� �� �����ϴ�.");
					}
	

%>
<div class="survey">
        <!-- �������� ���κ� -->
        <div class="surveyBg">
            <br>
            <br>
            <i class="waves-effect waves-light material-icons white-text" id="backBtn" onclick = "location.href='index.jsp'">arrow_back</i>
        </div>

        <!-- �������� ����κ� -->
        <div class="resultMain">
            <p class="title">���</p>
            <hr><br><br>
            <div class = "rContent">
            <%count = live[0] + live[1]; %>
             	<p class="rTitle"><span class = "boldLetter">�� ��ǥ�� �� : </span><%=count %>��</p>
	            <br><br>
	            <p class="rTitle">Q. ���� ������ �Բ� ��� ��ʴϱ�?</p>
	            <br>
		        <div class = "chart">
	        		<canvas id="liveChart" width="100" height="60"></canvas>
	    		</div>
	    		
	    		<br><br>	
	            <p class="rTitle">Q. ������ ������ ��� �ǽʴϱ�?</p>
	            <br>
		         <div class = "chart">
	        		<canvas id="ageChart" width="100" height="65"></canvas>
	    		</div>
	    		
	    		<br><br>	
	            <p class="rTitle">Q. �Ϸ� ���� ������ �󸶳� ��ȭ �Ͻʴϱ�?</p>
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
                labels: ["����ֽ��ϴ�", "��������ʽ��ϴ�"],
                datasets: [{
                    label: '��ǥ��',
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
                labels: ["10��", "20��", "30�� ~ 40��", "50�� �̻�"],
                datasets: [{
                    label: '��ǥ��',
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
                labels: ["�ƿ������ʴ´�", "5�й̸�", "5�� �̻� 10�� �̸�", "10�� �̻� 20�� �̸�", "20�� �̻� 30�� �̸�", "30�� �̻� 1�ð� �̸�", "1�ð� �̻� 2�ð� �̸�", "2�ð� �̻� 3�ð� �̸�"],
                datasets: [{
                    label: '��ǥ��',
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