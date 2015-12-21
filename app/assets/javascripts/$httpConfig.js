angular.module('timetable').config(function($httpProvider, ConfigFromServer){
  $httpProvider.defaults.headers.common['X-Csrf-Token'] = ConfigFromServer.auth_token;
  $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
});