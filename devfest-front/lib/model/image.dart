
class ProgresseImg{
  final String url;
  final String discreption;
  final String date;

  ProgresseImg({required this.url, required this.discreption, required this.date,});
  
  factory ProgresseImg.fromJson(Map<String,dynamic> map) => ProgresseImg(
    url: map["url"],
    discreption: map["description"]as String,
    date: map["date"],
  );

}