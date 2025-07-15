class Moiveentity {
  final int idmoive;
  final String name;
  final String imageurl;
  final String subtitle;
  final num rating;
  final String timestart;

  const Moiveentity({
    required this.idmoive,
    required this.name,
    required this.imageurl,
    required this.subtitle,
    required this.rating,
    required this.timestart,
  });

  static fromMap(Map<String, dynamic> map) {}
}
