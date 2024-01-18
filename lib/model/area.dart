class Area{
  int id;
  int name;
  String prenom;
  String createdAt;
  String updatedAt;

  Area({
    required this.id,
    required this.name,
    required this.prenom,
    required this.createdAt,
    required this.updatedAt
  });

   
  //Convertir les données pour le stockage de la bdd sqlite pour l'affichage
  Map<String, dynamic> toSqfliteDatabase() {
    return {
      'id': id,
      'name': name,
      'prenom': prenom,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  //Convertir les données pour le stockage dans une bdd sqlite
  factory Area.fromSqfliteDatabase(Map<String, dynamic> data) {
    return Area(
      id: data['id'],
      name: data['name'],
      prenom: data['prenom'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
  // factory Area.fromJson(Map<String, dynamic> json) => Area(
  //   id: json['id'],
  //   name: json['name'],
  //   prenom: json['prenom'],
  //   createdAt: json['createdAt'],
  //   updatedAt: json['updatedAt'],
  // );
  // Map<String, dynamic> toJson() => {
  //   "id" : id,
  //   "name" : name,
  //   "prenom" : prenom,
  //   "createdAt" : createdAt,
  //   "updatedAt" : updatedAt,
  // };
}

