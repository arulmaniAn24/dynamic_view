import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/template_bloc.dart';
import '../bloc/template_event.dart';
import '../bloc/template_state.dart';
import '../models/component.dart';
import '../services/api_service.dart';
import '../widgets/dynamic_template_widget.dart';

class TemplateScreen extends StatelessWidget {
  final String viewKey;
  final String dataId;

  TemplateScreen({Key? key, required this.viewKey, required this.dataId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TemplateBloc(ApiService())..add(LoadTemplate(viewKey, dataId)),
      child: Scaffold(
        appBar: AppBar(title: Text('Dynamic Template')),
        body: BlocBuilder<TemplateBloc, TemplateState>(
          builder: (context, state) {
            if (state is TemplateLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TemplateLoaded) {
              print("print ::: ${state.template}");
              return DynamicTemplateWidget(template: state.template);
            } else if (state is TemplateError) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return Center(child: Text('Select a template'));
            }
          },
        ),
      ),
    );
  }

  Widget buildComponentWidget(Component component) {
    switch (component.type) {
      case 'Container':
        return Container(
          color: _parseColor(component.properties['color']),
          padding: EdgeInsets.fromLTRB(
            component.properties['padding']['left']?.toDouble() ?? 0,
            component.properties['padding']['top']?.toDouble() ?? 0,
            component.properties['padding']['right']?.toDouble() ?? 0,
            component.properties['padding']['bottom']?.toDouble() ?? 0,
          ),
          margin: EdgeInsets.fromLTRB(
            component.properties['margin']['left']?.toDouble() ?? 0,
            component.properties['margin']['top']?.toDouble() ?? 0,
            component.properties['margin']['right']?.toDouble() ?? 0,
            component.properties['margin']['bottom']?.toDouble() ?? 0,
          ),
          child: buildComponentWidget(component.properties['child']),
        );
      case 'Text':
        return Text(
          component.properties['text'],
          style: TextStyle(
            fontSize: component.properties['fontSize']?.toDouble() ?? 14,
            color: _parseColor(component.properties['color']),
            fontWeight: FontWeight.values[component.properties['fontWeight']] ??
                FontWeight.normal,
          ),
        );
      // Handle other component types similarly
      default:
        return SizedBox();
    }
  }

  Color _parseColor(String? colorString) {
    if (colorString == null || !colorString.startsWith('#')) {
      return Colors.transparent; // Default fallback color
    }

    colorString = colorString.substring(1); // Remove the '#'
    return Color(int.parse(colorString, radix: 16) + 0xFF000000);
  }
}
