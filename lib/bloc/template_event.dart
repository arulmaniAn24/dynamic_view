abstract class TemplateEvent {}

class LoadTemplate extends TemplateEvent {
  final String viewKey;
  final String dataId;

  LoadTemplate(this.viewKey, this.dataId);
}
