import 'package:equatable/equatable.dart';

class SuccessResponseModel extends Equatable {
  final bool? status;
  final String? message;

  const SuccessResponseModel({
    required this.status,
    required this.message,
  });

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      SuccessResponseModel(
        status: json["status"],
        message: json["message"],
      );

  @override
  List<Object?> get props => [status, message];
}
