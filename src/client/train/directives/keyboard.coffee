angular.module('train').directive "keyboard", ($templateCache, $filter)->
		restrict: "E"
		scope: {
			onSpeedChange: '&'
			accelerate: '='
			decelerate: '='
			brake: '='
			interval: '='
			# initialSelection: "="
			# onSpeedChange: "&"
			# params: "@"
			# onCreateNew: "&"
			# parentSelection: "="
		}
		# templateUrl: "train/gears/widget"
		replace: true
		transclude: false # if true, the scope outside of of where directive is in DOM is accessible.
		compile: (element, attributes, transclude)->
			console.log "keyboard Directive - compile function"
			##Compile
			# listviewTemplate = attributes.listviewTemplate
			# element.find(".list-body").before $templateCache.get listviewTemplate
			# element.find(".list-body").detach()

			(scope, instanceElement, instanceAttributes, ctrl, tc)->
				##Link
				jQuery(window).keydown (e) ->
					keycode = e.which
					console.log "KeyDown: #{ keycode }", e
					if keycode in scope.accelerate
						e.preventDefault()
						scope.onSpeedChange
							amount: parseInt(scope.interval)
					else if keycode in scope.decelerate
						e.preventDefault()
						scope.onSpeedChange
							amount: (-1 * parseInt(scope.interval))
					else if keycode in scope.brake
						e.preventDefault()
						scope.onSpeedChange
							amount: 0

		controller: ($scope, storage, $filter)->
			console.log "keyboard Directive - Controller Function"

