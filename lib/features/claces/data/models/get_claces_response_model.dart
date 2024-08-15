class GetClacesResponseModel {
  String id;
  String name;
  String nameAr;
  String nameEn;
  String gradeId;
  String schoolId;

  GetClacesResponseModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.nameEn,
    required this.gradeId,
    required this.schoolId,
  });

  factory GetClacesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetClacesResponseModel(
        id: json['id'],
        name: json['name'],
        nameAr: json['name_ar'],
        nameEn: json['name_en'],
        gradeId: json['grade_id'],
        schoolId: json['school_id'],
      );
}
