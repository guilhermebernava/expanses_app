class AppUser {
  final String? displayName;
  final String? imageUrl;
  final String id;

  AppUser({
    required this.displayName,
    required this.id,
    this.imageUrl,
  });
}
