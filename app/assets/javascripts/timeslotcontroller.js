angular.module('timetable').controller('timeslotController', function($scope, $http, $httpParamSerializer){
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
	$scope.onBatchChange = function(){
		$http.get('/timeslots/returnrembatches', {
			params: {
				batchid: $scope.batch1,
				subid: $scope.subject
			}
		}).then(function(response){
			console.log(response.data);
			$scope.sections=response.data;
		})
	};

	$scope.getRooms = function(slotid){
		$http.get('/timeslots/returnrooms', {
			params: {
				slotid: slotid
			}
		}).then(function(response){
			console.log(response.data);
			$scope.rooms=response.data;
		})
	};


	$scope.findSlots = function(){
		var params = {
			year: $scope.year,
			subject_id: $scope.subject,
			"batches[]": [$scope.batch1, $scope.batch2, $scope.batch3]
		}
		debugger
		window.location = '/timeslots/index?' + $httpParamSerializer(params)
	};


});