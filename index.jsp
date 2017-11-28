<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Continuing Studies - Class Feed</title>

    <!-- DOCUMENT STYLING -->
    <link rel="stylesheet" href="css/style.css">

    <!-- DOCUMENT SCRIPTS -->
    <script src="js/jquery.js" charset="utf-8"></script>
    <script src="js/scroll.js" charset="utf-8"></script>

</head>

<body onload="JavaScript:timedRefresh(180000);"  scroll="no">
    <jsp:useBean id="Info" class="ca.langara.reports.CSRoomReportLister"  scope="request" />
    <jsp:useBean id="now" class="java.util.Date"/>
    <f:formatDate pattern="HHmm" value="${now}" var="currentTimein24Format" />
<!-- CONTAINER -->
<div id="classfeed">

<!-- SCHEDULE -->
    <section id="schedule-container">
        <ul id="widget-info">
            <li class="info-row">
                <span class="row-room-number">Room</span>
                <span class="row-course-name">Course</span>
                <span class="row-class-time">Start/End</span>
<!-- 					<span class="row-crn">CRN</span> -->
            </li>
        </ul>
        <ul id="widget">
            <c:set var="plistcount" value="0" scope="page" />
            <c:forEach var="plist" items="${Info.list}" >

            	<c:if test="${plist.beginTime>(currentTimein24Format-200)}">
            	<%-- <c:if test="${plist.beginTime<(currentTimein24Format+400)}"> --%>
            	<c:if test="${plist.beginTime<(2359)}">

            	<c:set var="plistcount" value="${plistcount + 1}" scope="page"/>


            			<c:choose>
            			  <c:when test="${plist.beginTime>1159}">
            					<c:set var="beginTimeAMPMHours" value="${fn:substring(plist.beginTime, 0, 2)}" scope="page" />
            					<c:set var="beginTimeAMPMHours" value="${beginTimeAMPMHours-12}" scope="page" />
            					<c:if test="${beginTimeAMPMHours==0}">
            						<c:set var="beginTimeAMPMHours" value="12" scope="page" />
            					</c:if>

            					<c:set var="beginTimeAMPM" value="pm" scope="page" />
            					<c:set var="beginTimeAMPMMinutes" value="${fn:substring(plist.beginTime, 2, 4)}" scope="page" />
            			  </c:when>


            			  <c:otherwise>
            					<c:set var="beginTimeAMPMHours" value="${fn:substring(plist.beginTime, 0, 2)}" scope="page" />
            					<c:set var="beginTimeAMPMHours" value="${beginTimeAMPMHours}" scope="page" />
            					<c:set var="beginTimeAMPM" value="am" scope="page" />
            					<c:set var="beginTimeAMPMMinutes" value="${fn:substring(plist.beginTime, 2, 4)}" scope="page" />

            					<c:if test="${beginTimeAMPMHours=='07'}">
            						<c:set var="beginTimeAMPMHours" value="7" scope="page" />
            					</c:if>
            					<c:if test="${beginTimeAMPMHours=='08'}">
            						<c:set var="beginTimeAMPMHours" value="8" scope="page" />
            					</c:if>
            					<c:if test="${beginTimeAMPMHours=='09'}">
            						<c:set var="beginTimeAMPMHours" value="9" scope="page" />
            					</c:if>
            			  </c:otherwise>
            			</c:choose>

            			<c:choose>
            			  <c:when test="${plist.endTime>1159}">
            					<c:set var="endTimeAMPMHours" value="${fn:substring(plist.endTime, 0, 2)}" scope="page" />
            					<c:set var="endTimeAMPMHours" value="${endTimeAMPMHours-12}" scope="page" />
            					<c:if test="${endTimeAMPMHours==0}">
            						<c:set var="endTimeAMPMHours" value="12" scope="page" />
            					</c:if>
            					<c:set var="endTimeAMPM" value="pm" scope="page" />
            					<c:set var="endTimeAMPMMinutes" value="${fn:substring(plist.endTime, 2, 4)}" scope="page" />
            			  </c:when>

            			 <c:otherwise>
            					<c:set var="endTimeAMPMHours" value="${fn:substring(plist.endTime, 0, 2)}" scope="page" />
            					<c:set var="endTimeAMPMHours" value="${endTimeAMPMHours}" scope="page" />
            					<c:set var="endTimeAMPM" value="am" scope="page" />
            					<c:set var="endTimeAMPMMinutes" value="${fn:substring(plist.endTime, 2, 4)}" scope="page" />

            					<c:if test="${endTimeAMPMHours=='07'}">
            						<c:set var="endTimeAMPMHours" value="7" scope="page" />
            					</c:if>
            					<c:if test="${endTimeAMPMHours=='08'}">
            						<c:set var="endTimeAMPMHours" value="8" scope="page" />
            					</c:if>
            					<c:if test="${endTimeAMPMHours=='09'}">
            						<c:set var="endTimeAMPMHours" value="9" scope="page" />
            					</c:if>
            			 </c:otherwise>
            			</c:choose>

            					<li class="course-row">
            						<span class="row-room-number">
            						<c:if test="${empty plist.room}">
            							n/a
            						</c:if>
            						${plist.room}

            						</span>
            						<span class="row-course-name">${plist.title}<br/>
            							<span class="instructor">${plist.instructors} </span>
            						</span>
            						<span class="row-start-time"><!--${plist.beginTime}-->${beginTimeAMPMHours}:${beginTimeAMPMMinutes} ${beginTimeAMPM}<br/>
            							<span class="row-end-time"><!--${plist.endTime}-->${endTimeAMPMHours}:${endTimeAMPMMinutes} ${endTimeAMPM}</span>
            						</span>
            	<!-- 					<span class="row-crn">${plist.crn}</span> -->
            					</li>
            	</c:if>
            	</c:if>

            </c:forEach>
        </ul>
    </section>

    <!-- DATE/TIME -->
        <section id="current-time">
            <p id="clock">HH:MM</p>
            <p id="date">January 01, 2017</p>
        </section>
</div>


<script type="text/javascript">$('#widget').newsScroll();</script>
<script src="js/moment.js" charset="utf-8"></script>

<!-- INLINE SCRIPTS FOR DATE/TIME CONTROL -->
    <script type="text/javascript">

    //Control TIME
    var myTimer = setInterval(setClock,1000);

         function setClock(){
            document.getElementById("clock").innerHTML = moment().format('LT');
            document.getElementById("date").innerHTML = moment().format('LL');
        };


    </script>

</body>

</html>
