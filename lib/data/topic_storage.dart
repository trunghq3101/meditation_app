import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/data/model/topic.model.dart';

abstract class TopicStorage {
  Future<List<Topic>> load();
}

class AssetTopicStorage extends TopicStorage {
  @override
  Future<List<Topic>> load() async {
    if (kDebugMode) {
      await Future.delayed(const Duration(seconds: 1));
    }
    final jsonContent = await rootBundle.loadString("mock/topics/topics.json");
    final List<dynamic> jsonData = jsonDecode(jsonContent);
    return jsonData.map((e) => Topic.fromJson(e)).toList();
  }
}
