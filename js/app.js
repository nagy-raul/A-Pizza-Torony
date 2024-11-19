;(function(window, angular) {

  'use strict';

  // Application module
	angular.module('app', [
		'ui.router'
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
				url: '/',
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
      .state('asztalfoglalas', {
				url: '/',
        parent: 'root',
				templateUrl: './htmlasztalfoglalas.html',
				controller: 'asztalfoglalasController'
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

  // Home controller
  .controller('etlapController', [
    '$scope',
    function($scope) {
      console.log('etlapController...');
    }
  ])

  // Home controller
  .controller('foglalasController', [
    '$scope',
    function($scope) {
      console.log('foglalasController...');
    }
  ])

  // Home controller
  .controller('kapcsolatController', [
    '$scope',
    function($scope) {
      console.log('kapcsolatController...');
    }
  ])

  // Home controller
  .controller('rendelesController', [
    '$scope',
    function($scope) {
      console.log('rendelesController...');
    }
  ])

  // Home controller
  .controller('rolunkController', [
    '$scope',
    function($scope) {
      console.log('rolunkController...');
    }
  ])

  // Home controller
  .controller('asztalfoglalasController', [
    '$scope',
    function($scope) {
      console.log('asztalfoglalasController...');
    }
  ]);
	
})(window, angular);