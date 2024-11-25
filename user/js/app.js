;(function(window, angular) {

  'use strict';

  // Application module
	angular.module('app', [
		'app.common',
		'app.form'
	])

	// Application controller
	.controller('appController', [
		'$rootScope',
		'$scope',
		'$timeout',
		'util',
		($rootScope, $scope, $timeout, util) => {

			// Set model, tab idenifier, and profile data is modified
			$scope.model			= {login:null, register:null, profile:null};
			$scope.tabID 			= Object.keys($scope.model)[0];
			$scope.isModified = false;

			// Set helper
			$scope.helper = {
				filterKeys: ['showPassword', 'emailConfirm','passwordConfirm'],
				maxBorn: moment().subtract( 16, 'years').format('YYYY-MM-DD'),
				minBorn: moment().subtract(130, 'years').format('YYYY-MM-DD'),
				image: null
			}

			// Set scope methods
			$scope.methods = {

				// Tab button clicked
				tabClicked: (event) => {

					// Set tab idenifier
					$scope.tabID = event.currentTarget.dataset.tabId;

					// Set focus
					methods.focus();
				},

				// Login/Register/Profile button clicked
				httpRequest: () => {

					// Set optons request method
					let options	= {method: $scope.tabID === 'login' ? 'GET' : 
																($scope.tabID === 'register' ? 'POST' : 'PUT')};

					// Set request data
					let data 	= util.objFilterByKeys(
												$scope.model[$scope.tabID], 
												$scope.helper.filterKeys, false, true);

					if (util.isObjectHasKey(data, 'born') &&
							util.isDate(data.born))
						data.born = moment(data.born).format('YYYY-MM-DD');

					// Set optons request data
					options.data = JSON.stringify(data);

					// Show http request details
					console.log(`URL: ./php/${$scope.tabID}.php`);
					console.log(options);
				}
			};

			// Set local methods
			let methods = {

				// Initialize
				init: () => {

					// Get data (Only for test)
					methods.get();

					// Set focus
					methods.focus();

					// Set events
					methods.events();

					// Find/Initialize elements
					methods.find();
				},

				// Get data
				get: () => {

					fetch('./data/data.json')
					.then(response => response.json())
					.then(response => {
						let index = util.randomNumber(0, response.length-1);
						$rootScope.userProp = Object.keys(response[index])
																				.reduce((o, k) => {
																					o[k] = null;
																					return o;
																				}, {});
						response[index].born = moment(response[index].born).toDate();
						$rootScope.user = util.objMerge({}, response[index]);
						if ($rootScope.user.img) {
							util.base64Tofile(
								$rootScope.user.mimeType,
								$rootScope.user.img
							).then(file => {
								$scope.helper.image = file;
								$scope.model.profile = util.objMerge($rootScope.user, response[index]);
								$scope.$applyAsync();
							});
						}
						$rootScope.$applyAsync();
					})
					.catch(e => console.log(e));
				},

				// Events
				events: () => {

					// Set modal on close event
					document.querySelector('#modalRequest')
									.addEventListener('hidden.bs.modal', methods.reset);

					// Watch user image changed
					$scope.$watch('helper.image', (newValue, oldValue) => {
						if(!angular.equals(newValue, oldValue)) {
							methods.img(newValue, oldValue);
						}
					});

					// Watch user profile changed
					$scope.$watch('model.profile', (newValue, oldValue) => {
						if (newValue) {
							$scope.isModified = !angular.equals(newValue, $rootScope.user);
						}
					}, true);
				}, 

				// Reset
				reset: () => {

					switch($scope.tabID) {
						
						case 'login':
							$scope.model[$scope.tabID].password = null;
							$scope.model[$scope.tabID].showPassword = false;
							break;

						case 'register':
							$scope.model.login.email = util.cloneVariable($scope.model[$scope.tabID].email);
							$scope.model.login.password = null;
							$scope.model.login.showPassword = false;

							$scope.isModified 		= false;
							$scope.helper.image 	= null;
							$rootScope.user 			= util.objMerge($rootScope.userProp, $scope.model[$scope.tabID], true);
							$scope.model.profile 	= util.objMerge($scope.model.profile, $rootScope.user, true);
							Object.keys($scope.model[$scope.tabID]).forEach(key => {
								switch (key) {
									case 'showPassword':
										$scope.model[$scope.tabID][key] = false;
										break;
									default:
										$scope.model[$scope.tabID][key] = null;
								}
							});
							break;

						case 'profile':
							$scope.isModified = false;
							$rootScope.user = util.objMerge({}, $scope.model[$scope.tabID]);
							$rootScope.$applyAsync();
							break;
					}

					// Apply change
					$scope.$applyAsync();

					// Set focus
					methods.focus();
				},

				// Focus
				focus: () => {
					$timeout(() => {
						let firstInvalidInput = 
								document.querySelector(`form[name="${$scope.tabID}Form"] input.ng-invalid`),
								firstEmptyInput = 
								document.querySelector(`form[name="${$scope.tabID}Form"] input.ng-empty`);
						if 		(firstInvalidInput) firstInvalidInput.focus();
						else if (firstEmptyInput) firstEmptyInput.focus();
					}, 200);
				},

				// Find/Initialize elements
				find: () => {

					// Reset asynchronous
					$timeout(() => {

						// Tooltips
						let tooltips = document.querySelectorAll('[data-bs-toggle="tooltip"]');
						if (tooltips) [...tooltips].map(e => new bootstrap.Tooltip(e));

						// User profile input image
						$scope.helper.inputImg = 
								document.querySelector('input#profile-image[type="file"]');
					}, 300);
				},

				// Set image
				img: (newValue, oldValue) => {

					// Check has property
					if (newValue) {

						let mimeType = 	$scope.helper.inputImg ? 
														$scope.helper.inputImg.accept : 
														$rootScope.user.mimeType;

						// Check accept file types property
						util.fileAllowedTypes(newValue, mimeType)
								.then(() => {

								// File reader
								util.fileReader(newValue, {
									method  : 'readAsDataURL',
									limit   : 64
								}).then((data) => {
									$scope.model.profile.img 			= util.getBase64UrlData(data);
									$scope.model.profile.mimeType	= newValue.type;
									$scope.$applyAsync();
								}).catch(error => methods.restore(oldValue, error));
						}).catch(error => methods.restore(oldValue, error));

					} else {

						// Get/Check input file data attribute file-choice-cancel property
						let isCanceled = $scope.helper.inputImg.getAttribute('data-file-choice-cancel');
						$scope.helper.inputImg.removeAttribute('data-file-choice-cancel');
						if (!isCanceled) {

							// Reset image
							$scope.model.profile.img 			= null;
              $scope.model.profile.mimeType	= null;
							$scope.$applyAsync();

						// Restore
						} else methods.restore(oldValue);
					}
				},

				// Restore image
				restore: (oldValue, error=null) => {
					$scope.helper.image = oldValue;
					$scope.$applyAsync();
					if (error) $timeout(() => {alert(error)}, 50);
				}
			};

			// Initialize
			methods.init();
		}
	])

	//{email:null,password:null},
	//{name:null,email:null,password:null},
	//{name:null,gender:null,born:null,phone:null,
	//address:null,email:null,password:null}
	
})(window, angular);