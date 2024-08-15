class AddClassRequest {
  String nameAr;
  String nameEn;
  String gradeId;
  String schoolId;

  AddClassRequest({
    required this.nameAr,
    required this.nameEn,
    required this.gradeId,
    required this.schoolId,
  });

  Map<String, dynamic> toJson() => {
    "name_ar": nameAr,
    "name_en": nameEn,
    "grade_id": gradeId,
    "school_id": schoolId,
  };
}
