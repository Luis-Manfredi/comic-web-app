class ComicEntity {
  String title;
  String date;
  String? issueNumber;
  String? imageURL;
  List? characters;
  List? teams;
  List? locations;

  ComicEntity({
    required this.title,
    required this.date,
    required this.issueNumber,
    this.imageURL,
    this.characters,
    this.teams,
    this.locations
  });

  // Convert to map
  Map<String, dynamic> toMap() => {
    'title': title,
    'date': date,
    'imageURL': imageURL,
    'issueNumber': issueNumber,
    'characters': characters,
    'teams': teams,
    'locations': locations
  };

  // Map to Object
  factory ComicEntity.fromMap(Map<String, dynamic> map) => ComicEntity(
    title: map['name'],
    issueNumber: map['issue_number'], 
    date: map['date_added'],
    imageURL: map['image.original_url'] ?? '',
    characters: map['character_credits'] ?? [],
    teams: map['team_credits'] ?? [],
    locations: map['location_credits'] ?? []
  );
}