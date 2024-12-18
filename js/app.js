;(function(window, angular) {

  'use strict';

  // Application module
	angular.module('app', [
		'ui.router',
    'app.common'
	])

	// Application config
	.config([
    '$stateProvider', 
    '$urlRouterProvider', 
    function($stateProvider, $urlRouterProvider) {

      $stateProvider
      .state('root', {
        abstract: true,
        views: {
          '@': {
            templateUrl: './html/root.html'
          },
          'header@root': {
            templateUrl: './html/header.html'
          },
          'footer@root': {
            templateUrl: './html/footer.html'
          }
        }
      })
			.state('home', {
				url: '/',
        parent: 'root',
				templateUrl: './html/home.html',
				controller: 'homeController'
			})
      .state('etlap', {
				url: '/etlap',
        parent: 'root',
				templateUrl: './html/etlap.html',
				controller: 'etlapController'
			})
      .state('foglalas', {
				url: '/',
        parent: 'root',
				templateUrl: './html/foglalas.html',
				controller: 'foglalasController'
			})
      .state('kapcsolat', {
				url: '/',
        parent: 'root',
				templateUrl: './html/kapcsolat.html',
				controller: 'kapcsolatController'
			})
      .state('rendeles', {
				url: '/',
        parent: 'root',
				templateUrl: './html/rendeles.html',
				controller: 'rendelesController'
			})
      .state('rolunk', {
				url: '/',
        parent: 'root',
				templateUrl: './html/rolunk.html',
				controller: 'rolunkController'
			})
      .state('login', {
				url: '/',
        parent: 'root',
				templateUrl: './html/login.html',
				controller: 'loginController'
			})
      .state('register', {
				url: '/',
        parent: 'root',
				templateUrl: './html/register.html',
				controller: 'registerController'
			})
      .state('profile', {
				url: '/',
        parent: 'root',
				templateUrl: './html/profile.html',
				controller: 'profileController'
			});
      
      $urlRouterProvider.otherwise('/');
    }
  ])

	// Application run
  .run([
    '$rootScope',
    function($rootScope) {
			console.log('Run...');
    }
  ])

  // Home controller
  .controller('homeController', [
    '$scope',
    function($scope) {
      console.log('Home controller...');
    }
  ])

  // Etlap controller
  .controller('etlapController', [
    '$scope',
    'http',
    function($scope, http) {
      http.request('./php/etlap.php')
      .then(response => {
        $scope.data = response;
        $scope.$applyAsync();
      })
      .catch(e => console.log(e));
    }
  ])

  // Foglalas controller
  .controller('foglalasController', [
    '$scope',
    function($scope) {
      console.log('Foglalas Controller...');
    }
  ])

  // Kapcsolat controller
  .controller('kapcsolatController', [
    '$scope',
    function($scope) {
      console.log('Kapcsolat Controller...');
    }
  ])

  // Rendeles controller
  .controller('rendelesController', [
    '$scope',
    function($scope) {
      console.log('Rendeles Controller...');
    }
  ])

  // Rolunk controller
  .controller('rolunkController', [
    '$scope',
    function($scope) {
      console.log('Rolunk Controller...');
    }
  ])

  // Foglalas controller
  .controller('foglalasController', [
    '$scope',
    function($scope) {
      console.log('Foglalas Controller...');
    }
  ])
  
  // Login controller
  .controller('Login Controller', [
    '$scope',
    function($scope) {
      console.log('Login Controller...');
    }
  ])
  
  // Register controller
  .controller('Register Controller', [
    '$scope',
    function($scope) {
      console.log('Register Controller...');
    }
  ])
  
  // Profile controller
  .controller('ProfileController', [
    '$scope',
    function($scope) {
      console.log('Profile Controller...');
    }
  ]);
	
})(window, angular);