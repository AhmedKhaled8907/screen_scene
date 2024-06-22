import 'package:equatable/equatable.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json[AppJson.statusCode],
      statusMessage: json[AppJson.statusMessage],
      success: json[AppJson.success],
    );
  }

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
