class AddGradeRequest {
  String nameAr;
  String nameEn;
  String schoolId;

  AddGradeRequest({
    required this.nameAr,
    required this.nameEn,
    required this.schoolId,
  });

  Map<String, dynamic> toJson() => {
    "name_ar": nameAr,
    "name_en": nameEn,
    "school_id": schoolId,
  };
}
