;(function(window, angular) {

  'use strict';

  // Application form module
  angular.module('app.form', [
    'app.common'
  ])

  // Compare model equal with another model
  .directive('ngCompareModel', [
    '$parse',
    ($parse) => {
      return {
        restrict: 'EA',
        require : "ngModel",
        scope   : false,
        link: function(scope, iElement, iAttrs, ngModel) {
          scope.$watch(() => 	
            $parse(iAttrs.ngCompareModel)(scope) === ngModel.$modelValue, 
                  (isEqual) => ngModel.$setValidity('equal', isEqual));
        }
      };
    }
  ])

	// Disable input space
	.directive('ngDisableSpace', [
    () => {
      return {
        scope: false,
        link: (scope, iElement) => {
          iElement.bind("keydown", function(event) {
            if (event.keyCode === 32) {
              event.preventDefault();
              return false;
            }
          });
        }
      };
    }
  ])

  // Allow numbers only
  .directive('ngAllowNumbers', [
    'util',
    (util) => {

      return {
        restrict: 'EA',
        require : "ngModel",
        scope: false,
        link: (scope, iElement, iAttrs, ngModel) => {

          // Set default options
          let options = {isAllowNegative:false, disableZeroStart:true, isFloat:false};

          // When attribute is json, then merge with default optons
          if (util.isJson(iAttrs.ngAllowNumbers))
            options = util.objMerge(options, JSON.parse(iAttrs.ngAllowNumbers), true);

          // Check options
          if (options.isFloat) options.disableZeroStart = false;

          // Set event key down
          iElement.bind("keydown", function(event) {
            
            // Numbers 0 to 9 also numpad
            if ((event.which >= 48 && event.which <=  57) ||
                (event.which >= 96 && event.which <= 105)) {
              
              // Check disable zero start
              if (options.disableZeroStart && 
                 (event.which === 48 || event.which === 96)) {
                if (!iElement[0].value) {
                        event.preventDefault(); 
                        return false;
                } else  return true;
              } else return true;

            // Backspace, enter, delete, escape, arrows, end, home, ins, numlock
            // When is allow float then allow dot or numpad dot
            // When is allow negative then allow minus sign or numpad minus sign
            } else if (([8,13,46,27,37,38,39,40,35,36,45,144].includes(event.which)) ||
                (event.which >= 48 && event.which <=  57) ||
                (event.which >= 96 && event.which <= 105) ||
                (options.isFloat && [110, 190].includes(event.which)) ||
                (options.isAllowNegative && [173, 109].includes(event.which))) {
              return true;
            } else {
              event.preventDefault(); 
              return false;
            }
          });
        }
      };
    }
  ])

	// Clear icon
  .directive('ngClearIcon', [
    '$compile',
    'util',
    ($compile, util) => {

      return {
        restrict: 'EA',
        require : "ngModel",
        scope   : false,
        link: (scope, iElement, iAttrs, ngModel) => {
          
          // Create clear icon element, and set default style
          let icon  = angular.element(
               `<span class="clear-icon position-absolute text-primary b-1
                             fw-semibold text-center text-bold fs-5 d-flex align-items-center"
                      ng-show="${ngModel.$$parentForm.$name}.${ngModel.$name}.$viewValue">
                  <i class="fa-solid fa-xmark fa-xs cursor-pointer"></i>
                </span>`),
              style = {top:0, right:'20px', bottom:0, left:'auto', zIndex:101};

          if (util.isJson(iAttrs.ngClearIcon))
            style = util.objMerge(style, JSON.parse(iAttrs.ngClearIcon));

          // Set clear icon style
          icon.css(style);

          // Set input element style
          iElement.css({paddingRight:'25px'});

          // Append and compile clear icon to scope
          iElement.parent().append(icon);
          $compile(icon)(scope);
          
          // Watch input element disabled changed
          scope.$watch(() => iElement.attr('disabled'), 
            (newValue, oldValue) => {
              if(!angular.equals(newValue, oldValue))
                icon[0].classList[newValue === 'disabled' ? 'add' : 'remove']('d-none');
            });

          // On clear icon clicked, reset model
          icon.find('i').on('click', (event) => {
            event.preventDefault();
            ngModel.$setViewValue(null);
            ngModel.$render();
            scope.$applyAsync();
            if (iElement[0].type === 'file') {
                    iElement[0].value = "";
            } else  iElement[0].focus();
          });
        }
      };
  }])

  // Input file
  .directive("fileInput", [
    () => {
      return {
        require: "ngModel",
        scope: false,
        compile: () => {
          return {
            post: (scope, element, attrs, ngModel) => {
              element[0].addEventListener("change", () => {
                if (!element[0].files.length) {
                        element[0].setAttribute('data-file-choice-cancel', true);
                        ngModel.$setViewValue(null);          
                } else  ngModel.$setViewValue(element[0].files[0]);
                ngModel.$render();
                scope.$applyAsync();
              });
            }
          };
        }
      }
    }
  ])

})(window, angular);