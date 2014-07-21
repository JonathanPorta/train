angular.module('train').directive "gears", ($templateCache, $filter)->
		restrict: "AE"
		scope: {
			speed: '='
			# initialSelection: "="
			# onSpeedChange: "&"
			# params: "@"
			# onCreateNew: "&"
			# parentSelection: "="
		}
		templateUrl: "train/gears/widget"
		replace: true
		transclude: false # if true, the scope outside of of where directive is in DOM is accessible.
		compile: (element, attributes, transclude)->
			console.log "gears Directive - compile function"
			##Compile
			# listviewTemplate = attributes.listviewTemplate
			# element.find(".list-body").before $templateCache.get listviewTemplate
			# element.find(".list-body").detach()

			(scope, instanceElement, instanceAttributes, ctrl, tc)->
				##Link
				console.log "gears link func!"
				scope.$watch instanceAttributes.speed, (value) ->
					console.log "gears link function watcher called!"

					gear = $filter('gear') value
					instanceElement.find('.selected').removeClass 'selected'
					instanceElement.find(".#{ gear }").addClass 'selected'

		controller: ($scope, storage, $filter)->
			console.log "gears Directive - Controller Function"

