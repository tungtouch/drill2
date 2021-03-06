angular.module('DrillApp').directive 'questionEditor', ->
  restrict: 'E'
  scope:
    model: '='
    submitExpr: '@submit'
  transclude: yes
  templateUrl: 'app/screens/home/editor/editor.html'
  controller: 'QuestionEditorController'
  # TODO use ngForm

.directive 'questionEditorTextarea', ->
  restrict: 'A'
  require: '^^questionEditor'
  link: (scope, element) ->
    element.bind 'focus', ->
      scope.$apply('model.focused=true')
    element.bind 'blur', ->
      scope.$apply('model.focused=false')

.directive 'questionEditorForm', ->
  restrict: 'A'
  require: '^^questionEditor'
  link: (scope, element, attr, controller) ->
    controller.form = element
