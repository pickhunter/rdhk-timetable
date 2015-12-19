angular.module('timetable').controller('timeslotController', function($scope, $http){
	console.log('timeslotController');
	
	$scope.init = function(){
		console.log($scope.sections);
		console.log($scope.subjects);
	}

	$scope.onSubjectChange = function(){
		$http.get('/timeslots/returnbatches', {
			params: {
				subid: $scope.subject
			}
		}).then(function(response){
			console.log(response.data);
			$scope.sections=response.data;
		})
	};
	$scope.onBatchChange = function(batch){
		$http.get('/timeslots/returnrembatches', {
			params: {
				batchid: $scope.batch,
				subid: $scope.subject
			}
		}).then(function(response){
			console.log(response.data);
			$scope.sections=response.data;
		})
	};	
});