angular.module('train').directive "slider", ($templateCache)->
		restrict: "AE"
		scope:
			onSpeedChange: "&"
			speed: '='
			interval: '='
		templateUrl: "train/slider/widget"
		replace: true
		transclude: false # if true, the scope outside of of where directive is in DOM is accessible.
		controller: ($scope, storage, $filter) ->
			$scope.onChange = ->
				$scope.onSpeedChange
					speed: $scope.speed
