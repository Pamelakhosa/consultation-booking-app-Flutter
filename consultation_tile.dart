import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/consultation_provider.dart';
import '../screens/consultation_detail_screen.dart';



class ConsultationTile extends StatelessWidget {
  final int index;

  const ConsultationTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final consultation =
        Provider.of<ConsultationProvider>(context).consultations[index];

    return Card(
      child: ListTile(
        title: Text(consultation.description),
        subtitle: Text("${consultation.date} • ${consultation.time}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ConsultationDetailScreen(index: index),
            ),
          );
        },
      ),
    );
  }
}
