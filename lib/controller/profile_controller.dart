import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:job_assignment/model/profile.dart';

class ProfileController extends GetxController {
  late Profile profile;
  final items=<String>[].obs;
  final FlutterTts tts = FlutterTts();
  final inputJson = <String, dynamic>{
    'id': "123456789",
    'name': "My name is Shravan Kumar.",
    'profileImg':
        "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
    'backImages': [
      'https://images.unsplash.com/photo-1556815798-86e1fc06afc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
      'https://images.unsplash.com/photo-1603298624547-e38905ce21d7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
      'https://images.unsplash.com/photo-1594639739395-d73d9f506f6d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=871&q=80',
      'https://images.unsplash.com/photo-1472162072942-cd5147eb3902?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=869&q=80',
      'https://images.unsplash.com/photo-1471286174890-9c112ffca5b4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=869&q=80',
      'https://images.unsplash.com/photo-1526864972308-bf02b0c2ab8c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=715&q=80'
    ],
    'isMale': true,
    'std': 'I am a KG1 Student',
    'edu': 'I went to Public Kindergarten School.',
    'hobby': 'My Hobbies are Painting and playing Football.',
    'interestImages': [
      'https://parenting.firstcry.ae/memories/getMyMemoryImages/2018/06/731247928-H.jpg',
      'https://cdn.cdnparenting.com/articles/2020/04/20142755/1203196093-1024x700.jpg',
      'https://thumbs.dreamstime.com/b/web-222298008.jpg',
    ],
    'reviews': [
      'Marriam Mam, craft teacher, He is very curious kid.',
      'Jacob Sir, his football teacher,I think he can become future messi.',
      'Teacher Lee,puzzle and creativity master, He has got potential to become great human being'
    ],
    'teacherImages': [
      'https://images.unsplash.com/photo-1511250503134-89501c53a815?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
      'https://images.unsplash.com/photo-1473492201326-7c01dd2e596b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=871&q=80',
      'https://images.unsplash.com/photo-1557734864-c78b6dfef1b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1034&q=80',
    ],
  };

  @override
  void onInit() {
    profile=Profile.fromJson(inputJson);
    changeItems(profile.backgroundImages);
    tts.setLanguage('en');
    tts.setSpeechRate(0.2);


    super.onInit();
  }

  void changeItems(List<String>? newItems){
    items.clear();
    if(newItems!=null){

      for(String item in newItems){
        items.add(item);
      }
    }
  }

  void introduction(){
    String introduction=profile.name!+profile.preSchoolStd!;
    tts.speak(introduction);
  }

  void hobbies(){
    String background=profile.educationHistory!+profile.hobbies!;
    tts.speak(background);
  }

  void reviews(){
    String reviews="";
    for(String item in profile.reviews!){
      reviews=reviews+item;
    }
    tts.speak(reviews);
  }
}
