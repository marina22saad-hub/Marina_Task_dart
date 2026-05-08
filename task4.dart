void main() {
  Developer dev = Developer(name: "Ahmed", age: 25, salary: 8000);

  print("University: ${Person.universityName}");

  dev.showInfo();
  dev.programming();
  dev.communication();
}

class Person {
  String name;
  int age;

  static String universityName = "Sohag University";

  Person(this.name, this.age);

  int get getAge => age;

  set setAge(int value) {
    if (value > 0) {
      age = value;
    }
  }
}

class Employee extends Person {
  double salary;

  Employee(String name, int age, this.salary) : super(name, age);

  void showInfo() {
    print("Name: $name");
    print("Age: $age");
    print("Salary: $salary");
  }
}

abstract class Skills {
  void programming();
  void communication();
}

class Developer extends Employee implements Skills {
  Developer({required String name, required int age, required double salary})
    : super(name, age, salary) {
    this.name = name;
    this.age = age;
    this.salary = salary;
  }

  @override
  void programming() {
    print("Programming skill: Dart developer");
  }

  @override
  void communication() {
    print("Communication skill: Good team communication");
  }
}
