import 'package:dio/dio.dart';
import 'package:proyecto2yes_or_no_bootcamp/infrastructure/models/yes_no_model.dart';

import '../domain/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromMap(response.data);
    return yesNoModel.toMessageEntity();
  }
}