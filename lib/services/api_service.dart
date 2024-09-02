import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/template_model.dart';

class ApiService {
  Future<TemplateModel?> fetchTemplate(String viewKey, String dataId) async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/view_config.json');
      final Map<String, dynamic> data = json.decode(response);
      return TemplateModel.fromJson(data);
    } catch (e) {
      print('Error loading template from assets: $e');
      return null;
    }
  }
}
