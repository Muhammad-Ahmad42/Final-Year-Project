import 'package:firebase_database/firebase_database.dart';
import 'package:wildscan/features/home/model/feedback_model.dart';

class FeedbackRepository {
  static final FeedbackRepository instance = FeedbackRepository._internal();
  FeedbackRepository._internal();

  final _db = FirebaseDatabase.instance.ref('feedbacks');

  Future<void> submitFeedback(FeedbackModel feedback) async {
    await _db.push().set(feedback.toJson());
  }
}
