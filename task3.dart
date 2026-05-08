// Set<String> students = {};

// Map<String, List<double>> studentCourses = {};

// void main() {
//   addStudent("Ali");
//   addStudent("Mona");
//   addStudent("Sara");

//   Set<String> newStudents = {"Omar", "Laila"};
//   students = {...students, ...newStudents};

//   print("=== Lambda print ===");
//   students.forEach((s) => print(s));

//   print("\n=== Recursive print ===");
//   printStudents(students.toList(), 0);

//   //  PART 2 
//   addCourse("Mina", "Math", grade: 90);
//   addCourse("Mina", "Science", grade: 80);
//   addCourse("Marina", "Math", grade: 70);
//   addCourse("Marina", "Science", grade: 60);

//   print("\n    Averages    ");
//   print("Mina Average: ${averageGrade("Mina")}");
//   print("Marina Average: ${averageGrade("Marina")}");
// }

// void addStudent(String name) {
//   students.add(name);
// }


// void printStudents(List<String> list, int index) {
//   if (index == list.length) return;

//   print(list[index]);
//   printStudents(list, index + 1);
// }
// void addCourse(String name, String course, {double grade = 0}) {
//   if (!studentCourses.containsKey(name)) {
//     studentCourses[name] = [];
//   }

//   studentCourses[name]!.add(grade);
// }

// double averageGrade(String name) {
//   List<double> grades = studentCourses[name] ?? [];

//   if (grades.isEmpty) return 0;

//   double sum = grades.reduce((a, b) => a + b);

//   return sum / grades.length;
// }
//رجوع