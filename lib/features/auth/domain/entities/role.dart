class Role {
  final int id;
  final String slug;
  final String name;

  Role({
    required this.id,
    required this.slug,
    this.name = "",
  });
}
