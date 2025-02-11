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
      $rootScope.user.id = util.localStorage('get', 'id');
      $rootScope.user.name = util.localStorage('get', 'name');
      $rootScope.user.email = util.localStorage('get', 'email');
      $rootScope.user.countryCode = util.localStorage('get', 'countryCode');
      $rootScope.user.phone = util.localStorage('get', 'phone');
      $rootScope.user.address = util.localStorage('get', 'address');

      $rootScope.logOut = () => {
        if (confirm('Biztosan ki szeretne lépni a fiókjából?')) {
          $rootScope.user.id = null;
          $rootScope.user.name = null;
          $rootScope.user.email = null;
          $rootScope.user.countryCode = null;
          $rootScope.user.phone = null;
          $rootScope.user.address = null;


          util.localStorage('remove', 'id');
          util.localStorage('remove', 'name');
          util.localStorage('remove', 'email');
          util.localStorage('remove', 'countryCode');
          util.localStorage('remove', 'phone');
          util.localStorage('remove', 'address');

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
    '$state',
    'form',
    'util',
    'http',
    function($scope, $state, form, util, http) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          console.log('Kapcsolat Controller...');

          $scope.model = {
            name: util.localStorage('get', 'name'),
            email: util.localStorage('get', 'email'),
            countryCode: util.localStorage('get', 'countryCode'),
            phone: util.localStorage('get', 'phone')
          };

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

              // Show result
              alert("Üzenet elküldve!");

              $state.go('home')

            } else alert("Az üzenetetet nem sikerült elküldeni!");
          })
          .catch(e => alert(e));
        },

        // Cancel
        cancel: () => {
          $state.go('home')
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
    '$state',
    'http',
    'util',
    function ($rootScope, $scope, $state, http, util) {
      console.log('Login controller...');

      $scope.model = {email: util.localStorage('get', 'email')};

      $scope.login = () => {
        http.request({
          url: "./php/login.php",
          data: $scope.model
        })
        .then(response => {
          $rootScope.user.id = response.id;
          $rootScope.user.name = response.nev;
          $rootScope.user.email = $scope.model.email;
          $rootScope.user.countryCode = response.orszagkod;
          $rootScope.user.phone = response.telszam;
          $rootScope.user.address = response.lakcim;

          util.localStorage('set', 'id', $rootScope.user.id);
          util.localStorage('set', 'name', $rootScope.user.name);
          util.localStorage('set', 'email', $rootScope.user.email);
          util.localStorage('set', 'countryCode', $rootScope.user.countryCode);
          util.localStorage('set', 'phone', $rootScope.user.phone);
          util.localStorage('set', 'address', $rootScope.user.address);

          alert(`Sikerült bejelentkezni! Felhasználó neve: ${$rootScope.user.name}`);

          $state.go('home')
        })
        .catch(e => {
          $scope.model.password = null

          alert(e)
        })
      }

      $scope.cancel = () => {
        $state.go('home')
      }

    }
  ])
  
   // Register controller
   .controller('registerController', [
    '$rootScope',
    '$scope',
    '$state',
    'util',
    'http',
    function($rootScope, $scope, $state, util, http) {

      console.log('Register Controller...');


      // Register method
      $scope.register = () => {

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

              $rootScope.user.id = response.lastInsertId;
              $rootScope.user.name = $scope.model.nev;
              $rootScope.user.email = $scope.model.email;
              $rootScope.user.countryCode = $scope.model.countyCode;
              $rootScope.user.phone = $scope.model.phone;
              $rootScope.user.address = $scope.model.address;
    
              util.localStorage('set', 'id', $rootScope.user.id);
              util.localStorage('set', 'name', $rootScope.user.name);
              util.localStorage('set', 'email', $rootScope.user.email);
              util.localStorage('set', 'countryCode', $rootScope.user.countryCode);
              util.localStorage('set', 'phone', $rootScope.user.phone);
              util.localStorage('set', 'address', $rootScope.user.address);

              // Show result
              alert("Sikeres regisztráció!");

              $state.go('home')
            } else alert("Sikertelen regisztráció!");
          })
          .catch(e => alert(e));
        },

        // Cancel
        $scope.cancel = () => {
          $state.go('home')
        }


    }
  ])
  
  // Profile controller
  .controller('profileController', [
    /*
    '$rootScope',
    '$scope',
    '$state',
    'util',
    'http',
    */
    function(/*$rootScope, $scope, $state, util, http*/) {

      console.log('Profile  Controller...');


      /*
      // Set helper
			$scope.helper = {
        modelStart: null,
        isModified: false			
      }

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          // Set model from rootscope model
          $scope.model = util.objMerge({}, $rootScope.user);

          // Get rest data
          methods.get();
        },

        // Get data
        get: () => {

          // Http request
          http.request({
            url: "./php/profile_get.php",
            data: {id: $rootScope.user.id}
          })
          .then(response => {

            // Set model
            methods.set(response).then(() => {

              // Set events
              methods.events();

            });
          })
          .catch(e => alert(e));
        },

        // Set model
        set: (response) => {

          // Create promise
          return new Promise((resolve) => {

            // Create new deffered object
            let set = util.deferredObj();

            // Whait for set completed
            set.completed.then(() => {

              // Merge model with response, save start model properties,
              $scope.model = util.objMerge($scope.model, response);
              $scope.helper.modelStart = util.objMerge({}, $scope.model);

              // Apply change, and resolve
              $scope.$applyAsync();
              resolve();
            })
          });
        },

        // Events
        events: () => {

					// Watch user profile changed
					$scope.$watch('model', (newValue) => {
						if (newValue) {
							$scope.helper.isModified = 
                  !angular.equals(newValue, $scope.helper.modelStart);
						}
					}, true);
        }
      };

      // Set scope methods
      $scope.methods = {

        // Save
        save: () => {

          // Get only data, that has changed
          let data = util.objDifference(
            $scope.helper.modelStart, 
            $scope.model
          );

          // Set user identifier
          data.id = $rootScope.user.id;

          console.log(data);

          // Http request
          http.request({
            method: "POST",
            url: "./php/profile_set.php",
            data: data
          })
          .then(response => {

            // Check response
            if (response.affectedRows) {

              // Update user properties
              $rootScope.user = util.objMerge($rootScope.user, data, true);

              // Show result
              alert("Az adatokat sikerült módosítani!");

              $state.go('home')

            } else alert("Az adatokat nem sikerült módosítani!");
          })
          .catch(e => alert(e));
        },

        // Cancel
        cancel: () => $state.go('home')
      };

      // Initialize
      methods.init();

      */
    }
  ]);
	
})(window, angular);