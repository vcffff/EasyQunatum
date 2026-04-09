import 'package:easyquantum/bloc/navigation_bloc.dart';
import 'package:easyquantum/bloc/navigation_event.dart';
import 'package:easyquantum/data/qunatum_topics.dart';
import 'package:easyquantum/pages/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Topics extends StatelessWidget {
  const Topics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'EasyQuant',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.deepPurple[300],
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(
                  topic['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(topic['description']!),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => HomeScreen(
                            formula:
                                topic['formula'] ?? "no data about formula",
                            info: {
                              'title': topic['title'] ?? 'nothing',
                              'note': topic['note'] ?? 'no',
                              'example': topic['example'] ?? 'example',
                            },
                          ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
