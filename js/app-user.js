;(function(window, angular) {

  'use strict';

  // Application user module
  angular.module('app.user', [
    'app.common',
		'app.message',
  ])

	// User factory
  .factory('user', [
    '$rootScope',
    '$state',
    'util',
    'msg',
    ($rootScope, $state, util, msg) => {

      // Set user properties
      let properties;

      // Set local methods
      let methods = {

        // Default user properties
        default: () => {
          return {
            id          : null,
            type        : null,
            first_name  : null,
            middle_name : null,
            last_name   : null,
            gender      : null,
            email       : null 
          };
        }
      };

      // Set user
      let user = {

        // Initialize
        init: (prop=null) => {

          // Check user properties
          if (util.isObject(prop))
                properties = util.objMerge({}, prop);
          else  properties = util.objMerge({}, methods.default());

          // Set user default properties
          $rootScope.user = util.objMerge({}, properties);
        },

        // Set
        set: (data) => {
          Object.keys(properties).forEach(key => {
            if (util.hasKey(data, key)) $rootScope.user[key] = data[key];
          });
          $rootScope.$applyAsync();
        },

        // Get
        get: () => properties,

        // Reset
        reset: (filter=null) => {
          if (util.isString(filter)) filter = filter.split(',');
          if (!util.isArray(filter)) filter = [];
          Object.keys($rootScope.user).forEach(key => {
            if (!filter.includes(key)) $rootScope.user[key] = null;
          });
          $rootScope.$applyAsync();
        }
      };

      // Logout
      $rootScope.logout = () => {
        msg.show({
          icon      : "text-primary fa-solid fa-circle-question",
          content   : "Biztosan kijelentkezik?",
          isConfirm	: true,
          callback  : (response) => {
            if (response === 'ok') {
              user.reset('email');
              if (util.isObjectHasKey($rootScope, 'state') &&
                  $rootScope.state.disabled.includes($rootScope.state.id))
                $state.go($rootScope.state.default);
            }
          }
        });
      };

      // Return user
      return user;
    }
  ]);

})(window, angular);