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
		
		mySocket.on('info', function (info) {
			$rootScope.info = info;
			$rootScope.surveyTable = info.wifiList;
		});
		
		mySocket.on('survey_result', function (survey_result) {
			$rootScope.info.wifiList = survey_result;
			$rootScope.surveyTable = survey_result;
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
    });

    kMiniRouter.controller('aboutController', function($scope) {
        $scope.message = 'Look! I am an about page.';
    });

    kMiniRouter.controller('contactController', function($scope) {
        $scope.message = 'Contact us! JK. This is just a demo.';
    });
	
	
	