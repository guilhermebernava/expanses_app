import 'dart:convert';

import 'package:common/domain/entities/user.dart';

class AppUserDto {
  static AppUser fromJson(String data) {
    final map = json.decode(data);

    return AppUser(
      displayName: map["display_name"],
      id: map["id"],
      imageUrl: map["image_url"],
    );
  }

  static String toJson(AppUser entity) {
    return json.encode(
      {
        "display_name": entity.displayName,
        "image_url": entity.imageUrl,
        "id": entity.id,
      },
    );
  }
}
