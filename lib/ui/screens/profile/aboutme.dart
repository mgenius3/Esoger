import 'package:esoger/provider/profile.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/alert/index.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:esoger/services/api/api_service.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class AboutMePage extends ConsumerStatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends ConsumerState<AboutMePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _bioController = TextEditingController();
  ApiService apiService = ApiService();

  File? _profileImage;

  // Image picker function
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  bool validateForm() {
    return _formKey.currentState!.validate();
  }

  void _submit() async {
    var profile = ref.watch(profileProvider);

    // Check if profile picture is selected
    if (_profileImage == null) {
      Fluttertoast.showToast(msg: "Please select a profile picture.");
      return;
    }

    if (!validateForm()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Creating form data
      final formData = FormData();

      // Add profile picture
      formData.files.add(
        MapEntry(
          'profile_picture',
          await MultipartFile.fromFile(
            _profileImage!.path,
            filename: 'profile_picture.jpg',
          ),
        ),
      );

      // Add other form fields
      formData.fields.addAll([
        MapEntry('full_name', _fullNameController.text.trim()),
        MapEntry('email', _emailController.text.trim()),
        MapEntry('bio', _bioController.text.trim()),
      ]);

      // Send the form data to the API
      Map responseData = await apiService.postFormData(
          "settings?id=${profile!.userId}", formData);

      print(responseData);

      if (responseData["error"] != null) {
        Fluttertoast.showToast(msg: '${responseData['error']}');
      } else {
        Fluttertoast.showToast(msg: responseData['data']['message']);
        context.pop();
      }
    } catch (err) {
      Fluttertoast.showToast(msg: err.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    var profile = ref.watch(profileProvider);
    _fullNameController.text = profile!.fullName;
    _emailController.text = profile.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  backNavigation(context),
                  const SizedBox(width: 10),
                  const Text(
                    "About Me",
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Profile Image Section
              Center(
                  child: GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!) as ImageProvider
                            : const AssetImage('assets/default_profile.png'),
                        child: _profileImage == null
                            ? Icon(Icons.camera_alt, size: 50)
                            : null,
                      ))),
              const SizedBox(height: 20),

              // Other Form Fields
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),

              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(
                  labelText: "Bio",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 50.0),

              // Submit Button
              CustomPrimaryButton(
                onPressed: _isLoading ? () {} : _submit,
                color: primaryColor,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
