class Profile {
  String? profileId;
  String? name;
  String? profilePhoto;
  List<String>? backgroundImages;
  bool? isMale;
  String? preSchoolStd;
  String? educationHistory;
  String? hobbies;
  List<String>? interestImages;
  List<String>? reviews;
  List<String>? teacherImages;

  Profile(
      {this.profileId,
      this.name,
      this.profilePhoto,
      this.backgroundImages,
      this.isMale,
      this.preSchoolStd,
      this.educationHistory,
      this.hobbies,
      this.interestImages,
      this.reviews,
      this.teacherImages});

  factory Profile.fromJson(Map<String, dynamic> json) {

    var backImgJson = json['backImages'];
    List<String> backImageList = List<String>.from(backImgJson);
    var interestImagesJson = json['interestImages'];
    List<String> interestImages = List<String>.from(interestImagesJson);
    var reviewsJson = json['reviews'];
    List<String> reviewsList = List<String>.from(reviewsJson);
    var teacherImgJson = json['teacherImages'];
    List<String> teacherImagesList = List<String>.from(teacherImgJson);

    return Profile(
      profileId: json['id'],
      name: json['name'],
      profilePhoto: json['profileImg'],
      backgroundImages: backImageList,
      isMale: json['isMale'],
      preSchoolStd: json['std'],
      educationHistory: json['edu'],
      hobbies: json['hobby'],
      interestImages: interestImages,
      reviews: reviewsList,
      teacherImages: teacherImagesList,
    );
  }
}
