import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/widgets/gradient_background.dart';

import '../providers/resume_provider.dart';

class WorkExperienceForm extends StatelessWidget {
  const WorkExperienceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Consumer<ResumeProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Work Experience",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: GradientBackground(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: provider.workExperienceCompanyController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'Company',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the company name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: provider.workExperiencePositionController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'Position',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your position';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: provider.workExperienceDurationController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'Duration',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the duration';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        provider.addWorkExperience();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Add Experience",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.workExperiences.length,
                      itemBuilder: (context, index) {
                        final work = provider.workExperiences[index];
                        return ListTile(
                          title: Text(work.company),
                          textColor: Colors.white,
                          subtitle: Text(
                            '${work.position} - ${work.duration}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.white,
                            onPressed: () {
                              provider.removeWorkExperience(index);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/resume_preview');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Preview Resume"),
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
