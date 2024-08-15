class AddClassResponseError {
  String message;
  ClassError error;

  AddClassResponseError({
    required this.message,
    required this.error,
  });

  factory AddClassResponseError.fromJson(Map<String, dynamic> json) =>
      AddClassResponseError(
        message: json['message'],
        error: ClassError.fromJson(json['errors']),
      );
}

class ClassError {
  List<String> nameAr;
  List<String> nameEn;
  List<String> gradeId;
  List<String> schoolId;

  ClassError({
    required this.nameAr,
    required this.nameEn,
    required this.gradeId,
    required this.schoolId,
  });

  factory ClassError.fromJson(Map<String, dynamic> json) => ClassError(
        nameAr: json['name_ar'] == null
            ? []
            : List<String>.from(json['name_ar'].map((item) => item)).toList(),
        nameEn: json['name_en'] == null
            ? []
            : List<String>.from(json['name_en'].map((item) => item)).toList(),
        gradeId: json['grade_id'] == null
            ? []
            : List<String>.from(json['grade_id'].map((item) => item)).toList(),
        schoolId: json['school_id'] == null
            ? []
            : List<String>.from(json['school_id'].map((item) => item)).toList(),
      );
}
