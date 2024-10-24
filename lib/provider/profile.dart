import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import '../models/profile.dart'; // Assuming the Profile class is saved here
import 'package:esoger/utils/handle_error.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, Profile?>((ref) {
  return ProfileNotifier();
});

class ProfileNotifier extends StateNotifier<Profile?> {
  ProfileNotifier() : super(null);

  final _storage = const FlutterSecureStorage();

  // Load Profile from secure storage
  Future<void> loadProfile() async {
    String? profileJson = await _storage.read(key: 'profile');
    if (profileJson != null) {
      state = Profile.fromJson(jsonDecode(profileJson));
    }
  }

  // Save the entire Profile to secure storage
  Future<void> saveProfile(Profile profile) async {
    state = profile;
    await _storage.write(key: 'profile', value: jsonEncode(profile.toJson()));
  }

  // Clear Profile from state and storage
  Future<void> clearProfile() async {
    state = null;
    await _storage.delete(key: 'profile');
  }

  // Method to update a specific field of the Profile
  // Future<void> updateProfileField(String field, dynamic value) async {
  //   if (state != null) {
  //     Profile updatedProfile = state!;

  //     // Dynamically update fields based on the 'field' string
  //     switch (field) {
  //       case 'fullName':
  //         updatedProfile = updatedProfile.copyWith(fullName: value as String);
  //         break;
  //       case 'email':
  //         updatedProfile = updatedProfile.copyWith(email: value as String);
  //         break;
  //       case 'username':
  //         updatedProfile = updatedProfile.copyWith(username: value as String);
  //         break;
  //       case 'phone':
  //         updatedProfile = updatedProfile.copyWith(phone: value as String);
  //         break;
  //       case 'bio':
  //         updatedProfile = updatedProfile.copyWith(bio: value as String?);
  //         break;
  //       case 'status':
  //         updatedProfile = updatedProfile.copyWith(status: value as String);
  //         break;
  //       case 'isAdmin':
  //         updatedProfile = updatedProfile.copyWith(isAdmin: value as bool);
  //         break;
  //       case 'profilePicture':
  //         updatedProfile = updatedProfile.copyWith(profilePicture: value as String?);
  //         break;
  //       case 'plan':
  //         updatedProfile = updatedProfile.copyWith(plan: value as String);
  //         break;
  //       case 'cardDetails':
  //         updatedProfile = updatedProfile.copyWith(cardDetails: value as String);
  //         break;
  //       default:
  //         throw CustomError('Invalid field name');
  //     }

  //     // Save the updated profile to secure storage
  //     state = updatedProfile;
  //     await saveProfile(updatedProfile);
  //   }
  // }
}
