// script.js

    // create the module and name it kMiniRouter
        // also include ngRoute for all our routing needs
    var kMiniRouter = angular.module('kMiniRouter', ['ngRoute','btford.socket-io','pascalprecht.translate']);

    // configure our routes
    kMiniRouter.config(function($routeProvider) {
        $routeProvider

            // route for the home page
            .when('/', {
                templateUrl : '/templates/home.html',
                controller  : 'mainController'
            })

            // route for the about page
            .when('/about', {
                templateUrl : '/templates/about.html',
                controller  : 'aboutController'
            })

            // route for the contact page
            .when('/contact', {
                templateUrl : '/templates/contact.html',
                controller  : 'contactController'
            });
			
		
    }).config(function ($translateProvider) {
		$translateProvider.translations('en', {
			TITLE: 'Hello',
			FOO: 'This is a paragraph.',
			BUTTON_LANG_EN: 'english',
			BUTTON_LANG_DE: 'german'
		});
		$translateProvider.translations('vi', {
			Dashboard: 'Bảng cài đặt',
			Survey:		'Tìm mạng'
		});
		$translateProvider.preferredLanguage('vi');
	}).
	factory('mySocket', function (socketFactory) {
		var myIoSocket = io.connect('/');

		mySocket = socketFactory({
			ioSocket: myIoSocket
		});

		return mySocket;
	});
	
	kMiniRouter.run(function($rootScope) {
		$rootScope.info = {};
		$rootScope.surveyTable = [];
	});

    // create the controller and inject Angular's $scope
    kMiniRouter.controller('mainController', function($scope, mySocket, $rootScope, $translate) {
        // create a message to display in our view
        $scope.message = 'Everyone come and see how good I look!';
		
		$scope.accesspoint = {security: 0};
		
		mySocket.on('info', function (info) {
			$rootScope.info = info;
			$rootScope.surveyTable = info.wifiList;
		});
		
		mySocket.on('survey_result', function (survey_result) {
			$rootScope.info.wifiList = survey_result;
			$rootScope.surveyTable = survey_result;
		});
		
		mySocket.on('connected', function() {
			alert("Connected to AP");
		});
		
		mySocket.on('cant_connect', function() {
			alert("We can't Connect to AP");
		});
		
		
		//events
		$scope.survey = function() {
			console.log("Survey");
			mySocket.emit('survey');
		}
		
		$scope.updateCardWifi = function(cardName) {
			console.log("Card name");
			mySocket.emit("updateCardWifi", cardName);
		}
		
		$scope.tryToConnectToSSID = function(ssidInfo) {
			var ssidInfoSecurityToSelect = function(security) {
				var info = $rootScope.info;
				for (var i = 0; i < info.technologies.length; i++) {
					var technology = info.technologies[i];
					var isOk = true;
					for (var j = 0; j < technology.keywords.length; j++) {
						var keyword = technology.keywords[j];
						if (security.indexOf(keyword) == -1) {
							isOk = false;
							break;
						}
					}
					if (isOk)
						return i;
				}
			}
			$scope.accesspoint.ssid = ssidInfo.ssid;
			$scope.accesspoint.security = ssidInfoSecurityToSelect(ssidInfo.security);
		}
		
		$scope.try_to_connect_with_full_info = function(accesspoint) {
			console.log("Try to connect!")
			mySocket.emit("tryToConnect", accesspoint);
			setTimeout(function() {
				alert("Can't connect! Sorry, please check your ssid and password");
			}, info.connectionTimeout + 1000);
		}
    });

    kMiniRouter.controller('aboutController', function($scope) {
        $scope.message = 'Look! I am an about page.';
    });

    kMiniRouter.controller('contactController', function($scope) {
        $scope.message = 'Contact us! JK. This is just a demo.';
    });
	
	
	