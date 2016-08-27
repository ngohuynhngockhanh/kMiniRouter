// script.js

    // create the module and name it kMiniRouter
        // also include ngRoute for all our routing needs
    var kMiniRouter = angular.module('kMiniRouter', ['ngRoute','btford.socket-io','pascalprecht.translate', 'angular-loading-bar', 'duScroll']);

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
		$translateProvider.translations('vi', {
			Dashboard:			'Bảng cài đặt',
			Survey:				'Tìm mạng',
			Fullname:			'Họ và tên',
			'Contact Page':		'Thông tin liên hệ',
			'About Page':		'Về dự án',
			'about_description':'Đây là project công cộng được tác giả sử dụng nhằm giúp các hệ thống máy tính nhúng dễ dàng kết nối vào wifi bằng cách sử dụng chip ralink.',
			'Wlan card':		'Chọn card wifi',
			'IP Address':		'Địa chỉ IP',
			'Wifi list':		'Danh sách mạng wifi',
			'About':			'Về dự án',
			'Contact':			'Liên hệ',
			'Survey':			'Lấy danh sách mạng wifi',
			'Channel':			'Kênh',
			'Signal percent':	'Tín hiệu mạng(%)',
			Action:				'Hành động',
			'Connect':			'Kết nối',
			'Try to connect':	'Thử kến nối đến mạng này',
			'SSID':				'Tên mạng wifi',
			'Password':			'Mật khẩu',
			'Security':			'Loại bảo mật wifi',
			'Submit':			'Xác nhận'
			
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
    kMiniRouter.controller('mainController', function($scope, mySocket, $rootScope, $translate, cfpLoadingBar, $document) {
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
			cfpLoadingBar.complete();
		});
		
		mySocket.on('connected', function() {
			$scope.accesspoint.status = 'OK';
			cfpLoadingBar.complete();
		});
		
		mySocket.on('cant_connect', function() {
			//alert("We can't Connect to AP");
			$scope.accesspoint.status = 'ERROR';
			cfpLoadingBar.complete();
		});
		
		
		//events
		$scope.survey = function() {
			console.log("Survey");
			mySocket.emit('survey');
			cfpLoadingBar.start();
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
			var someElement = angular.element(document.getElementById('form-accesspoint'));
			$document.scrollToElement(someElement, 0, 1500);
		}
		
		$scope.try_to_connect_with_full_info = function(accesspoint) {
			console.log("Try to connect!");
			cfpLoadingBar.set(0);
			cfpLoadingBar.start();
			mySocket.emit("tryToConnect", accesspoint);
			var someElement = angular.element(document.getElementById('accesspoint-status'));
			$document.scrollToElement(someElement, 60, 1500);
			setTimeout(function() {
				alert("Can't connect! Sorry, please check your ssid and password");
			}, info.connectionTimeout + 1000);
		}
		
		$scope.showPassword = function(password) {
			var l = password.length;
			password = substr(password, 0, 4);
			for (var i = 4; i < l; i++)
				password += '*';
			return password;
		}
    });

    kMiniRouter.controller('aboutController', function($scope) {
        //$scope.message = 'Look! I am an about page.';
    });

    kMiniRouter.controller('contactController', function($scope) {
        //$scope.message = 'Contact us! JK. This is just a demo.';
    });
	
	
	