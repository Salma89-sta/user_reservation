// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:rservation_user/common/button.dart';
//
// class ChecklistPage extends StatefulWidget {
//   @override
//   _ChecklistPageState createState() => _ChecklistPageState();
// }
//
// class _ChecklistPageState extends State<ChecklistPage> {
//   List<dynamic> checklistItems = ['nm','nn','nnoi','pip']; // List to store the checklist items
//   List<dynamic> selectedItems = []; // List to store the selected items
//
//   @override
//   void initState() {
//     super.initState();
//     // fetchData(); // Fetch data from API when the page loads
//   }
//
//   // Future<void> fetchData() async {
//   //   // Make an HTTP request to fetch data from the API
//   //   final response = await http.get(Uri.parse('https://your-api-endpoint.com/checklist'));
//   //
//   //   if (response.statusCode == 200) {
//   //     // Parse the JSON response
//   //     final data = jsonDecode(response.body);
//   //
//   //     setState(() {
//   //       checklistItems = data['items'];
//   //     });
//   //   } else {
//   //     // Handle error if the API request fails
//   //     print('Failed to fetch data: ${response.statusCode}');
//   //   }
//   // }
//
//   void toggleItemSelection(int index, bool value) {
//     setState(() {
//       if (value) {
//         selectedItems.add(checklistItems[index]);
//       } else {
//         selectedItems.remove(checklistItems[index]);
//       }
//     });
//   }
//
//   void saveSelectedData() {
//     // Perform actions to save the selected data
//     print('Selected Items: $selectedItems');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: 80.w,
//       child: Column(
//           children: [
//             Container(
//               width: 80.w,
//               child: ListView.builder(
//                 itemCount: checklistItems.length,
//                 itemBuilder: (context, index) {
//                   final item = checklistItems[index];
//
//                   return CheckboxListTile(
//                     title: Text(item['title']),
//                     value: selectedItems.contains(item),
//                     onChanged: (value) {
//                       toggleItemSelection(index, value!);
//                     },
//                   );
//                 },
//               ),
//             ),
//             Button0(buttonText: "buttonText", function: saveSelectedData),
//           ],
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rservation_user/common/button.dart';

class ChecklistPage extends StatefulWidget {
  List<String> checklistItems ; // List to store the checklist items
  ChecklistPage({required this.checklistItems});

  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  List<String> selectedItems = []; // List to store the selected items

  void toggleItemSelection(int index, bool value) {
    setState(() {
      final item = widget.checklistItems[index];
      if (value) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }

  void saveSelectedData() {
    // Perform actions to save the selected data
    print('Selected Items: $selectedItems');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      child: Column(
        children: [
          Container(
            height: 30.h,
            child: ListView.builder(
              itemCount: widget.checklistItems.length,
              itemBuilder: (context, index) {
                final item = widget.checklistItems[index];

                return CheckboxListTile(
                  title: Text(item, style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 20.sp),),
                  value: selectedItems.contains(item),
                  onChanged: (value) {
                    toggleItemSelection(index, value!);
                  },
                );
              },
            ),
          ),
          // Button0(buttonText: "buttonText", function: saveSelectedData),
        ],
      ),
    );
  }
}