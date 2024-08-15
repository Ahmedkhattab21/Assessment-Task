class AddGradeResponseError {
  String message;
  ErrorResponse error;

  AddGradeResponseError({
    required this.message,
    required this.error,
  });

  factory AddGradeResponseError.fromJson(Map<String, dynamic> json) =>
      AddGradeResponseError(
        message: json['message'],
        error: ErrorResponse.fromJson(json['errors']),
      );
}

class ErrorResponse {
  List<String> nameAr;
  List<String> nameEn;
  List<String> schoolId;

  ErrorResponse({
    required this.nameAr,
    required this.nameEn,
    required this.schoolId,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        nameAr: json['name_ar']==null?[]:List<String>.from(json['name_ar'].map((item) => item)).toList(),
        nameEn: json['name_en']==null?[]:List<String>.from(json['name_en'].map((item) => item)).toList(),
        schoolId:json['school_id']==null?[]:
            List<String>.from(json['school_id'].map((item) => item)).toList(),
      );
}
