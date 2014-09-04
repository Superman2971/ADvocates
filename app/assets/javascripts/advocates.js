var adApp = angular.module("adApp",["ngResource"]);

// adApp.config(
//   ['$httpProvider', function($httpProvider) {
//   var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
//   var defaults = $httpProvider.defaults.headers;
//   defaults.common["X-CSRF-TOKEN"] = authToken;
//   defaults.patch = defaults.patch || {};
//   defaults.patch['Content-Type'] = 'application/json';
// }]);

adApp.factory("Campaign", ["$resource", function($resource){
  return $resource("/api/campaigns/:id",
  {id: "@id"},
  {update: {method: "PATCH"}});
}]);

adApp.controller("adController", ["$scope", "Campaign", function($scope, Campaign){

  $scope.test = "IT WORKS!";

  $scope.newCampaign = new Campaign();

  Campaign.query(function(json){
    $scope.campaigns = json;
  });

}]);