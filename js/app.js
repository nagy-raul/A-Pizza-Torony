;(function(window, angular) {

  'use strict';

  // Application module
	angular.module('app', [
    'ui.router',
    'app.common',
    'app.message',
		'app.form',
    'app.user'
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
    'util',
    function ($rootScope, util) {

      $rootScope.user = {};
      $rootScope.user.id = util.localStorage('get', 'felhasznaloID');
      $rootScope.user.name = util.localStorage('get', 'nev');
      $rootScope.user.email = util.localStorage('get', 'email');
      $rootScope.user.code = util.localStorage('get', 'orszagkod');
      $rootScope.user.phone = util.localStorage('get', 'telszam');
      $rootScope.user.address = util.localStorage('get', 'lakcim');

      $rootScope.logOut = () => {
        if (confirm('Biztosan ki szeretne lépni a fiókjából?')) {
          $rootScope.user.id = null;
          $rootScope.user.name = null;
          $rootScope.user.email = null;
          $rootScope.user.code = null;
          $rootScope.user.phone = null;
          $rootScope.user.address = null;


          util.localStorage('remove', 'felhasznaloID');
          util.localStorage('remove', 'nev');
          util.localStorage('remove', 'email');
          util.localStorage('remove', 'orszagkod');
          util.localStorage('remove', 'telszam');
          util.localStorage('remove', 'lakcim');

          $rootScope.$applyAsync();

          alert(`Sikerült kijelentkezni!`);
        }
      }
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
    'form',
    'util',
    'http',
    function($scope, form, util, http) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          console.log('Kapcsolat Controller...');

          // Set focus
					form.focus();
        }
      };

      // Set scope methods
      $scope.methods = {

        // Contact
        contact: () => {

          // Remove unnecessary data
          let data  = util.objFilterByKeys($scope.model);

          console.log(data);

          // Http request
          http.request({
            method: "POST",
            url: "./php/contact.php",
            data: data
          })
          .then(response => {

            // Check response
            if (response.affectedRows) {

              // Initialize missing data
              data.kapcsolatID   = response.lastInsertId;

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
    '$rootScope',
    '$scope',
    'http',
    'util',
    function ($rootScope, $scope, http, util) {
      console.log('Login controller...');

      $scope.model = {email: util.localStorage('get', 'email')};

      $scope.login = () => {
        http.request({
          url: "./php/login.php",
          data: $scope.model
        })
        .then(response => {
          $rootScope.user.id = response.felhasznaloID;
          $rootScope.user.name = response.nev;
          $rootScope.user.email = $scope.model.email;

          util.localStorage('set', 'felhasznaloID', $rootScope.user.id);
          util.localStorage('set', 'nev', $rootScope.user.name);
          util.localStorage('set', 'email', $rootScope.user.email);

          alert(`Sikerült bejelentkezni! Felhasználó neve: ${$rootScope.user.name}`);
        })
        .catch(e => {
          $scope.model.password = null

          alert(e)
        })
      }

      $scope.cancel = () => {
        $scope.model.email = null
        $scope.model.password = null
      }

    }
  ])
  
   // Register controller
   .controller('registerController', [
    '$scope',
    'form',
    'util',
    'http',
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

              // Show result
              alert("Sikeres regisztráció!");
            } else alert("Sikertelen regisztráció!");
          })
          .catch(e => alert(e));
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