class Profile {
  final String userId; // Corresponds to 'user_id'
  final String fullName; // Merged 'firstName' and 'lastName' as 'fullname'
  final String email; // Email field
  final String username; // Username field
  final String password; // Password field (hashed)
  final String phone; // Phone number
  final String? bio; // Optional bio (nullable)
  final String status; // Status (active)
  final String plan; // Plan (e.g., 'diamond')
  final String isAdmin; // Admin status (boolean)
  final String? profilePicture; // Profile picture (nullable)
  final DateTime dateJoined; // Date the user joined
  final String cardDetails; // Card details (e.g., 'none')

  Profile(
      {required this.userId,
      required this.fullName,
      required this.email,
      required this.username,
      required this.password,
      required this.phone,
      this.bio,
      required this.status,
      required this.plan,
      required this.isAdmin,
      this.profilePicture,
      required this.dateJoined,
      required this.cardDetails});

  // Factory method to create an instance of Profile from JSON data
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      userId: json['user_id'],
      fullName: json['fullname'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      phone: json['phone'],
      bio: json['bio'],
      status: json['status'],
      plan: json['plan'],
      isAdmin: json['is_admin'],
      profilePicture: json['profile_picture'],
      dateJoined: DateTime.parse(json['date_joined']),
      cardDetails: json['card_details'],
    );
  }

  // Method to convert an instance of Profile to JSON format
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'fullname': fullName,
      'email': email,
      'username': username,
      'password': password,
      'phone': phone,
      'bio': bio,
      'status': status,
      'plan': plan,
      'is_admin': isAdmin,
      'profile_picture': profilePicture,
      'date_joined': dateJoined.toIso8601String(),
      'card_details': cardDetails,
    };
  }
}
