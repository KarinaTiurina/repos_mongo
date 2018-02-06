RepoCtrl = ($scope, $resource) ->
  Repository = $resource("/repositories/:id", {id: "@_id"}, {update: "PUT"})
  $scope.repositories = Repository.query()

app = angular.module("Repo", ["ngResource"])
  .controller("RepoCtrl", RepoCtrl)
