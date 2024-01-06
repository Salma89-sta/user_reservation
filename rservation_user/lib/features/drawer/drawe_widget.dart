import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rservation_user/core/cache_helper/cache_helper.dart';
import 'package:rservation_user/features/categories/business_layer/categories_cubit.dart';
import 'package:rservation_user/features/categories/view/all_categories_wisget.dart';
import 'package:rservation_user/features/home/view/home_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  File? image;
String  email =CacheHelper.getData(key: 'email');
 String name= CacheHelper.getData(key: 'name');
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "${name}",
              style: TextStyle(fontSize: 20.sp, fontFamily: 'Cairo'),
            ),
            accountEmail: Text(
              "${email}",
              style: TextStyle(fontSize: 16.sp, fontFamily: 'Cairo'),
            ),
            currentAccountPicture: InkWell(
              onTap:_pickImage ,
              child: CircleAvatar(
                child: ClipOval(
                  child: image != null ? Image.file(image!) : _buildPlaceholderIcon(),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrange
            ),

          ),
          ListTile(
            title: const Text('حجوزاتي', style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
            onTap: () {
              setState(() {});
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
            },
            leading: const Icon(Icons.format_list_bulleted),

          ),
          ListTile(
            title: const Text('المنشآت ',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
            onTap: () {
              setState(() {});
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
       ViewCategoriesScreen(),

                              ),
                            );
            },
            leading: const Icon(Icons.home_outlined),

          ),
          ListTile(
            title: const Text('تسجيل الخروج',style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),),
            onTap: () {},
            leading: const Icon(Icons.output_outlined),

          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return const Icon(
      Icons.person,
      size: 64,
      color: Colors.deepOrange,
    );
  }

  Future<void> _pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      final imageTemp = File(pickedImage.path);
      setState(() => image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}