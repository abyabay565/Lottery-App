import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_winner/app/ui_helpers.dart';
import 'package:lottery_winner/theme/app_color.dart';
import 'package:lottery_winner/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../tools/screen_size.dart';

class CustomDrawerView extends ViewModelWidget<HomeViewModel> {
   const CustomDrawerView({super.key});

  @override
  Widget build(BuildContext context,HomeViewModel viewModel) {
    return Drawer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Palette.primary.withOpacity(.5),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.h),
                width: double.infinity,
                height: ScreenSize.height / 5.8,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Palette.primary.withOpacity(1),
                          Palette.yellow.withOpacity(.8),
                          Palette.red.withOpacity(.9),
                        ]
                    )
                ),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:  EdgeInsets.only(top: 20.h),
                      decoration: BoxDecoration(
                          border: Border.all(color: Palette.primary, width: 5),
                          shape: BoxShape.circle),
                      child: Container(
                          height: 60.h,
                          width: 60.w,
                          decoration:  const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Palette.primary,
                              image: DecorationImage(image: CachedNetworkImageProvider("https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png",),fit: BoxFit.fill)
                          )
                      ),
                    ),
                    width_10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abin Benny",
                          style:  TextStyle(
                              color: Palette.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "abinbenny@gmail.com",
                          style:  TextStyle(
                              color: Palette.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "8921056431",
                          style:  TextStyle(
                              color: Palette.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
               SizedBox(height: 15.h,),
              Expanded(
                  child: ListView.separated(
                    padding:  EdgeInsets.only(bottom: 50.h),
                    itemBuilder: (context, index) {
                      var itemData = viewModel.homeData[index];
                      return InkWell(
                        onTap: (){

                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              //SvgPicture.asset(accountData?[index].icon??"",colorFilter: colorFilter(color: Palette.white),height: 20,width: 20),
                               SizedBox(width: 10.w,),
                              Text(
                                itemData.name??"",
                                style:  TextStyle(
                                    color: Palette.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                               const Spacer(),
                              IconButton(onPressed: (){}, icon:  const Icon(CupertinoIcons.right_chevron,color: Palette.white))
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return  Divider(
                        color: Palette.white,
                        thickness: 1,
                        height: 1.h,
                        endIndent: 30,
                        indent: 50,
                      );
                    },
                    itemCount: viewModel.homeData.length,
                    shrinkWrap: false,
                    physics:  const AlwaysScrollableScrollPhysics(),
                  ))
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () async {
          },
          style: ElevatedButton.styleFrom(
            elevation: 25,
            backgroundColor: Palette.primary,
            shape:  const CircleBorder(),
            padding:  const EdgeInsets.all(15),
          ),
          child:  const Icon(Icons.logout_rounded,color: Palette.white),
        ),
      ),
    );
  }
}
