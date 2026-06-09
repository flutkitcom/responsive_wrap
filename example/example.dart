import 'package:flutter/material.dart';
import 'package:responsive_wrap/responsive_wrap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResponsiveWrap Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const ResponsiveWrapExample(),
    );
  }
}

class ResponsiveWrapExample extends StatelessWidget {
  const ResponsiveWrapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ResponsiveWrap Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ResponsiveWrap(
          breakpoints: {576: 1, 768: 2},
          columnRatios: const [0.7, 0.3],
          spacing: 16,
          runSpacing: 16,
          children: const [
            DemoContainer(text: 'Main Content', color: Colors.blue),
            DemoContainer(text: 'Sidebar', color: Colors.green),
          ],
        ),
      ),
    );
  }
}

class DemoContainer extends StatelessWidget {
  const DemoContainer({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
