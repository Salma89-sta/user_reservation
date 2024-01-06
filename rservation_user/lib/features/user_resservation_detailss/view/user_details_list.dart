import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rservation_user/colors/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../common/button.dart';
import '../../../common/check_list_widget.dart';
import '../../../common/form_date_widget.dart';
import '../../../common/text-form-field.dart';
import 'attachment_pickker.dart';

class UserDetailsList extends StatelessWidget {
  TextEditingController _nameEditingController= TextEditingController();
  TextEditingController _phoneEditingController= TextEditingController();
  TextEditingController _attuEditingController= TextEditingController();


  String totalSalary="100";

  UserDetailsList({Key? key}) : super(key: key);
  static List<String> status=[
    "متزوج",
    "أعزب"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white,),),
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text("استكمال بيانات الحجز", style: TextStyle(color: Colors.white, fontFamily: 'Cairo', fontWeight: FontWeight.bold),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:15),

            Padding(
              padding: const EdgeInsets.only(right: 50.0, bottom: 10),
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  "الاسم",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.lightGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Container(
              child: TextFormFieldWidget(
                labelText: "",
                prefix: null,
                suffix: Icon(
                  Icons.perm_identity,
                  color: AppColors.lightGrey,
                ),
                IsObsecure: false,
                textFieldController: _nameEditingController,
                color: AppColors.lightGrey,
                fillcolor: Colors.white,
              ),
            ),
            SizedBox(height:15),

            Padding(
              padding: const EdgeInsets.only(right: 50.0, bottom: 10),
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  "رقم الهاتف",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.lightGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              child: TextFormFieldWidget(
                labelText: "",
                prefix: null,
                suffix: Icon(
                  Icons.call,
                  color: AppColors.lightGrey,
                ),
                IsObsecure: false,
                textFieldController: _phoneEditingController,
                color: AppColors.lightGrey,
                fillcolor: Colors.white,
              ),
            ),
            SizedBox(height:15),

            Padding(
              padding: const EdgeInsets.only(right: 50.0, bottom: 10),
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  "الحاله الاجتماعيه",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.lightGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // DropDownListWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                alignment: AlignmentDirectional.topEnd,
                width: 80.w,
                height: 10.h,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      "الحالة الاجتماعية",
                      style: TextStyle(color: AppColors.lightGrey),
                    ),
                    items: status.map((value) {
                      return DropdownMenuItem<int>(
                        value: status.indexOf(value),
                        child: Container(
                          width: 80.w,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontFamily: 'Cairo',
                              fontSize: 19.sp
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (int? value) {
                      // Perform actions when the selected value changes
                    },
                  ),
                ),
              ),
            ),

            SizedBox(height:15),

            Padding(
              padding: const EdgeInsets.only(right: 50.0, bottom: 10),
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  " من  تارخ ",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.lightGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            DateSelectionField(
              fillcolor: Colors.white,),
            // SizedBox(height:15),
            Padding(
              padding: const EdgeInsets.only(right: 50.0, bottom: 10),
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  " الي  تاريخ  ",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.lightGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            DateSelectionField(fillcolor: Colors.white,),
            Padding(
              padding: const EdgeInsets.only(right: 50.0, bottom: 10),
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  " مرفقات ",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.lightGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            AttachmentPickerWidget(),
            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.only(right: 50.0, bottom: 10),
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  "الاضافات",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.lightGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            ChecklistPage(checklistItems: ['كراسي',"ترابيزات","جاتوه"],),
            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.only(right: 50.0, bottom: 10),
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${totalSalary}", style: TextStyle(color: Colors.indigo, fontSize: 20.sp, fontFamily: 'Cairo'),),

                    Text(
                      " : السعر ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: AppColors.lightGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Button0(widget:Center(child: Text("حجز", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo', fontSize: 20.sp, fontWeight: FontWeight.bold),)),
               function: null,),
            SizedBox(height: 15,),



          ],
        ),
      ),
    );
  }
}


