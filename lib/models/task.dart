import 'package:ed_app/enums/task_status.dart';
import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String value;
  final String description;
  final String subcategoryId;
  final TaskStatus status;

  Task({this.id,@required this.value, this.description ,@required this.subcategoryId, this.status});
}
