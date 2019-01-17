<%@ page language="java" contentType="text/html; charset=utf-8"
	import="org.great.dao.*,java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>- 日历</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="<%=path%>mainwin/date_css/favicon.ico">
<link
	href="<%=path%>brower/charge_net/date_css/bootstrap.min.css?v=3.3.6"
	rel="stylesheet">
<link
	href="<%=path%>brower/charge_net/date_css/font-awesome.css?v=4.4.0"
	rel="stylesheet">

<link href="<%=path%>brower/charge_net/date_css/custom.css"
	rel="stylesheet">

<link href="<%=path%>brower/charge_net/date_css/fullcalendar.css"
	rel="stylesheet">
<link href="<%=path%>brower/charge_net/date_css/fullcalendar.print.css"
	rel="stylesheet">

<link href="<%=path%>brower/charge_net/date_css/animate.css"
	rel="stylesheet">
<link href="<%=path%>brower/charge_net/date_css/style.css?v=4.1.0"
	rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row animated fadeInDown">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>排班列表</h5>
						<div class="ibox-tools"></div>
					</div>
					<div class="ibox-content">
						<!-- 						<div id='external-events'> -->
						<!-- 							<p>可拖动时间段</p> -->
						<!-- 							<div class='external-event navy-bg'>8:00-9:00</div> -->
						<!-- 							<div class='external-event navy-bg'>10:00-11:00</div> -->
						<!-- 							<div class='external-event navy-bg'>11:00-12:00</div> -->
						<!-- 							<div class='external-event navy-bg'>14:00-15:00</div> -->
						<!-- 							<div class='external-event navy-bg'>15:00-16:00</div> -->
						<!-- 							<div class='external-event navy-bg'>16:00-17:00</div> -->
						<!-- 						</div> -->
						<div id='external-events'>
							<p>可拖动人员</p>
							<c:forEach items="${nei_list}" var="n" varStatus="s">
								<div class='external-event navy-bg'>
									内科:<span style="display: none">${n.s_id}:</span>${n.s_name}</div>
							</c:forEach>
							<c:forEach items="${wai_list}" var="n" varStatus="s">
								<div class='external-event navy-bg'>
									外科:<span style="display: none">${n.s_id}:</span>${n.s_name}</div>
							</c:forEach>
							<p class="m-t">
								<input type='checkbox' id='drop-remove' class="i-checks" /> <label
									for='drop-remove'>移动后删除</label>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>日期</h5>
						<div class="ibox-tools"></div>
					</div>
					<div class="ibox-content">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 全局js -->
	<script src="<%=path%>brower/charge_net/date_js/jquery.min.js?v=2.1.4"></script>
	<script
		src="<%=path%>brower/charge_net/date_js/bootstrap.min.js?v=3.3.6"></script>



	<!-- 自定义js -->
	<script src="<%=path%>brower/charge_net/date_js/content.js?v=1.0.0"></script>


	<script
		src="<%=path%>brower/charge_net/date_js/jquery-ui.custom.min.js"></script>

	<!-- iCheck -->
	<script src="<%=path%>brower/charge_net/date_js/icheck.min.js"></script>

	<!-- Full Calendar -->
	<script src="<%=path%>brower/charge_net/date_js/fullcalendar.min.js"></script>

	<script>
        $(document).ready(function () {

            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });

            /* initialize the external events
             -----------------------------------------------------------------*/

            $('#external-events div.external-event').each(function () {

                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim($(this).text()) // use the element's text as the event title
                };
				
                // store the Event Object in the DOM element so we can get to it later
                $(this).data('eventObject', eventObject);
				
                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });

            });


            /* initialize the calendar
             -----------------------------------------------------------------*/
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar !!!
                drop: function (date, allDay) { // this function is called when something is dropped
                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');
					
                    alert(originalEventObject.title)
                    // we need to copy it, so that multiple events don't have a reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);
					
                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    copiedEventObject.allDay = allDay;

                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }
                    var objD= date;
                    var str;
                     	 			var yy = objD.getYear();
        	             	 if(yy<1900) yy = yy+1900;
                   	 var MM = objD.getMonth()+1;
                  	if(MM<10) MM = '0' + MM;
                      			var dd = objD.getDate();
                      	 		if(dd<10) dd = '0' + dd;
                     		 		var	 hh = objD.getHours();
                      	 		if(hh<10) hh = '0' + hh;
                     	 			var mm = objD.getMinutes();
                       			if(mm<10) mm = '0' + mm;
                   	 var ss = objD.getSeconds();
                      			 if(ss<10) ss = '0' + ss;
			                      var ww = objD.getDay();
			                       if (ww==0) ww="星期日";
			                       if (ww==1) ww="星期一";
			                       if (ww==2) ww="星期二";
			                       if (ww==3) ww="星期三";
			                       if (ww==4) ww="星期四";
			                       if (ww==5) ww="星期五";
			                       if (ww==6) ww="星期六";
			                     
                        str =  yy + "-" + MM + "-" + dd ;
                       			var tiems =  hh + ":" + mm ;
                    alert(str)
                    alert(ww)
                    
                    $.ajax({
        				url:"<%=path%>Doctor_Servlet",
        						type : "post",
        						dataType : "text",
        						data : "action=update&title="+originalEventObject.title+"&loginname=${loginname}&date="+str+"&xingqi="+ww+"&time="+tiems,
        						success : function(json) {
        							if (json == null || json == ",") {
        								alert("查询错误！" + json);
        								return;
        							}else{
        								alert("插入成功！" + json);
        							}
        							

        						}

        					});
                    

                },
                events: [
                	<c:forEach items="${doctor_list}" var="s" varStatus="c">
                
					{
							title: '${s.doc_dept}:${s.s_id}:${s.doc_name}',
							start: '${s.doc_date} ${s.time}',
							end: '${s.doc_date} ${s.time}',
							allDay: false,
						},
						</c:forEach>
                	

                ],
            });


        });
    </script>



</body>

</html>
