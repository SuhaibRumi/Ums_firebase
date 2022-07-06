import 'package:cloud_firestore/cloud_firestore.dart';

class Class {
  final String? classId;
  final String? className;


  

  Class({this.classId, this.className,
  });

  factory Class.fromMap(DocumentSnapshot map) {
    // print(map.data());
    return Class(
      classId: map.id,
      className: map['className'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'className': className,
    };
    return row;
  }
}

class ClassList {
  final List<Class> classList;
  ClassList({required this.classList});
  factory ClassList.fromJson(List data) {
    List<Class> classes = [];
    classes = data.map((i) => Class.fromMap(i)).toList();
    return ClassList(classList: classes);
  }
}
