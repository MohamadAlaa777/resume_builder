import 'package:flutter/material.dart';
import 'package:resume_builder/models/personal_info.dart';
import 'package:resume_builder/models/work_experience.dart';

class ResumeProvider with ChangeNotifier {
  final TextEditingController personalInfoNameController =
      TextEditingController();
  final TextEditingController personalInfoEmailController =
      TextEditingController();
  final TextEditingController personalInfoPhoneController =
      TextEditingController();
  final TextEditingController personalInfoAddressController =
      TextEditingController();
  final TextEditingController workExperienceCompanyController =
      TextEditingController();
  final TextEditingController workExperiencePositionController =
      TextEditingController();
  final TextEditingController workExperienceDurationController =
      TextEditingController();
  PersonalInfo _personalInfo =
      PersonalInfo(name: '', email: '', phone: '', address: '');
  final List<WorkExperience> _workExperiences = [];

  PersonalInfo get personalInfo => _personalInfo;
  List<WorkExperience> get workExperiences => _workExperiences;

  void setPersonalInfo() {
    _personalInfo = PersonalInfo(
      name: personalInfoNameController.text.trim(),
      email: personalInfoEmailController.text.trim(),
      phone: personalInfoPhoneController.text.trim(),
      address: personalInfoAddressController.text.trim(),
    );
    notifyListeners();
  }

  void addWorkExperience() {
    _workExperiences.add(
      WorkExperience(
        company: workExperienceCompanyController.text.trim(),
        position: workExperiencePositionController.text.trim(),
        duration: workExperienceDurationController.text.trim(),
      ),
    );
    notifyListeners();
    workExperienceCompanyController.clear();
    workExperiencePositionController.clear();
    workExperienceDurationController.clear();
  }

  void removeWorkExperience(int index) {
    _workExperiences.removeAt(index);
    notifyListeners();
  }
}
