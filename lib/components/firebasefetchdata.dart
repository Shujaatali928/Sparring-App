import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> fetchUserData(String userId) async {
  try {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userSnapshot.exists) {
      // User data exists, access the data using userSnapshot.data()
      var userData = userSnapshot.data() as Map<String, dynamic>;
      // Access specific fields from userData
      String fullName = userData['fullName'];
      String email = userData['email'];
      String location = userData['location'];
      List<dynamic> categories = userData['categories'];
      categories = categories.map((item) => item.toString()).toList();
      List<dynamic> experiencelevel = userData['experiencelevel'];
      experiencelevel = experiencelevel.map((item) => item.toString()).toList();
      List<dynamic> agegroup = userData['agegroup'];
      agegroup = agegroup.map((item) => item.toString()).toList();
      List<dynamic> Sex = userData['Sex'];
      Sex = Sex.map((item) => item.toString()).toList();
      // Access more fields as needed
    } else {
      // User data does not exist
      print('User data not found');
    }
  } catch (e) {
    print('Error fetching user data: $e');
  }
}
