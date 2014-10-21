angular.module('train').directive "keyboard", ($templateCache, $filter)->
		restrict: "E"
		scope:
			onSpeedChange: '&'
			accelerate: '='
			decelerate: '='
			brake: '='
			whistle: '='
			onWhistle: '&'
			interval: '='
		replace: true
		transclude: false # if true, the scope outside of of where directive is in DOM is accessible.
		compile: (element, attributes, transclude) ->
			(scope, instanceElement, instanceAttributes, ctrl, tc) ->
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
					else if keycode in scope.whistle
						e.preventDefault()
						scope.onWhistle()

		controller: ($scope, storage, $filter)->
			console.log "keyboard Directive - Controller Function"
