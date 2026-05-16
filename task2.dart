//section 3
import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];
  int number_Students = 0;

  while (true) {
    print("Enter number of students: ");
    String? input = stdin.readLineSync();

    try {
      number_Students = int.parse(input!);

      if (number_Students > 0) {
        break;
      } else {
        print("Please enter a number greater than 0.");
      }
    } catch (e) {
      print("Invalid input. Please enter a valid number.");
    }
  }
  for (int i = 0; i < number_Students; i++) {
    print("\nStudent ${i + 1}");
    print("Enter student name: ");
    String name = stdin.readLineSync() ?? "Unknown";

    int number_Subjects = 0;

    while (true) {
      print("Enter number of subjects: ");
      String? subjectInput = stdin.readLineSync();

      try {
        number_Subjects = int.parse(subjectInput!);

        if (number_Subjects > 0) {
          break;
        } else {
          print("Number of subjects must be greater than 0.");
        }
      } catch (e) {
        print("Invalid input. Enter a valid number.");
      }
    }

    List<double> grades = [];

    for (int j = 0; j < number_Subjects; j++) {
      while (true) {
        print("Enter grade for subject ${j + 1}: ");
        String? gradeInput = stdin.readLineSync();

        try {
          double grade = double.parse(gradeInput!);

          if (grade >= 0 && grade <= 100) {
            grades.add(grade);
            break;
          } else {
            print("Grade must be between 0 and 100.");
          }
        } catch (e) {
          print("Invalid grade. Please enter a valid number.");
        }
      }
    }

    studentNames.add(name);
    studentGrades.add(grades);
  }

  while (true) {
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    print("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print("\n       ALL RESULTS       ");

        for (int i = 0; i < studentNames.length; i++) {
          List<double> grades = studentGrades[i];

          double average = grades.reduce((a, b) => a + b) / grades.length;

          String letterGrade = getLetterGrade(average);

          print("Name: ${studentNames[i].toUpperCase()}");
          print("Average: ${average.toStringAsFixed(2)}");
          print("Grade: $letterGrade");
        }
        break;

      case '2':
        print("Enter student name to search: ");
        String searchName = stdin.readLineSync()?.toLowerCase() ?? "";

        bool found = false;

        for (int i = 0; i < studentNames.length; i++) {
          if (studentNames[i].toLowerCase() == searchName) {
            List<double> grades = studentGrades[i];

            double average = grades.reduce((a, b) => a + b) / grades.length;

            print("Average Grade: ${average.round()}");

            found = true;
            break;
          }
        }

        if (!found) {
          print("Student not found.");
        }

        break;

      case '3':
        print("Program terminated.");
        return;

      default:
        print("Invalid option. Please choose 1, 2, or 3.");
    }
  }
}

String getLetterGrade(double average) {
  if (average >= 90) {
    return 'A';
  } else if (average >= 80) {
    return 'B';
  } else if (average >= 70) {
    return 'C';
  } else {
    return 'F';
  }
}
