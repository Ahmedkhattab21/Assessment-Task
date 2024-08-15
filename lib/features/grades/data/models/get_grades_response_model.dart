class GetGradesResponseModel {
  String id;
  String name;
  String nameAr;
  String nameEn;
  String schoolId;

  GetGradesResponseModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.nameEn,

    required this.schoolId,
  });

  factory GetGradesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetGradesResponseModel(
        id: json['id'],
        name: json['name'],
        nameAr: json['name_ar'],
        nameEn: json['name_en'],
        schoolId: json['school_id'],
      );
}
