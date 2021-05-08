class TypeBiere {
  String typBieId;
  String typBieNom;

  TypeBiere() {
    typBieId = '';
    typBieId = 'not found';
  }

  TypeBiere.fromJson(Map<String, dynamic> json)
      : typBieId = json['typBieId'],
        typBieNom = json['typBieNom'];
}
