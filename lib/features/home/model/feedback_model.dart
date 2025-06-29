class FeedbackModel {
  final String userId;
  final String email;
  final String message;
  final String timestamp;

  FeedbackModel({
    required this.userId,
    required this.email,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'feedback': message,
      'timestamp': timestamp,
    };
  }

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      userId: json['userId'] ?? '',
      email: json['email'] ?? '',
      message: json['feedback'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }
}
