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
    <div class="survey">
        <!-- 설문조사 배경부분 -->
        <div class="surveyBg">
            <br>
            <br>
            <i class="waves-effect waves-light material-icons white-text" id="backBtn" onclick = "location.href='index.jsp'">arrow_back</i>
        </div>

        <!-- 설문조사 내용부분 -->
        <div class="surveyMain">
            <p class="title">가족과 얼마나 대화하세요?</p>
            <hr>
        </div>

        <form method="post" action="complete.jsp" class="surveyForm">
            <div class="surveyContent">

                <br>
                <br>
                <span class="qTitle">Q. 현재 가족과 함께 살고 계십니까?</span>
                <br>
                <br>
                <p>
                    <label>
                        <input class="with-gap" name="live" value = "1" type="radio" required/>
                        <span>살고 있습니다.</span>
                    </label>
                </p>

                <p>
                    <label>
                        <input class="with-gap" name="live" value = "2" type="radio" />
                        <span>살고 있지않습니다.</span>
                    </label>
                </p>
            </div>

            <div class="surveyContent">
                <br>
                <span class="qTitle">Q. 귀하의 연령이 어떻게 되십니까?</span>
                <br>
                <br>
                <p>
                    <label>
                        <input class="with-gap" name="age" value = "1" type="radio" required/>
                        <span>10대</span>
                    </label>
                </p>

                <p>
                    <label>
                        <input class="with-gap" name="age" value = "2" type="radio" />
                        <span>20대</span>
                    </label>
                </p>

                <p>
                    <label>
                        <input class="with-gap" name="age" value = "3" type="radio" />
                        <span>30대~40대</span>
                    </label>
                </p>


                <p>
                    <label>
                        <input class="with-gap" name="age" value = "4" type="radio" />
                        <span>50대 이상</span>
                    </label>
                </p>

            </div>


            <div class="surveyContent">

                <br>
                <br>
                <span class="qTitle">Q. 하루 동안 가족과 얼마나 대화 하십니까?</span>
                <br>
                <br>
                <p>
                    <label>
                        <input class="with-gap" name="conversation" value = "1" type="radio" required/>
                        <span>아예하지 않는다.</span>
                    </label>
                    <label>
                        &nbsp;&nbsp;
                        <input class="with-gap" name="conversation" value = "2" type="radio" />
                        <span>5분 미만</span>
                    </label>
                    <label> &nbsp;&nbsp;
                        <input class="with-gap" name="conversation" value = "3" type="radio" />
                        <span>5분 이상 10분 미만</span>
                    </label>

                    <label>
                        &nbsp;&nbsp;
                        <input class="with-gap" name="conversation" value = "4" type="radio" />
                        <span>10분 이상 20분 미만</span>
                    </label>

                </p>

                <p>
                    <label>
                        <input class="with-gap" name="conversation" value = "5" type="radio" />
                        <span>20분 이상 30분 미만</span>
                    </label>
                    <label>
                        &nbsp;&nbsp;
                        <input class="with-gap" name="conversation" value = "6" type="radio" />
                        <span>30분 이상 1시간 미만</span>
                    </label>
                    <label>
                        &nbsp;&nbsp;
                        <input class="with-gap" name="conversation" value = "7" type="radio" />
                        <span>1시간 이상 2시간 미만</span>
                    </label>
                    <label>
                        &nbsp;&nbsp;
                        <input class="with-gap" name="conversation" value = "8" type="radio" />
                        <span>2시간 이상 3시간 미만</span>
                    </label>
                </p>

            </div>
            <button class="waves-effect waves-light btn right" type="submit" name="action" id="okBtn">제 출 하 기</button>
        </form>

    </div>
</body>

</html>