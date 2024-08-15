class UpdateGradeRequest {
  String nameAr;
  String nameEn;
  String schoolId;
  String id;

  UpdateGradeRequest({
    required this.nameAr,
    required this.nameEn,
    required this.schoolId,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        "name_ar": nameAr,
        "name_en": nameEn,
        "school_id": schoolId,
      };
}
