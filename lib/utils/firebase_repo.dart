// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// final employeeRepository =
//     Provider<EmployeeAuthentication>((_) => EmployeeAuthentication(_));

// class EmployeeAuthentication {
//   final Ref read;
//   EmployeeAuthentication(this.read);


 



//   Future<List<Employee>> getEmployeeList() async {
//     final firebase = FirebaseFirestore.instance;

//     try {
//       List<Employee> employeeList = [];
//       final result = await firebase.collection('employee').get();

//       for (var element in result.docs) {
//         //  employeeList.add(element as Employee);
//         employeeList.add(Employee.fromMap(element.data()));
//       }
//       return employeeList;
//     } catch (e) {
//       // print(e);
//       return [];
//     }
//   }



 
  
// }
