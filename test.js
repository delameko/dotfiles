App.directives.directive('article', [
  function () {
    return {
      templateUrl: 'views/directives/article.html',
      restrict: 'E',
      link: function articleLink(scope, element, attrs) {
        console.log(scope);

      }
    };
  }
]);
