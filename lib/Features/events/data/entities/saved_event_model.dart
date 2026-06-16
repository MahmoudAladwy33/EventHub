class SavedEventModel {
  final String id;
  final String title;
  final String imagePath;
  final String date;
  final String month;
  final String location;

  SavedEventModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.month,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imagePath': imagePath,
      'date': date,
      'month': month,
      'location': location,
    };
  }

  factory SavedEventModel.fromJson(Map<String, dynamic> json) {
    return SavedEventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      date: json['date'] as String,
      month: json['month'] as String,
      location: json['location'] as String,
    );
  }
}
