;(function(window, angular) {

  'use strict';

  // Application module
  angular.module('customAppModuleName', [
    'ui.router',
    'app.common'
  ])

	// Custum filter
  .filter('customFilterName', [
    () => {
      return (param) => {
        return param;
      }
    }
  ])

	// Custom factory
  .factory('customFactoryName', [
    function() {
      let a = [];
      return {
        get: () => {
          return a;
        },
        set: (v) => {
          if (Array.isArray(v))
            a = [...v];
        },
        remove: (index) => {
          if (Number.isInteger(index) && 
              index >= 0 && index < a.length)
            a.splice(index, 1);
        },
        add: (v) => {
          a.push(v);
        }
      }
    }
  ])

  /* Application config */
  .config([
    '$stateProvider', 
    '$urlRouterProvider', 
    function($stateProvider, $urlRouterProvider) {

      $stateProvider
      .state('root', {
        views: {
          '': {
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
			.state('page1', {
				url: '/page1',
        parent: 'root',
				templateUrl: './html/page1.html',
				controller: 'page1Controller'
			})
			.state('page2', {
				url: '/page2',
        parent: 'root',
				templateUrl: './html/page2.html',
				controller: 'page2Controller',
				params: {
					data: null
				}
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

	// Page1 controller
  .controller('page1Controller', [
    '$scope',
    function($scope) {
      console.log('Page1 controller...');
    }
  ])

	// Page2 controller
  .controller('page2Controller', [
    '$state',
    '$scope',
		'$stateParams',
    'customFactoryName',
    function($state, $scope, $stateParams, customFactoryName) {

			// Get/Check parameters
      $scope.data = $stateParams.data;
      if (!$scope.data) {
        $state.go('home');
        return;
      }

      // Use factory
      customFactoryName.set([55,44,99]);
      let a = customFactoryName.get();
      customFactoryName.add(100);
      customFactoryName.remove(2);
      let b = customFactoryName.get();
      console.log(a, b);
      console.log('Page2 controller...');
    }
  ])

	// Custom directive 1
  .directive('customDirectiveName1', [
    () => {
      return {
        link: (scope, iElement, iAttrs) => {
          console.log('Link...')
        }
      };
  }])

	// Custom directive 2
  // Scope bindings:
  // < one-way binding      <? optional     
  // = two-way binding      =? optional
  // & function binding     &? optional
  // @ pass only strings    @? optional
	.directive('customDirectiveName2', [
    '$timeout', 
    ($timeout) => {

			// Controller
			let controller = [
				'$scope', 
				($scope) => {
					console.log('controller...');
				}
			];

      return {
				restrict: 'EA',
				replace: true,
				scope: {},
				controller: controller,
				template:`<h1></h1>`,

				// Compile 
				compile: () => {
					
					console.log('Compile...');
					return {
						
						// Pre-link
						pre: (scope, iElement, iAttrs) => {
							console.log('Pre-link...');
						},

						// Post-link
						post: (scope, iElement, iAttrs) => {
							console.log('Post-link...');
						}
					};
				}
			};
		}
	]);

})(window, angular);