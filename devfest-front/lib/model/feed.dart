class Feed {
  late final String username;
  late final String date;
  late final String discreption;

  Feed({required this.username,required this.date,required this.discreption});
  
    factory Feed.fromJson(Map<String,dynamic> map) => Feed(
    discreption: map["text"],
    username : map["costumer"]["user"]["username"],
    date: map["date"]
  );

}