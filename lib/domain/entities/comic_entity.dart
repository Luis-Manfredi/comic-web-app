class ComicEntity {
  String title;
  String date;
  String? issueNumber;
  String? imageURL;
  List? characters;
  List? teams;
  List? locations;
  List? concepts;

  ComicEntity({
    required this.title,
    required this.date,
    required this.issueNumber,
    this.imageURL,
    this.characters,
    this.teams,
    this.locations,
    this.concepts
  });

  // Convert to map
  Map<String, dynamic> toMap() => {
    'name': title,
    'date_added': date,
    'original_url': imageURL,
    'issue_number': issueNumber,
    'character_credits': characters,
    'team_credits': teams,
    'location_credits': locations,
    'concept_credits': concepts
  };

  // Map to Object
  factory ComicEntity.fromMap(Map<String, dynamic> map) => ComicEntity(
    title: map['results']['name'],
    issueNumber: map['results']['issue_number'], 
    date: map['results']['date_added'],
    imageURL: map['results']['image']['original_url'] ?? '',
    characters: map['results']['character_credits'] ?? [],
    teams: map['results']['team_credits'] ?? [],
    locations: map['results']['location_credits'] ?? [],
    concepts: map['results']['concept_credits'] ?? []
  );
}