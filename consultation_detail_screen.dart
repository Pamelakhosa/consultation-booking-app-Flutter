import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/consultation_provider.dart';



class ConsultationDetailScreen extends StatelessWidget {
  final int index;

  const ConsultationDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final consultation =
        Provider.of<ConsultationProvider>(context).consultations[index];

    return Scaffold(
      appBar: AppBar(title: const Text("Consultation Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date: ${consultation.date}"),
            Text("Time: ${consultation.time}"),
            Text("Description: ${consultation.description}"),
            Text("Topic: ${consultation.topic}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: const Text("Delete Consultation"),
                        content: const Text(
                          "Are you sure you want to delete this consultation?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<ConsultationProvider>(
                                context,
                                listen: false,
                              ).deleteConsultation(index);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                );
              },
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
