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

  .run([
    '$rootScope',
    '$state',
    '$timeout',
    function ($rootScope, $state, $timeout) {
  
      // Initialize cart as an empty array
      $rootScope.cart = [];
  
      $rootScope.user = {};
      $rootScope.user.id = localStorage.getItem('id');
      $rootScope.user.name = localStorage.getItem('name');
      $rootScope.user.email = localStorage.getItem('email');
      $rootScope.user.countryCode = localStorage.getItem('countryCode');
      $rootScope.user.phone = localStorage.getItem('phone');
      $rootScope.user.address = localStorage.getItem('address');
  
      // Function to initialize tooltips
      function initTooltips() {
        $timeout(() => {
          let tooltips = document.querySelectorAll('[data-bs-toggle="tooltip"]');
          if (tooltips.length) {
            tooltips.forEach(e => new bootstrap.Tooltip(e));
          }
        }, 500); // Slight delay to ensure DOM update
      }
  
      // Run tooltip initialization on route change
      $rootScope.$on('$viewContentLoaded', function() {
        initTooltips();
      });
  
      // Also initialize tooltips manually when needed
      initTooltips();
  
      $rootScope.logOut = () => {
        if (confirm('Biztosan ki szeretne lépni a fiókjából?')) {
          $rootScope.cart = [];
  
          $rootScope.user.id = null;
          $rootScope.user.name = null;
          $rootScope.user.email = null;
          $rootScope.user.countryCode = null;
          $rootScope.user.phone = null;
          $rootScope.user.address = null;
  
          localStorage.removeItem('id');
          localStorage.removeItem('name');
          localStorage.removeItem('email');
          localStorage.removeItem('countryCode');
          localStorage.removeItem('phone');
          localStorage.removeItem('address');
  
          $rootScope.$applyAsync();
          $state.go('home');
          alert(`Sikerült kijelentkezni!`);
        }
      };

      $rootScope.setToLocalStorage = (id, value) => {
        localStorage.setItem(id, JSON.stringify(value));
      }

      $rootScope.removeKeysFromObject = (obj, keysToRemove = []) => {
        let newObj = { ...obj };
        keysToRemove.forEach(key => delete newObj[key]);
        return newObj;
      }

      $rootScope.objMerge = (obj1, obj2, overwrite = false) => {
        let newObj = { ...obj1 };
        for (let key in obj2) {
          if (overwrite || newObj[key] === undefined) {
            newObj[key] = obj2[key];
          }
        }
        return newObj;
      }

      // Read initial language from the HTML lang attribute
      const htmlElement = document.documentElement;
      $rootScope.language = htmlElement.getAttribute('lang') || 'hu';
      
      console.log($rootScope.language);

      // Load the selected language file
      $rootScope.loadLanguage = (lang) => {
        fetch(`./lang/${lang}.json`)
        .then(response => {
          if (!response.ok) {
            throw new Error(`Hiba a nyelvi fájl betöltésekor: ${response.statusText}`);
          }
          return response.json();
        })
        .then(data => {
          $rootScope.translations = data;
          $rootScope.language = lang;
          document.title = data.title;
          $rootScope.$applyAsync();

          htmlElement.setAttribute('lang', lang); // Update the lang attribute
          
        })
        .catch(error => {
          console.error(error);
          alert('Nem sikerült betölteni a nyelvi fájlt.');
        });
      };

      // Load the default language at startup
      $rootScope.loadLanguage($rootScope.language);

      $rootScope.isActive = function(viewLocation) {
        return $state.includes(viewLocation);
      };
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
    '$rootScope', 
    'http',
    function($scope, $rootScope, http) {
      console.log('Etlap controller...');
        
      http.request('./php/etlap.php')
      .then(response => {
          $scope.data = response;
          $scope.$applyAsync();
      })
      .catch(e => alert(e));

      // Function to add items to cart
      $scope.methods = {
          addToCart: (name, description, price) => {
              $rootScope.cart.push({
                  name: name,
                  description: description,
                  price: price
              });
              console.log("Cart updated:", $rootScope.cart);
              alert(`${name} hozzáadva a kosárhoz!`);
          }
      };
    }
  ])

  // Foglalas controller
  .controller('foglalasController', [
    '$rootScope',
    '$scope',
    '$state',
    'http',
    function($rootScope, $scope, $state, http) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          console.log('Foglalas Controller...');

          /*
          $scope.model = {
            name: localStorage.getItem('name'),
            email: localStorage.getItem('email'),
            countryCode: localStorage.getItem('countryCode'),
            phone: localStorage.getItem('phone')
          };
          */
          let now = new Date();
          let year = now.getFullYear();
          let month = String(now.getMonth() + 1).padStart(2, '0');
          let day = String(now.getDate()).padStart(2, '0');
          let lejarta = document.getElementById("booking-datum");
          lejarta.min = `${year}-${month}-${day}`;
          // Set focus
          window.focus();

        }
      };

      // Set scope methods
      $scope.methods = {

        // Book
        booking: () => {

          console.log("book")

          // Remove unnecessary data
          let data  = Object.assign({}, $scope.model);

          console.log(data);

          // Http request
          http.request({
            method: "POST", 
            url: "./php/booking.php", 
            data: data
          })
          .then(response => {

            // Check response
            if (response.affectedRows) {

              // Show result
              alert("Foglalás elküldve!");

              $state.go('home')

            } else alert("A foglalást nem sikerült elküldeni!");
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

  // Kapcsolat controller
  .controller('kapcsolatController', [
    '$rootScope',
    '$scope',
    '$state',
    'http',
    function($rootScope, $scope, $state, http) {

      // Set local methods
      let methods = {

        // Initialize
        init: () => {

          console.log('Kapcsolat Controller...');

          $scope.model = {
            name: localStorage.getItem('name'),
            email: localStorage.getItem('email'),
            countryCode: localStorage.getItem('countryCode'),
            phone: localStorage.getItem('phone')
          };

          // Set focus
          window.focus();

        }
      };

      // Set scope methods
      $scope.methods = {

        // Contact
        contact: () => {

          // Remove unnecessary data
          let data  = Object.assign({}, $scope.model);

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

  .controller('rendelesController', [
    '$rootScope',
    '$scope',
    '$state',
    'http',
    function($rootScope, $scope, $state, http) {
  
      // Initialize the total amount variable
      $scope.osszeg = 0;
  
      // Function to calculate total price
      $scope.calculateTotal = function() {
        $scope.osszeg = $scope.cart.reduce((total, item) => total + item.price, 0);
      };
  
      // Watch for cart changes and update the total
      $scope.$watch('cart', function(newCart) {
        $scope.calculateTotal();
      }, true);
  
      // Set local methods
      let methods = {
        init: () => {
          console.log('Rendeles Controller...');
          $scope.model = {
            name: localStorage.getItem('name'),
            email: localStorage.getItem('email'),
            address: localStorage.getItem('address')
          };

          // Set focus
          window.focus();


          let now = new Date();
          let year = now.getFullYear();
          let month = String(now.getMonth() + 1).padStart(2, '0');
          let day = String(now.getDate()).padStart(2, '0');
          let lejarta = document.getElementById("cc-expiration");
          lejarta.min = `${year}-${month}-${day}`;
        }
      };
  
      // Set scope methods
      $scope.methods = {
        order: () => {
          let data = Object.assign({}, $scope.model);
          console.log(data);
  
          http.request({
            method: "POST", 
            url: "./php/order.php", 
            data: data
          })
          .then(response => {
            if (response.affectedRows) {
              alert("Rendelés elküldve!");
              $state.go('home');
              $rootScope.cart = [];
              $scope.osszeg = 0; // Reset total after order
            } else {
              alert("A rendelést nem sikerült elküldeni!");
            }
          })
          .catch(e => alert(e));
        },
        cancel: () => {
          $state.go('home');
        }
      };
  
      // Initialize
      methods.init();
    }
  ])
  

  // Rolunk controller
  .controller('rolunkController', [
    '$scope',
    function($scope) {
      console.log('Rolunk Controller...');
    }
  ])
  
  // Login controller
  .controller('loginController', [
    '$rootScope',
    '$scope',
    '$state',
    'http',
    function ($rootScope, $scope, $state, http) {
      console.log('Login controller...');

      $scope.model = {email: localStorage.getItem('email')};

      $scope.login = () => {


        http.request({
          url: "./php/login.php", 
          data: $scope.model
        })
        .then(response => {
          $rootScope.user.id = response.felhasznaloID;
          $rootScope.user.name = response.nev;
          $rootScope.user.email = $scope.model.email;
          $rootScope.user.countryCode = response.orszagkod;
          $rootScope.user.phone = response.telszam;
          $rootScope.user.address = response.lakcim;

          $rootScope.setToLocalStorage('id', $rootScope.user.id);
          $rootScope.setToLocalStorage('name', $rootScope.user.name);
          $rootScope.setToLocalStorage('email', $rootScope.user.email);
          $rootScope.setToLocalStorage('countryCode', $rootScope.user.countryCode);
          $rootScope.setToLocalStorage('phone', $rootScope.user.phone);
          $rootScope.setToLocalStorage('address', $rootScope.user.address);

          alert(`Sikerült bejelentkezni!
            Felhasználói adatok:
            ID: ${$rootScope.user.id}
            Név: ${$rootScope.user.name}
            Email: ${$rootScope.user.email}
            Országkód: ${$rootScope.user.countryCode}
            Telefon: ${$rootScope.user.phone}
            Lakcím: ${$rootScope.user.address}`);

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
    'http',
    function($rootScope, $scope, $state, http) {

      console.log('Register Controller...');


      // Register method
      $scope.register = () => {

          // Remove unnecessary data
          let data  = $rootScope.removeKeysFromObject($scope.model, [
                        'showPassword', 
                        'emailConfirm', 
                        'passwordConfirm'
                      ]);

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
              $rootScope.user.name = $scope.model.name;
              $rootScope.user.email = $scope.model.email;
              $rootScope.user.countryCode = $scope.model.countyCode;
              $rootScope.user.phone = $scope.model.phone;
              $rootScope.user.address = $scope.model.address;
    
              $rootScope.setToLocalStorage('id', $rootScope.user.id);
              $rootScope.setToLocalStorage('name', $rootScope.user.name);
              $rootScope.setToLocalStorage('email', $rootScope.user.email);
              $rootScope.setToLocalStorage('countryCode', $rootScope.user.countryCode);
              $rootScope.setToLocalStorage('phone', $rootScope.user.phone);
              $rootScope.setToLocalStorage('address', $rootScope.user.address);

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
    '$rootScope',
    '$scope',
    '$state',
    'http',
    '$q',
    function($rootScope, $scope, $state, http, $q) {

      console.log('Profile  Controller...');


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
          $scope.model = JSON.parse(JSON.stringify($rootScope.user));

          // Get rest data
          methods.get();
        },

        // Get data
        get: () => {

          // Http request
          http.request({
            url: "./php/profile_get.php",
            data: {
              id: $rootScope.user.id
            }
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

            // Create new deferred object
            let set = $q.defer();

            // Correct way to resolve the promise
            set.resolve(); 

            // Wait for set completed
            set.promise.then(() => {
              
              // Merge model with response, save start model properties
              $scope.model = { ...$scope.model, ...response };
              $scope.helper.modelStart = JSON.parse(JSON.stringify($scope.model));

              // Apply change, and resolve outer promise
              $scope.$applyAsync();
              resolve();
            });
          });
        },

        // Events
        events: () => {

					// Watch user profile changed
					$scope.$watch('model', (newValue, oldValue) => {
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
          let data = $scope.model

          // Set user identifier
          data.id = $rootScope.user.id;

          console.log(data)

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
              $rootScope.user = $rootScope.objMerge($rootScope.user, data, true);

              // Update local storage
              $rootScope.setToLocalStorage('name', $rootScope.user.name);
              $rootScope.setToLocalStorage('countryCode', $rootScope.user.countryCode);
              $rootScope.setToLocalStorage('phone', $rootScope.user.phone);
              $rootScope.setToLocalStorage('address', $rootScope.user.address);


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

    }
  ]);
})(window, angular);