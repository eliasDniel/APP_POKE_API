class CategoriesListResponse {
  final int count;
  final String next;
  final dynamic previous;
  final List<CategoryResult> results;

  CategoriesListResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory CategoriesListResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesListResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<CategoryResult>.from(
          json["results"].map((x) => CategoryResult.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class CategoryResult {
  final String name;
  final String url;

  CategoryResult({required this.name, required this.url});

  factory CategoryResult.fromJson(Map<String, dynamic> json) =>
      CategoryResult(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
