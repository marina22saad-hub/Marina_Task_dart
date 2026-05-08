import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const FlutterUITask(),
    );
  }
}

class FlutterUITask extends StatelessWidget {
  const FlutterUITask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter UI Task"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade700,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/girl.jpeg'),
              ),

              const SizedBox(height: 20),

              const Text(
                "Welcome to Flutter",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 10),

              Icon(Icons.star, color: Colors.pink.shade400, size: 60),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.pink.shade100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.pink.shade300),
                    ),
                    const TextField(
                      decoration: InputDecoration(hintText: "Enter your email"),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      "Password",
                      style: TextStyle(color: Colors.pink.shade300),
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "****"),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade600,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
