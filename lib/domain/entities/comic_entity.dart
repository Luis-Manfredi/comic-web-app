class ComicEntity {
  String title;
  String date;
  String issueNumber;
  String detailsURL;
  String? imageURL;
  List? characters;
  List? teams;
  List? locations;
  List? concepts;

  ComicEntity({
    required this.title,
    required this.date,
    required this.issueNumber,
    required this.detailsURL,
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
    'api_detail_url': detailsURL,
    'character_credits': characters,
    'team_credits': teams,
    'location_credits': locations,
    'concept_credits': concepts
  };

  // Map to Object
  factory ComicEntity.fromMap(Map<String, dynamic> map) => ComicEntity(
    title: map['volume']['name'] ?? '',
    issueNumber: map['issue_number'] ?? '', 
    date: map['date_added'] ?? '',
    detailsURL: map['api_detail_url'] ?? '',
    imageURL: map['image']['original_url'] ?? '',
    characters: map['character_credits'] ?? [],
    teams: map['team_credits'] ?? [],
    locations: map['location_credits'] ?? [],
    concepts: map['concept_credits'] ?? []
  );
}