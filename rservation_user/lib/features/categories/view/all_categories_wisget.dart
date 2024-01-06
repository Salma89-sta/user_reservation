
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_layer/categories_cubit.dart';

class ViewCategoriesScreen extends StatelessWidget {
  const ViewCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var categoryCubit = CategoryCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              title: const Text("المنشآت",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Padding(
                padding: EdgeInsets.only(right: 50.w),
                child: IconButton(
                  onPressed: (){},
                  // onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              )),
          body: (state is GetCategoriesLoading)
              ? const Center(child: CircularProgressIndicator(),)
              :  (state is GetCategoriesSuccess)?Expanded(
            child: ListView.builder(
              itemCount: categoryCubit.categories.length,
              itemBuilder: (context, index) {
               
                  return Column(
                    children: [
                      Text(categoryCubit.categories[index].name!),
                      Text(categoryCubit.categories[index].id!)
                    ],
                  
                  );
                
              },
            ),
          ): Container(),          // Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       childAspectRatio: 1.5,
          //       crossAxisSpacing: 25.w,
          //       mainAxisSpacing: 8.h,
          //     ),
          //     itemCount: categoryCubit.categories.length,
          //     itemBuilder: (context, index) {
          //       return InkWell(
          //         onTap: () {
          //           // context.pushNamed(Routes.viewCategoryDetailsScreen,
          //           //     arguments: categoryCubit.categories[index].name!);
          //         },
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20.r),
          //             color: Colors.blueGrey,
          //           ),
          //           child: Center(
          //             child: Column(
          //               children: [
          //                 SizedBox(height: 10.h),
          //                 CachedNetworkImage(
          //                   imageUrl:
          //                   categoryCubit.categories[index].image!,
          //                   imageBuilder: (context, imageProvider) =>
          //                       Container(
          //                         width: 140,
          //                         height: 108,
          //                         decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(20.r),
          //                           image: DecorationImage(
          //                             image: imageProvider,
          //                             fit: BoxFit.contain,
          //                           ),
          //                         ),
          //                       ),
          //                   placeholder: (context, url) =>
          //                   const CircularProgressIndicator(),
          //                   errorWidget: (context, url, error) =>
          //                   const Icon(Icons.error),
          //                 ),
          //                 SizedBox(height: 2.h),
          //                 Padding(
          //                   padding:
          //                   EdgeInsets.symmetric(horizontal: 10.w),
          //                   child: Text(
          //                     categoryCubit.categories[index].name!,
          //                     style: TextStyle(
          //                       overflow: TextOverflow.ellipsis,
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 19.sp,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        );
      },
    );
  }
}