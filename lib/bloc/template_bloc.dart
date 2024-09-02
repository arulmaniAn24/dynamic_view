import 'package:flutter_bloc/flutter_bloc.dart';
import 'template_event.dart';
import 'template_state.dart';
import '../services/api_service.dart';
import '../models/template_model.dart';

class TemplateBloc extends Bloc<TemplateEvent, TemplateState> {
  final ApiService apiService;

  TemplateBloc(this.apiService) : super(TemplateInitial()) {
    on<LoadTemplate>(_onLoadTemplate);
  }

  Future<void> _onLoadTemplate(
      LoadTemplate event, Emitter<TemplateState> emit) async {
    emit(TemplateLoading());
    try {
      final template =
          await apiService.fetchTemplate(event.viewKey, event.dataId);
      print("template ::: $template");
      if (template == null) {
        emit(TemplateError('Template not found'));
      } else {
        emit(TemplateLoaded(template));
      }
    } catch (e) {
      emit(TemplateError(e.toString()));
    }
  }
}
