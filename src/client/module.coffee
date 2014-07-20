train = angular.module "train", ["ngRoute"]

train.config ($routeProvider)->
		$routeProvider.when('/', {templateUrl:'train', controller:"train"})
		.otherwise({redirectTo: '/'})

module.exports = train

require "./train/controller.coffee"
require "./storage/service.coffee"
