import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_winner/theme/app_color.dart';
import 'package:lottery_winner/tools/screen_size.dart';
import 'package:stacked/stacked.dart';

import 'components/custom_drawer_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {

    return Scaffold(
      endDrawer:  const CustomDrawerView(),
     // endDrawerEnableOpenDragGesture: true,
      key: viewModel.scaffoldKey,
      body: SafeArea(
         top: false,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: ScreenSize.height/4.1,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Palette.black.withOpacity(.40),
                        blurRadius: 15.r,
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  color: Palette.primary,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(45.r),bottomLeft: Radius.circular(45.r))
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      padding:  EdgeInsets.only(right: 15.h,),
                      margin:  EdgeInsets.only(top: 40.h),
                      decoration: const BoxDecoration(
                          color: Palette.primary
                      ),
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){
                        viewModel.scaffoldKey.currentState?.openEndDrawer();
                      }, icon: const Icon(Icons.menu,color: Palette.white
                        ,)),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
