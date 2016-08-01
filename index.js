#!/usr/bin/env node

/*
* Constants
*/
//author constants
const VERSION = '1.0.0';


//config constants
const SERVER_PORT = 80;
const TEMPLATE_DIR = __dirname + '/templates';


//timer interval
const TIME_INTERVAL_1 = 3000; //refresh wlan config!
const TIME_INTERVAL_2 = 3000; //refrest IP

//timer timeout

/*
* Libraries
*/
var express = require('express');
var app = express();
var server = require('http').Server(app);
var io = require('socket.io')(server);
var exec = require('child_process').exec;
var sh 	= 	require('sync-exec');
var phpjs = require('phpjs');
/*
* Global variables
*/

var info = {
	'version':		VERSION,
	'server_port':	SERVER_PORT,
	'current_mode':	DEFAULT_MODE,
	'cardWifiList': [],
	'currentCardWifi': "",
	'currentIP': '127.0.0.1',
	'isAP': false,
	'wifiList': []
} //current info


//let listen!
server.listen(SERVER_PORT);


//static web
app.use('/templates', express.static(TEMPLATE_DIR));

//start the app
app.get('/', function (req, res) {
	res.sendFile(TEMPLATE_DIR + '/index.html');
});


//new socket connection
io.on('connection', function (socket) {
	console.log('new connection');
	socket.emit('info', info);
	socket.on('getInfo', function() {
		socket.emit('info', info);
	});
	socket.on('survey', function() {
		try_survey(socket);
	});
	socket.on('updateCardWifi', function(cardName) {
		if (info.cardWifiList.indexOf(cardName) != -1) {
			console.log("update card wifi");
			info.currentCardWifi = cardName;
			info.wifiList = [];
			io.sockets.emit('info', info);
		} else 
			console.log("Can't find that card!");
	});
	socket.on('my other event', function (data) {
		console.log(data);
	});
});


//auto survey
var surveyFlag = true;
function try_survey(socket) {
	if (!surveyFlag)
		return repSurvey(socket);
	console.log("Try to survey");
	sh('sudo iwpriv ' + info.currentCardWifi + ' set SiteSurvey=1');
	  
	var survey = exec('iwpriv ' + info.currentCardWifi + ' get_site_survey | awk \'{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$12"\t"$13"\t"$14}\'', []);
	
	survey.stdout.on('data', function (data) {
		console.log("Survey");
		console.log(data);
		var surveyResult = formatSurveyData(data);
		info.wifiList = surveyResult;
		repSurvey(socket);
		surveyFlag = true;
	});
}

function repSurvey(socket) {
	console.log("Reply Survey");
	socket.emit('survey_result', info.wifiList);
}

function formatSurveyData(data) {
	console.log("Format Survey Data");
	var ret = [];
	var lines = phpjs.explode("\n", data);
	if (lines.length > 4) {
		for (var i = 2; i < lines.length - 2; i++) {
			var col = phpjs.explode("\t", lines[i]);
			var channel = col[0];
			var ssid = "";
			var j = 1;
			for (; j < col.length; j++)
				if (phpjs.explode(":", col[j]).length > 5)
					break;
				else
					ssid += col[j] + ' ';
			if (j + 3 < col.length)
				ret[i - 2] = {
					channel: channel,
					ssid: ssid,
					bssid: col[j],
					security: col[j + 1],
					signal: col[j + 2],
					mode: col[j + 3]
					
				};
		}
	}
	
	console.log("Formated Data");
	console.log(JSON.stringify(ret, null, 4));
	return ret;
}


//update wlan current list
function updateWlanList(firstTime) {
	var __cardWifiList = phpjs.explode("\n", sh("iwconfig | grep ESSID | awk '{print $1}'").stdout);
	if (firstTime) {
		var currentCardWifi = (__cardWifiList && __cardWifiList.length > 0) ? __cardWifiList[0] : 'wlan0';
		info.currentCardWifi = currentCardWifi;
	}
	info.cardWifiList = __cardWifiList;	
}
updateWlanList(true);
setInterval(function() {
	updateWlanList();
}, TIME_INTERVAL_1);

//refresh Ip
setInterval(function() {
	var ip = sh("ifconfig | grep ra0 -A1 |  awk '/inet addr/{print substr($2,6)}'").stdout;
	if (ip != info.currentIP) {
		info.currentIP = ip;
		io.sockets.emit('info', info);
	}
		
}, TIME_INTERVAL_2);