class Class {
  final String? classId;
  final String? className;

  Class({this.classId, this.className});

  factory Class.fromMap(Map map) {
    return Class(
      classId: map['classId'],
      className: map['className'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'classId': classId,
      'className': className,
    };
    return row;
  }
}

class ClassList {
  final List<Class> classList;

  ClassList({required this.classList});
  factory ClassList.fromMap(List data) {
    List<Class> classes = [];
    classes = data.map((i) => Class.fromMap(i)).toList();
    return ClassList(classList: classes);
  }
}
