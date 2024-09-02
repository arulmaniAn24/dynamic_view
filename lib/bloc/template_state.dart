import '../models/template_model.dart';

abstract class TemplateState {}

class TemplateInitial extends TemplateState {}

class TemplateLoading extends TemplateState {}

class TemplateLoaded extends TemplateState {
  final TemplateModel template;

  TemplateLoaded(this.template);
}

class TemplateError extends TemplateState {
  final String error;

  TemplateError(this.error);
}
