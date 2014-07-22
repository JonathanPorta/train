angular.module('train').directive "slider", ($templateCache)->
		restrict: "AE"
		scope: {
			# entities: "="
			# initialSelection: "="
			onSpeedChange: "&"
			speed: '='
			interval: '='

			# params: "@"
			# onCreateNew: "&"
			# parentSelection: "="
		}
		templateUrl: "train/slider/widget"
		replace: true
		transclude: false # if true, the scope outside of of where directive is in DOM is accessible.
		compile: (element, attributes, transclude)->
			console.log "slider Directive - compile function"
			##Compile
			# listviewTemplate = attributes.listviewTemplate
			# element.find(".list-body").before $templateCache.get listviewTemplate
			# element.find(".list-body").detach()

			(scope, instanceElement, instanceAttributes, ctrl, tc)->
				##Link

		controller: ($scope, storage, $filter)->
			console.log "slider Directive - Controller Function"
			$scope.onChange = ->
				console.log "slider onchange!", $scope.speed
				$scope.onSpeedChange
					speed: $scope.speed
