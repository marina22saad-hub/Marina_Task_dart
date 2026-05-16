//section 4

import 'dart:io';

Set<String> students = {};
Map<String, Map<String, int>> studentCourses = {};
void addStudent(String name) {
  students.add(name);
}

void printStudents(List<String> list, int index) {
  if (index >= list.length) return;
  print(list[index]);
  printStudents(list, index + 1);
}

void addCourse(String student, String course, [int grade = 0]) {
  if (!studentCourses.containsKey(student)) {
    studentCourses[student] = {};
  }
  studentCourses[student]![course] = grade;
}

double averageGrade(String student) {
  var courses = studentCourses[student];

  if (courses == null || courses.isEmpty) {
    return 0;
  }
  int total = courses.values.reduce((a, b) => a + b);
  return total / courses.length;
}

void main() {
  addStudent("Marina");
  addStudent("Main");
  addStudent("Saad");
  print("Students using forEach:");
  students.forEach((s) => print(s));
  print("\nRecursive Print:");
  printStudents(students.toList(), 0);
  Set<String> newStudents = {"Mona", "Khaled"};
  students = {...students, ...newStudents};
  print("\nAfter Merge:");
  students.forEach((s) => print(s));

  addCourse("Marina", "Math", 90);
  addCourse("Marina", "Physics", 80);
  addCourse("Main", "Chemistry", 70);
  addCourse("Saad", "Biology", 95);
  addCourse("Marina", "English", 85);
  print("\nAverage Grades:");
  studentCourses.forEach((student, courses) {
    print("$student average = ${averageGrade(student)}");
  });
}
