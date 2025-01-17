;(function(window, angular) {

  'use strict';

  // Application module
	angular.module('app', [
    'ui.router',
    'app.common',
    'app.message',
    'app.user',
		'app.form'
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
				url: '/foglalas',
        parent: 'root',
				templateUrl: './html/foglalas.html',
				controller: 'foglalasController'
			})
      .state('kapcsolat', {
				url: '/kapcsolat',
        parent: 'root',
				templateUrl: './html/kapcsolat.html',
				controller: 'kapcsolatController'
			})
      .state('rendeles', {
				url: '/rendeles',
        parent: 'root',
				templateUrl: './html/rendeles.html',
				controller: 'rendelesController'
			})
      .state('rolunk', {
				url: '/rolunk',
        parent: 'root',
				templateUrl: './html/rolunk.html',
				controller: 'rolunkController'
			})
      .state('login', {
				url: '/login',
        parent: 'root',
				templateUrl: './html/login.html',
				controller: 'loginController'
			})
      .state('register', {
				url: '/register',
        parent: 'root',
				templateUrl: './html/register.html',
				controller: 'registerController'
			})
      .state('profile', {
				url: '/profile',
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
  .controller('loginController', [
    '$scope',
    'form',
    'user',
    'util',
    'http',
    'trans',
    'msg',
    function($scope, form, util, http, trans, msg) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          console.log('Login Controller...');

          // Set email address from local storige if exist
          $scope.model = {email: util.localStorage('get', 'email')};

          // Set focus
					form.focus();
        }
      };

      // Set scope methods
      $scope.methods = {

        // Login
        login: () => {

          // Set request
          http.request({
            url: "./php/login.php",
            data: util.objFilterByKeys($scope.model, 'showPassword', false)
          })
          .then(response => {
            response.email = $scope.model.email;
            util.localStorage('set', 'email', response.email);
            trans.preventState();
          })
          .catch(e => {
            $scope.model.password = null;
            msg.error(e);
          });
        },

        // Cancel
        cancel: () => {
          console.log("cancel");
        }
      };

      // Initialize
      methods.init();
    }
  ])
  
   // Register controller
   .controller('registerController', [
    '$scope',
    'form',
    'util',
    'http',
    'user',
    function($scope, form, util, http) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          console.log('Register Controller...');

          // Set focus
					form.focus();
        }
      };

      // Set scope methods
      $scope.methods = {

        // Register
        register: () => {

          // Remove unnecessary data
          let data  = util.objFilterByKeys($scope.model, [
                        'showPassword', 
                        'emailConfirm',
                        'passwordConfirm'
                      ], false);

          console.log(data);

          // Http request
          http.request({
            method: "POST",
            url: "./php/register.php",
            data: data
          })
          .then(response => {

            // Check response
            if (response.affectedRows) {

              // Remove unnecessary data
              delete data.password;

              // Initialize missing data
              data.id   = response.lastInsertId;

              // Set save email address
              util.localStorage('set', 'email', data.email);

              // Show result
              alert("Sikeres regisztráció!");
            } else alert("Sikertelen regisztráció!");
          })
          .catch(e => console.log(e));
        },

        // Cancel
        cancel: () => {
          console.log("cancel")
        }
      };

      // Initialize
      methods.init();
    }
  ])
  
  // Profile controller
  .controller('profileController', [
    '$scope',
    function($scope) {
      console.log('Profile Controller...');
    }
  ]);
	
})(window, angular);