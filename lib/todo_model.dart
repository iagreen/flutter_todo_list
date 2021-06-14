import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final int? id;
  final String task;
  final bool? isComplete;

  ToDo({this.id, this.task = '', this.isComplete = false});

  List<Object> get props => [id!];

  static ToDo fromJson(dynamic input) {
    return ToDo(
        id: input['id'],
        task: input['task'] ?? '',
        isComplete: input['is_complete'] ?? false);
  }

  Map<String, dynamic> toMap() {
    return {
      if(id != null) 'id': id,
      'task': task,
      'is_complete': isComplete,
    };
  }

  ToDo copyWith({int? id, String? task, bool? isComplete}) => ToDo(
    id: id ?? this.id,
    task: task ?? this.task,
    isComplete: isComplete ?? this.isComplete
  );

}
