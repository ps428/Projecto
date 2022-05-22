import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser {
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  static CollectionReference projects =
      FirebaseFirestore.instance.collection('projects');
  static CollectionReference profiles =
      FirebaseFirestore.instance.collection('profiles');

  static Future<void> addUser(
      String uID, String fullName, String phoneNumber, String email) async {
    // Call the user's CollectionReference to add a new user
    users
        .doc(uID)
        .set({
          'uID': uID, // John Doe
          'full_name': fullName, // John Doe
          'phone': phoneNumber, // 42
          'email': email // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

    projects
        .doc(uID)
        .set({'zzz': '1'})
        .then((value) => print("Project DB Added"))
        .catchError((error) => print("Failed to add user: $error"));

    profiles
        .doc(uID)
        .set({'zzz': '1'})
        .then((value) => print("profile db created"))
        .catchError((error) => print("Failed to add user: $error"));
  }

//-----------------------------------------------------------------------------------

  static Future<void> addProjecct(
      String? uID,
      String? Title,
      String? Description,
      String? Category,
      String? startData,
      String? endDate) async {
    Map<String, dynamic>? newProject = {
      "Title": Title,
      "Description": Description,
      "Category": Category,
      "StartData": startData,
      "EndDate": endDate
    };

    Map<String, dynamic>? projectJSON = {Title!: newProject};
    projects.doc(uID).update(projectJSON);
  }

  static Future<List<List<String>>> getProjects(String? uID) async {
    // var data = await collection.doc(uID).get();
    // print(data.data());
    // var mappedData = await data.data();
    // mappedData?.forEach((key, value) {}
    List<List<String>> tmpReturnList = [];

    var data =
        await FirebaseFirestore.instance.collection('projects').doc(uID).get();
    print(data.data());
    if (data.data() == null) {
      return [];
    }
    var mappedData = await data.data();
    if (mappedData!.isEmpty) {
      return tmpReturnList;
    }
    mappedData.forEach((key, value) {
      var hashedData = HashMap.from(value);
      print(hashedData);

      var listData = hashedData
          .toString()
          .substring(1, hashedData.toString().length - 1)
          .split(", ")
        ..sort();
      // listData.sort();
      print(listData);

      var category = listData[0].split(": ")[1];
      var description = listData[1].split(": ")[1];
      var endDate = listData[2].split(": ")[1];
      var startDate = listData[3].split(": ")[1];
      var title = listData[4].split(": ")[1];

      var finalList = [title, description, category, startDate, endDate];
      tmpReturnList.add(finalList);
    });
    print(tmpReturnList);
    return tmpReturnList;
  }

  static Future<Map<String, String>> getProfile(String? uID) async {
    Map<String, String> returnData = {};

    // var data = await profiles.doc(uID).get();
    // print(data.data());

    // var listData = data
    //     .data()
    //     .toString()
    //     .substring(1, data.data().toString().length - 1)
    //     .split(", ")
    //   ..sort();
    // // listData.sort();
    // print(listData);

    // returnData = {
    //   'name': listData[0].split(": ")[1],
    //   'address':listData[1].split(": ")[1],
    //   'city':listData[2].split(": ")[1],
    //   'comapny':listData[1].split(": ")[1],
    //   'country':listData[1].split(": ")[1],
    //   'email':listData[1].split(": ")[1],
    //   'occupation':listData[1].split(": ")[1],
    //   'phoneNumber':listData[1].split(": ")[1],

    // };
    var data2 =
        await FirebaseFirestore.instance.collection('profiles').doc(uID).get();
    print(data2.data());
    var mappedData = await data2.data();
    mappedData!.forEach((key, value) {
      returnData[key] = value;
    });
    print(mappedData);
    return returnData;
  }

  static Future<void> updateProfile(
      String? uID,
      String? name,
      String? email,
      String? phoneNumber,
      String? address,
      String? city,
      String? state,
      String? pincode,
      String? country,
      String? company,
      String? occupation,
      String? yearsOfExperience) async {
    var data;
    data = {
      "Name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "city": city,
      "state": state,
      "pincode": pincode,
      "country": country,
      "company": company,
      "occupation": occupation,
      "yearsOfExperience": yearsOfExperience
    };
    profiles.doc(uID).set(data);
  }

  static Future<void> sendOTP(String? phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    //For naive
    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: '+91' + phoneNumber!,
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     await auth.signInWithCredential(credential);
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     if (e.code == 'invalid-phone-number') {
    //       print('The provided phone number is not valid.');
    //     }
    //   },
    //   codeSent: (String verificationId, int? resendToken) async {
    //     // Update the UI - wait for the user to enter the SMS code
    //     String smsCode = 'xxxx';

    //     // Create a PhoneAuthCredential with the code
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //         verificationId: verificationId, smsCode: smsCode);

    //     // Sign the user in (or link) with the credential
    //     await auth.signInWithCredential(credential);
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );

    //   ConfirmationResult confirmationResult =
    //       await auth.signInWithPhoneNumber('+91' + phoneNumber!);
    //   UserCredential userCredential = await confirmationResult.confirm('123456');
  }
}
