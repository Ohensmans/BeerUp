class TypeBiere {
  String typBieId;
  String typBieNom;

  TypeBiere(String typBieId, String typBieNom) {
    typBieId = typBieId;
    typBieNom = typBieNom;
  }

  TypeBiere.fromJson(Map<String, dynamic> json)
      : typBieId = json['typBieId'],
        typBieNom = json['typBieNom'];
}
