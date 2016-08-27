#!/usr/bin/env node



/*
* Constants
*/
//author constants
const VERSION = '1.0.5';


//config constants
const SERVER_PORT = 80;
const TEMPLATE_DIR = __dirname + '/templates';
const SAVED_FILE = __dirname + '/savedInfo';


//timer interval
const TIME_INTERVAL_1 = 3000; //refresh wlan config!
const TIME_INTERVAL_2 = 3000; //refresh IP
const TIME_INTERVAL_3 = 60000; //netstat -ntu
const TIME_INTERVAL_4 = 1000; // check card wifi alive
const MAX_RECONNECT = 1;

//timer timeout
const TIME_TIMEOUT_1 = 60000;//timeout connect to AP
/*
* Libraries
*/
var express = require('express');
var app = express();
var server = require('http').Server(app);
var io = require('socket.io')(server);
var exec = require('child_process').exec;
var spawn = require('child_process').spawn;
var sh 	= 	require('sync-exec');
var phpjs = require('phpjs');
var fs = require('fs');

exec("ifplugd", []);// run if it doesn't run



/*
* Global variables
*/

var info = {
	'version':		VERSION,
	'server_port':	SERVER_PORT,
	'cardWifiList': [],
	'currentCardWifi': "",
	'currentIP': '127.0.0.1',
	'isAP': false,
	'connectionTimeout': TIME_TIMEOUT_1,
	'wifiList': [],
	'currentAccessPointInfo': {},
	'technologies': [
		{
			Name: 'WPA2PSK/AES',
			NetworkType: 'Infra',
			AuthMode: 'WPA2PSK',
			EncrypType: 'AES',
			towTimesSSID: true,
			keywords: ['WPA2', 'AES']
		},
		{
			Name: 'WPA2PSK/TKIP',
			NetworkType: 'Infra',
			AuthMode: 'WPA2PSK',
			EncrypType: 'TKIP',
			towTimesSSID: true,
			keywords: ['WPA2', 'TKIP']
		},
		{
			Name: 'OPEN/NONE',
			NetworkType: 'Infra',
			AuthMode: 'OPEN',
			EncrypType: 'NONE',
			towTimesSSID: false,
			keywords: ['NONE']
		},
		{
			Name: 'SHARED/WEP',
			NetworkType: 'Infra',
			AuthMode: 'SHARED',
			EncrypType: 'WEP',
			DefaultKeyID: 1,
			Key1: 'password here',
			towTimesSSID: false,
			keywords: ['WEP']
		},
		{
			Name: 'WPAPSK/TKIP',
			NetworkType: 'Infra',
			AuthMode: 'WPAPSK',
			EncrypType: 'TKIP',
			towTimesSSID: true,
			keywords: ['WPA1', 'TKIP']
		},
		{
			Name: 'WPAPSK/AES',
			NetworkType: 'Infra',
			AuthMode: 'WPAPSK',
			EncrypType: 'AES',
			towTimesSSID: true,
			keywords: ['WPA1', 'AES']
		}
	]
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
	
	//try to connect to access point
	socket.on('tryToConnect', function(accesspoint) {
		tryToConnect(accesspoint, socket);
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


var sh_and_print = function(cmd) {
	console.log(cmd);
	return sh(cmd);
}


var tryToConnect = function (accesspoint, socket) {
	
	loadUSBWifi(); //first
	console.log(info.currentCardWifi);
	
	accesspoint.ssid = phpjs.trim(accesspoint.ssid);
	var security = info.technologies[accesspoint.security];
	console.log(security);
	if (!security) {
		if (socket) socket.emit('connection_rep', {status: false})
		console.log("Don't know this security technology");
		return;
	}
	
	console.log("Send information!")
	sh_and_print('sudo iwpriv ' + info.currentCardWifi + ' set NetworkType=' + security.NetworkType);
	sh_and_print('sudo iwpriv ' + info.currentCardWifi + ' set AuthMode=' + security.AuthMode);
	sh_and_print('sudo iwpriv ' + info.currentCardWifi + ' set EncrypType=' + security.EncrypType);
	if (security.DefaultKeyID)
		sh_and_print('sudo iwpriv ' + info.currentCardWifi + ' set DefaultKeyID=' + security.DefaultKeyID);
	
	if (security.Key1)
		sh_and_print('sudo iwpriv ' + info.currentCardWifi + ' set Key1="' + accesspoint.password + '"');
	
	if (security.DefaultKeyID)
		sh_and_print('sudo iwpriv ' + info.currentCardWifi + ' set DefaultKeyID=' + security.DefaultKeyID);
	
	sh_and_print('sudo iwpriv ' + info.currentCardWifi + ' set SSID="' + accesspoint.ssid + '"');
	
	if (!security.DefaultKeyID && security.AuthMode != 'OPEN')
		sh_and_print('sudo iwpriv ' + info.currentCardWifi + ' set WPAPSK="' + accesspoint.password + '"');
	
	if (security.towTimesSSID)
		sh_and_print('sudo iwpriv ' + info.currentCardWifi + ' set SSID="' + accesspoint.ssid + '"');
	
	fs.writeFileSync('/etc/wpa_supplicant/wpa_supplicant.conf', "network={\n\tssid=\""+accesspoint.ssid+"\"\n\tpsk=\""+accesspoint.password+"\"\n}\n");
	console.log(accesspoint);
	console.log("Setuped! Try to real connect!")
	console.log(sh_and_print('iwconfig ' + info.currentCardWifi + ' && ifdown ' + info.currentCardWifi + ' && killall dhclient').stdout);
	var tryHard = exec('dhclient ' + info.currentCardWifi + ' && echo "Finish dhclient"', []);
	var timeoutConnect = setTimeout(function() {
		if (socket)
			socket.emit("cant_connect");
		console.log("Can't connect, timeout!");
	}, TIME_TIMEOUT_1);
	tryHard.stdout.on('data', function (data) {
		console.log("try hard");
		var ip = getIPCurrentCardWifi();
		console.log(ip);
		if (ip && ip.length > 2) {
			if (socket)
				socket.emit("connected");
			saveAccesPoint(accesspoint);
			console.log("connected");
			clearTimeout(timeoutConnect);
		} 
		console.log(data);
	});
	
	
}

var saveAccesPoint = function(accesspoint) {
	info.currentAccessPointInfo = accesspoint;
	fs.writeFileSync(SAVED_FILE, JSON.stringify(accesspoint));
}



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
function getIPCurrentCardWifi() {
	var ip = sh("ifconfig | grep " + info.currentCardWifi + " -A1 |  awk '/inet addr/{print substr($2,6)}'").stdout;
	return ip;
}
setInterval(function() {
	var ip = getIPCurrentCardWifi();
	if (ip != info.currentIP) {
		info.currentIP = ip;
		io.sockets.emit('info', info);
	}
		
}, TIME_INTERVAL_2);


//run some startup scripts
function loadUSBWifi() {
	console.log(sh_and_print("cd " + __dirname + "/driver && bash ./load.sh").stdout);
} 



var loadAccessPoint = function() {
	console.log("Load Old Access Point");
	if (fs.existsSync(SAVED_FILE)) {
		console.log("deceted file");
		var accesspoint = JSON.parse(fs.readFileSync(SAVED_FILE));
		info.currentAccessPointInfo = accesspoint;
		console.log("read File");
		console.log(JSON.stringify(accesspoint, null, 4));
		if (accesspoint.ssid)
			tryToConnect(accesspoint);
	}
}
setTimeout(loadAccessPoint, 0);


var flag3_firstTime = true;
var check_interval_count = MAX_RECONNECT;
setInterval(function() {
	
	var card = sh("iwconfig " + info.currentCardWifi).stdout;
	if (phpjs.strstr(card, "Signal level")) {
		if (getIPCurrentCardWifi().length <= 2) {
			if (flag3_firstTime) {
				if (check_interval_count > 0) {
					console.log("Reconnect #" + check_interval_count);
					check_interval_count--;
					loadAccessPoint();
				}
				flag3_firstTime = false;
			}
		}
	} else {
		flag3_firstTime = true;
		check_interval_count = MAX_RECONNECT;
		console.log("Card doesn't exists");
		console.log("program down");
		process.exit()
	}

}, TIME_INTERVAL_4);



setInterval(function() {
	exec("netstat -ntu", []);
	
	var defaultGateWay = sh('route | grep default | grep 0.0.0.0').stdout;
	console.log(defaultGateWay);
	if (defaultGateWay.length < 10) {
		exec("dhclient " + info.currentCardWifi, [])
	}
}, TIME_INTERVAL_3);
