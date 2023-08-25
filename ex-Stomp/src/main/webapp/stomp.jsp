<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Stomp Example</title>
</head>

<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>	
  
<script src="<c:url value='/js/sockjs.client.min.js' />"></script>
<script src="<c:url value='/js/stomp-2.3.4.min.js' />"></script>
<script src="<c:url value='/js/chart.min.js' />"></script>
<script>
$(document).ready(  function() {
	
	connectStomp();
	$('#btnSend').on('click', function(event) {
		event.preventDefault();
		
        if (socket.readyState !== 1) return;
        
        let msg = $('input#msg').val();
        console.log("===>>", msg)

        stomp.send("/sendRabbit", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": msg}));
        stomp.send("/sendRabbit_a", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": msg}));
    });
	$('#btnRecv').on('click', function(event) {
		event.preventDefault();
		
        if (socket.readyState !== 1) return;
        

        stomp.send("/recvRabbit", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": msg}));
        stomp.send("/recvRabbit_a", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": msg}));
    });
});

var socket = null;
var stomp = null;

function connectStomp() {
	socket = new SockJS("<c:url value='/stomp' />"); // endpoint
    stomp = Stomp.over(socket);
    
    stomp.connect({}, function () {
        console.log("Connected stomp!");
        console.log(stomp.ws._transport.url); 
        
/*         // Controller's MessageMapping, header, message(자유형식)
        stomp.send("/initStomp", {}, '{"roomId": "message", "id": "test", msg: "init message"}');

        // CPULoad 토픽 구독!
        stomp.subscribe('/topic/cpuLoad', function (event) {

        	//console.log("!!!!!!!!!!!!event>>", event)
            let ret = JSON.parse(event.body).map( (value,index,array) => {
            	//console.log(value["cpuLoad"]);
            	return value["cpuLoad"];}
            );
            console.log("data count ="+ret.length);
            updateChart(ret);
            //console.log("=>>>"+ ret.length);
        });
        
        // Message 토픽 구독!
        stomp.subscribe('/topic/message', function (event) {
        	console.log("topic/message return = "+event);
        	console.log("topic/message return = "+event.body);
        	console.log("-----------------------------------------------");
        }); */
    });

}

</script>
<script>

const labels = Array.from({length: 50}, (v,i) => ""+(++i));;

const options = {
		scales: {
            y: {
                beginAtZero: true
            }
        },
        responsive: true,
	    plugins: {
	      legend: {
	        position: 'top',
	      },
	      title: {
	        display: true,
	        text: 'CPU Usage Line Chart'
	      }
	    }
	  };

const data = {
  labels: labels,
  datasets: [
    {
      label: 'CPU Usage',
      data: [12, 19, 3, 5, 2, 3],
      borderColor: 'rgba(255, 99, 132, 1)',
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
    }
  ]
};

const config = {
		  type: 'line',
		  data: data,
		  options: options,
		};

var cpuChart;

const initChart = () => {
	const ctx = document.getElementById('cpuChart').getContext('2d');
	cpuChart= new Chart(ctx, config);
}

const updateChart = (data) => {
	//myChart.data.datasets[0].data = [1,2,3,4,5,6,7,8,9,10,11,12,13];
	cpuChart.data.datasets[0].data = data;
	cpuChart.update();
}

</script>
<body onLoad="initChart()">
	<h1>Stomp Example Page</h1>
	
	<div class="well">
       <input type="text" id="msg" value="test message!!!" class="form-control" />
       <button id="btnSend" class="btn btn-primary">Send Message</button>
       
       <button id="btnRecv" class="btn btn-primary">Recv Message</button>
    </div>
	
    <canvas id="cpuChart" width="400" height="200"></canvas>
	
</body>
</html>