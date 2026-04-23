import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/consultation.dart';
import '../providers/consultation_provider.dart';


class AddConsultationScreen extends StatefulWidget {
  const AddConsultationScreen({super.key});

  @override
  State<AddConsultationScreen> createState() => _AddConsultationScreenState();
}

class _AddConsultationScreenState extends State<AddConsultationScreen> {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final descController = TextEditingController();
  final topicController = TextEditingController();

  void _saveConsultation() {
    final newConsultation = Consultation(
      date: dateController.text,
      time: timeController.text,
      description: descController.text,
      topic: topicController.text,
    );

    Provider.of<ConsultationProvider>(
      context,
      listen: false,
    ).addConsultation(newConsultation);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Consultation added successfully!")),
    );

    Navigator.pop(context);
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(
        () => dateController.text = picked.toIso8601String().split('T')[0],
      );
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => timeController.text = picked.format(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Consultation")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: dateController,
              readOnly: true,
              onTap: _pickDate,
              decoration: const InputDecoration(labelText: "Date"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: timeController,
              readOnly: true,
              onTap: _pickTime,
              decoration: const InputDecoration(labelText: "Time"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: topicController,
              decoration: const InputDecoration(labelText: "Topic"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveConsultation,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
