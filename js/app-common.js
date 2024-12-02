;(function(window, angular) {

	'use strict';

	// Sort array randomly
  Array.prototype.random = function() {
    return this.sort((a, b) => Math.random() - 0.5);
  };
  
  // Unique array
  Array.prototype.unique = function(key=null) {
    let arr = this;
    if (Object.prototype.toString.call(key) === '[object String]')
          return [...new Map(arr.filter(obj => key in obj).map(obj => [obj[key], obj])).values()];
    else 	return [...new Set(arr)];
  };

  // Convert day to string format (YYYY-mm-dd)
  Date.prototype.toISOFormat = function() {
    return this.toISOString().split('T')[0];
  }

  // Application common module
  angular.module('app.common', [])

	// Convert day to string format (YYYY-mm-dd)
	.filter('dateToStr', [
    () => {
      return (date) => {
        return date ? date.toISOFormat() : date;
      };
    }
  ])

	// Utilities factory
  .factory('util', [
    () => {

      // Set utilities
      let util = {
				variableType: checkedVar => Object.prototype.toString.call(checkedVar).slice(8, -1).toLowerCase(),
				isUndefined: checkedVar => Object.prototype.toString.call(checkedVar) === '[object Undefined]',
    		isNull: checkedVar => Object.prototype.toString.call(checkedVar) === '[object Null]',
    		isBoolean: checkedVar => 	Object.prototype.toString.call(checkedVar) === '[object Boolean]',
    		isNumber: checkedVar =>	Object.prototype.toString.call(checkedVar) === '[object Number]',
    		isInt: checkedVar => util.isNumber(checkedVar) && checkedVar % 1 === 0,
    		isFloat: checkedVar => util.isNumber(checkedVar) && checkedVar % 1 !== 0,
    		isVarNumber: checkedVar => util.isNumber(checkedVar) ||
    		                          (util.isString(checkedVar) && !isNaN(Number(checkedVar))),
    		isString: checkedVar => 	Object.prototype.toString.call(checkedVar) === '[object String]',
    		isDate: checkedVar =>	Object.prototype.toString.call(checkedVar) === '[object Date]',
    		isArray: checkedVar =>	Object.prototype.toString.call(checkedVar) === '[object Array]',
    		isObject: checkedVar =>	Object.prototype.toString.call(checkedVar) === '[object Object]',
				cloneVariable: variable => {
					if (!util.isUndefined(variable)) {
							if (util.isDate(variable)) 
											return new Date(JSON.parse(JSON.stringify(variable)));
							else    return JSON.parse(JSON.stringify(variable));
					} else      return undefined;
				},
				hasKey: (checkedVar, key) => util.isString(key) && key in checkedVar,
				isObjectHasKey: (checkedVar, key) => util.isObject(checkedVar) && util.hasKey(checkedVar, key),
        isFile: checkedVar =>	Object.prototype.toString.call(checkedVar) === '[object File]',
				isJson: checkedVar => {
					if (util.isString(checkedVar)) {
							try       {return !util.isUndefined(JSON.parse(checkedVar));} 
							catch (e) {return false;}	
					} else return false;
				},
				objFilterByKeys: (obj, filter, isExist=true, isSortKeys=false) => {
					if (!util.isObject(obj)) return obj;
					if (util.isString(filter)) {
						filter = filter.replaceAll(';', ',');
						filter = filter.split(",");
					}
					if (!util.isArray(filter) || !filter.length)
						return Object.assign({}, obj);
					if (!util.isBoolean(isExist)) isExist = true;
					if (!util.isBoolean(isSortKeys)) isSortKeys = false;
					let keys = Object.keys(obj);
					if (isSortKeys) keys.sort();
					return  Object.assign({}, 
									keys
									.filter((k) => {
										if (isExist) 
													return filter.includes(k);
										else  return !filter.includes(k); 
									}).reduce((o, k) => Object.assign(o, {[k]: obj[k]}), {}));
				},
				objMerge: (target, source, existKeys) => {
					if (!util.isObject(target)) target = {};
					if (!util.isObject(source)) source = {};
					if (util.isBoolean(existKeys) && existKeys)
									return  Object.assign({}, target, util.objFilterByKeys(source, Object.keys(target)));
					else    return  Object.assign({}, target, source);
				},
				capitalize: (str, isLowerEnd=true) => {
          if (!util.isString(str) ||
              !(str = str.trim()).length) return str;
          if (str.length === 1) return str.toUpperCase();
          if (!util.isBoolean(isLowerEnd)) isLowerEnd = true;
          return  str.charAt(0).toUpperCase() + (isLowerEnd ?
                  str.substr(1).toLowerCase() : str.substr(1));
        },
				randomNumber: (min, max, step) => {
          min		= util.isInt(min) 	&& min >= 0	 ? min : 0;
          max		= util.isInt(max) 	&& max > min ? max : min+1;
          step	= util.isInt(step)	&& step > 0 && step <= max-min ? step : 1;
          return min + (step * Math.floor(Math.random() * (max-min+1) / step));
        },
        isJQuery: () => typeof jQuery !== 'undefined',
				base64ToUrl: (type, data) => `data:${type};base64,${data}`,
        base64Tofile: (type, data, name) => {
          return new Promise((resolve, reject) => {
            fetch(util.base64ToUrl(type, data))
            .then(response => response.blob())
            .then(result => {
              if (!util.isString(name)) name = '';
              resolve(new File([result], name, {type: type}));
            });
          });
        },
				getBase64UrlData: (url) => {
          let data = '';
          if (util.isString(url)) {
            data = url.toString().replace(/^data:(.*,)?/, '');
            if ((data.length % 4) > 0) data += '='.repeat(4 - (data.length % 4));
          }
          return data;
        },
				fileReader: (file, options) => {

          // Create promise
          return new Promise((resolve, reject) => {

            // Check file is valid
            if (util.isFile(file)) {

              // Check/Convert options
              if (util.isString(options))
                options = {method: options};

              // Merge options with default
              options = util.objMerge({
                method  : 'readAsText',
                limit   : null,
                unit    : 'KB'
              }, options, true);

              // Check options method
              if (!util.isString(options.method))
                options.method = 'readAsText';
              options.method = options.method.trim();
              if (![
                'readAsArrayBuffer','readAsBinaryString',
                'readAsDataURL','readAsText'
              ].includes(options.method))
                options.method = 'readAsText';

              // Check options size limit
              if (!util.isInt(options.limit) || options.limit <= 0)
                options.limit = null;

              // Set size
              let size = options.limit;

              // Check size limit exist
              if (size) {
            
                // Create variable units
                let units = ["Byte", "KB", "MB", "GB", "TB"];

                // Check parameter size unit
                if (!util.isString(options.unit)) options.unit = 'KB';
                options.unit = options.unit.trim();
                if (options.unit.length === 2)
                      options.unit = options.unit.toUpperCase();
                else  options.unit = util.capitalize(options.unit);
                if (!units.includes(options.unit)) options.unit = 'KB';
                let multiplier = units.indexOf(options.unit);

                // Convert size limit to byte
                if (multiplier) while(multiplier--) size *= 1024;
              }

              // Check size limit exist, or file size is less then size limit
              if (!size || file.size <= size) {

                // Create file reader, and convert file to base64
                let reader = new FileReader();
                reader.onload   = () => resolve(reader.result);
                reader.onerror  = () => reject(`File read error: ${file.name}!`);
                reader[options.method](file);

              } else  reject(`File size limited: ${parseInt(options.limit)} ${options.unit}!`);
            } else    reject('Invalid parameter: file!');
          });
        },
        fileAllowedTypes: (file, types=null) => {

          // Create promise
          return new Promise((resolve, reject) => {

            // Check file is valid
            if (util.isFile(file)) {

              // Check parameter allowed types
              if (util.isString(types)) {
                types = types.trim().toLowerCase();
                if (['*', '*.*'].includes(types))
                      types = null;
                else  types = types.replace('*','').split(',').filter(()=>true);
              }

              // Check allowed types exist
              if (util.isArray(types) && types.length) {
                let isAllowed = false, 
                    mimeType  = file.type.toLowerCase();
                for(let i=0; i<types.length; i++) {
                  if (mimeType.includes(types[i].trim())) {
                    isAllowed = true;
                    break;
                  }
                }
                if (isAllowed)
                      resolve();
                else  reject('Invalid file type!');
              } else  resolve();
            } else    reject('Invalid parameter: file!');
          });
        },
        getLocation: (key=null) => {
          if (!util.isString(key)) key = 'origin';
          key = key.toLowerCase().trim();
          if (!util.hasKey(window.location, key)) key = 'origin';
          return window.location[key];
        },
        getPageId: () => {
          let pageId = "";
          ['hostname','pathname'].forEach(key => {
            let prop = util.getLocation(key).toLowerCase();
            if (prop[0] === '/') prop = prop.slice(1);
            if (prop.slice(-1) === '/') prop = prop.slice(0, -1);
            pageId += (pageId.length ? '/' : '') + prop;
          });
          return pageId;
        },
        localStorage: (method, key, value=null) => {
          if (!util.isString(method) || 
              !(method = method.trim().toLowerCase()).length ||
              !['set','get','remove'].includes(method) ||
              (method === 'set' && util.isNull(value)) ||
              !util.isString(key) || 
              !(key = key.trim().toLowerCase()).length) return null;
          let result = null;
          key = util.getPageId() + `-${key}`;
          switch(method) {
            case 'set':
              localStorage.setItem(key, JSON.stringify(value));
              break;
            case 'get':
              result = localStorage.getItem(key);
              if (!util.isNull(result) && 
                   util.isJson(result)) 
                result = JSON.parse(result);
              break;
            case 'remove':
              localStorage.removeItem(key);
              break;
          }
          return result;
        }
			};

			// Return utilities
			return util;
		}
	]);

})(window, angular);