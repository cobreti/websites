'use strict';

/**
 * @ngdoc overview
 * @name dannyThibaudeauApp
 * @description
 * # dannyThibaudeauApp
 *
 * Main module of the application.
 */
angular
  .module('dannyThibaudeauApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/porte-folio', {
        templateUrl: 'views/portefolio.html',
        controller: 'Porte-folio'
      })
      .when('/porte-folio/InterviewManager', {
        templateUrl: 'views/portefolio.html',
        controller: 'Porte-folio'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
