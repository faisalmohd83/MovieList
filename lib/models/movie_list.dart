import 'package:MovieDirect/models/movie_item.dart';

class MoviesList {
   late List<MovieItem> results;
  late int page;
  late int totalResults;
  late Dates dates;
  late int totalPages;

  MoviesList({
    required this.results,
    required this.page,
    required this.totalResults,
    required this.dates,
    required this.totalPages,
  });

  MoviesList.fromJson(Map<String, dynamic> json) {
    results = <MovieItem>[]; // Initialize with an empty list
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(MovieItem.fromJson(v));
      });
    }
    page = json['page'] ?? 0; // Initialize with default value
    totalResults = json['total_results'] ?? 0; // Initialize with default value
    dates = (json['dates'] != null ? Dates.fromJson(json['dates']) : Dates(maximum: '', minimum: '')); // Initialize with default Dates
    totalPages = json['total_pages'] ?? 0; // Initialize with default value
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results.map((v) => v.toJson()).toList();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['dates'] = this.dates.toJson();
    data['total_pages'] = this.totalPages;
    return data;
  }
}

class Dates {
  String maximum;
  String minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  Dates.fromJson(Map<String, dynamic> json)
      : maximum = json['maximum'] ?? '',
        minimum = json['minimum'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maximum'] = this.maximum;
    data['minimum'] = this.minimum;
    return data;
  }
}
