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

import 'dart:io';
import 'dart:math';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  // =========================
  // Number of Students
  // =========================
  int numberOfStudents = 0;

  while (true) {
    try {
      stdout.write("Enter number of students: ");
      numberOfStudents = int.parse(stdin.readLineSync()!);

      if (numberOfStudents <= 0) {
        print("Please enter a number greater than 0.\n");
        continue;
      }

      break;
    } catch (e) {
      print("Invalid input. Please enter a valid integer.\n");
    }
  }

  // =========================
  // Input Students Data
  // =========================
  for (int i = 0; i < numberOfStudents; i++) {
    print("\nStudent ${i + 1}");

    // Student Name
    stdout.write("Enter student name: ");
    String name = stdin.readLineSync()!;

    // Number of Subjects
    int numberOfSubjects = 0;

    while (true) {
      try {
        stdout.write("Enter number of subjects: ");
        numberOfSubjects = int.parse(stdin.readLineSync()!);

        if (numberOfSubjects <= 0) {
          print("Subjects must be greater than 0.");
          continue;
        }

        break;
      } catch (e) {
        print("Invalid number.");
      }
    }

    // Grades List
    List<double> grades = [];

    for (int j = 0; j < numberOfSubjects; j++) {
      while (true) {
        try {
          stdout.write("Enter grade for subject ${j + 1}: ");
          double grade = double.parse(stdin.readLineSync()!);

          if (grade < 0 || grade > 100) {
            print("Grade must be between 0 and 100.");
            continue;
          }

          grades.add(grade);
          break;
        } catch (e) {
          print("Invalid grade.");
        }
      }
    }

    studentNames.add(name);
    studentGrades.add(grades);
  }

  // =========================
  // Infinite Menu Loop
  // =========================
  while (true) {
    print("\n========== MENU ==========");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    stdout.write("Choose an option: ");

    int choice;

    try {
      choice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Invalid choice.");
      continue;
    }

    // =========================
    // Show All Results
    // =========================
    if (choice == 1) {
      print("\n===== STUDENT RESULTS =====");

      for (int i = 0; i < studentNames.length; i++) {
        double sum = 0;

        for (double grade in studentGrades[i]) {
          sum += grade;
        }

        double average = sum / studentGrades[i].length;

        String letterGrade;

        if (average >= 85) {
          letterGrade = "A";
        } else if (average >= 70) {
          letterGrade = "B";
        } else if (average >= 50) {
          letterGrade = "C";
        } else {
          letterGrade = "F";
        }

        print(
          "Name: ${studentNames[i].toUpperCase()} | Average: ${average.toStringAsFixed(2)} | Grade: $letterGrade",
        );
      }
    }
    // =========================
    // Search Student
    // =========================
    else if (choice == 2) {
      stdout.write("Enter student name to search: ");
      String searchName = stdin.readLineSync()!;

      bool found = false;

      for (int i = 0; i < studentNames.length; i++) {
        if (studentNames[i].toLowerCase() == searchName.toLowerCase()) {
          double sum = 0;

          for (double grade in studentGrades[i]) {
            sum += grade;
          }

          double average = sum / studentGrades[i].length;

          print("${studentNames[i]} average grade = ${average.round()}");

          found = true;
          break;
        }
      }

      if (!found) {
        print("Student not found.");
      }
    }
    // =========================
    // Exit
    // =========================
    else if (choice == 3) {
      print("Program terminated.");
      break;
    }
    // =========================
    // Invalid Choice
    // =========================
    else {
      print("Invalid menu option.");
    }
  }
}
