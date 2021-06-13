class Favoris {
  String bieId;
  String userId;

  Favoris(String biereId, String useId) {
    bieId = biereId;
    userId = useId;
  }

  Map<String, dynamic> favorisToJson() => <String, dynamic>{
        'bieId': bieId,
        'userId': userId,
      };

  Favoris.fromJson(Map<String, dynamic> json)
      : bieId = json['bieId'],
        userId = json['userId'];
}
