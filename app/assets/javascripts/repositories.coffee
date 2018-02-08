RepoCtrl = ($scope, $resource) ->
  Repository = $resource("/repositories/:id", {id: "@_id"}, {update: "PUT"})
  $scope.repositories = Repository.query()
  console.log($scope.repositories)

app = angular.module("Repo", ["ngResource"])
  .controller("RepoCtrl", RepoCtrl)
