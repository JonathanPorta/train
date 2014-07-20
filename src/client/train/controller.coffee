angular.module('train').controller "train", ($scope, storage)->

  $scope.speed = 0

  $scope.onChange = ->
    if $scope.speed
      console.log "Setting Speed to #{ $scope.speed }"
      storage.emit 'train.speed',
        speed: $scope.speed
    else
      console.log "Invalid Speed!"
