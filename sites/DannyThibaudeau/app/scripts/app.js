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
  .config(function ($locationProvider) {
    // $locationProvider.html5Mode(true);
  })
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
        templateUrl: 'views/interviewManager.html',
        controller: 'interviewManager'
      })
      .when('/porte-folio/NyxTraceViewer', {
        templateUrl: 'views/nyxTraceViewer.html',
        controller: 'nyxTraceViewer'
      })
      .when('/porte-folio/NyxLib', {
        templateUrl: 'views/nyxLib.html',
        controller: 'nyxLib'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
