  import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:omdbapi_flutter/views/detail/detail_view.dart';
import 'package:provider/provider.dart';
import '../../core/base/base_view/base_view.dart';
import '../../core/components/global_widgets/changeTheme/change_theme_button_widget.dart';
import '../../core/constants/assets_constants.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/navigation_constant.dart';
import '../../core/init/provider/theme_provider.dart';
import '../favorites/favorites_view.dart';
import '../home/home_view.dart';
import 'bottom_navigator_viewmodel.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CustomBottomNavigationViewModel>(
      viewModel:
      Provider.of<CustomBottomNavigationViewModel>(context, listen: false),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel, child) => Scaffold(

        appBar:AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title:  const Text("Omdbapi"),
          actions: [
            ChangeThemeButtonWidget(),
          ],
          actionsIconTheme: IconThemeData(size: 32.sp,),

        ),
        //drawer: Drawer(),
        body: destinator(viewModel.selectedDestination.index,viewModel.pageNameString),


        //floating action button position to center
        //BOTTOM NAV BAR
        bottomNavigationBar: SizedBox(
          height: 60.sp,
          child: BottomAppBar(
            //bottom navigation bar on scaffold
            shape: const CircularNotchedRectangle(), //shape of notch
            notchMargin:
            8, //notche margin between floating button and bottom appbar
            child: SizedBox(
              //padding: const EdgeInsets.only(top: 1.1),
              height: 60.sp,
              child: BottomAppBar(
                elevation: 0,
                color: Provider.of<ThemeProvider>(context).isDarkMode ? Colors.black  : ColorConstants.instance.kLightBlue,
                shape: const CircularNotchedRectangle(), //shape of notch
                notchMargin: 8.6.sp,
                child: Row(
                  //children inside bottom appbar
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 75.sp,
                      decoration: viewModel.selectedDestinationIndex == 0
                          ? BoxDecoration(
                          border: Border(top: BorderSide(color: ColorConstants.instance.kBoldBlue,width: 3)))
                          : null,
                      child: Padding(
                        padding:  EdgeInsets.all(19.0.sp),
                        child: InkWell(
                          child:  SizedBox(
                            height: 50.sp,
                            width: 75.sp,
                            child: SvgPicture.asset(
                              AssetPath.kHomeSvgIcon,
                              color: viewModel.selectedDestinationIndex == 0 ? ColorConstants.instance.kBoldBlue : Colors.white,),
                          ),
                          onTap: () {
                            viewModel.pageNameString=null;
                            viewModel.selectDestination(0);
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 60.sp,
                      width: 75.sp,
                      decoration: viewModel.selectedDestinationIndex == 1
                          ? BoxDecoration(
                          border: Border(
                            top: BorderSide(color: ColorConstants.instance.kBoldBlue,width: 3),))
                          : null,
                      child: Padding(
                        padding:  EdgeInsets.all(19.0.sp),
                        child: InkWell(
                          child:  SizedBox(
                            height: 50.sp,
                            width: 75.sp,
                            child: SvgPicture.asset(
                              AssetPath.kLike,
                              color: viewModel.selectedDestinationIndex == 1 ? ColorConstants.instance.kBoldBlue : Colors.white,),
                          ),
                          onTap: () {
                            viewModel.pageNameString=null;
                            viewModel.selectDestination(1);
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget destinator(int index,String? pageName) {
    switch (index) {
      case 0:
        if (pageName==NavigationConstants.detailPage){
          return const DetailView();
        }else{
          return const HomeView();
        }
      case 1:
        return  const FavoritesView();
      default:
        return const HomeView();
    }
  }
}
