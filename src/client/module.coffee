train = angular.module "train", ["ngRoute"]

train.config ($routeProvider)->
		$routeProvider.when('/', {templateUrl:'train', controller:"train"})
		.otherwise({redirectTo: '/'})

module.exports = train

require "./train/controller.coffee"

require "./train/directives/slider.coffee"
require "./train/directives/speedometer.coffee"
require "./train/directives/gears.coffee"
require "./train/directives/keyboard.coffee"

require "./train/filters/direction.coffee"
require "./train/filters/speed.coffee"
require "./train/filters/gear.coffee"

require "./storage/service.coffee"
