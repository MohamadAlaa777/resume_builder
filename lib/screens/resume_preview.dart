import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/resume_provider.dart';

class ResumePreview extends StatelessWidget {
  const ResumePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResumeProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Resume Preview",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Name: ${provider.personalInfo.name}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Email: ${provider.personalInfo.email}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Phone: ${provider.personalInfo.phone}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Address: ${provider.personalInfo.address}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Work Experience',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  ...provider.workExperiences.map(
                    (work) {
                      return ListTile(
                        title: Text(work.company),
                        subtitle: Text(
                          '${work.position} - ${work.duration}',
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
