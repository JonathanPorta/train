angular.module('train').directive "speedometer", ($templateCache, $filter)->
		restrict: "AE"
		scope: {
			speed: '='
			# initialSelection: "="
			# onSpeedChange: "&"
			# params: "@"
			# onCreateNew: "&"
			# parentSelection: "="
		}
		templateUrl: "train/speedometer/widget"
		replace: true
		transclude: false # if true, the scope outside of of where directive is in DOM is accessible.
		compile: (element, attributes, transclude)->
			console.log "speedometer Directive - compile function"
			##Compile
			# listviewTemplate = attributes.listviewTemplate
			# element.find(".list-body").before $templateCache.get listviewTemplate
			# element.find(".list-body").detach()

			(scope, instanceElement, instanceAttributes, ctrl, tc)->
				##Link
				console.log "speedomoter link func!"
				scope.$watch instanceAttributes.speed, (value) ->
					console.log "speedomoter link function watcher called!"

					speed = $filter('speed') value
					instanceElement.find("h1").text speed

		controller: ($scope, storage, $filter)->
			console.log "speedometer Directive - Controller Function"

