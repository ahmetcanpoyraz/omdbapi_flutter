// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view/base_view.dart';
import '../../core/constants/assets_constants.dart';
import 'detail_viewmodel.dart';


class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailViewModel>(
      viewModel: Provider.of<DetailViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      onPageBuilder: (context, viewModel, _) => Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(8.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 200.sp,
                    child: viewModel.movie.poster! == "N/A"
                        ? Center(child: Text("No Image"))
                        : Image.network(
                        viewModel.movie.poster!,
                        fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 10.sp,right: 30.sp),
                  child: viewModel.movie.isLiked == true ?
                  InkWell(child:
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      AssetPath.kFilledLike,height: 20.sp,
                      width: 20.sp,color: Colors.red,),
                  ),
                    onTap: () {
                          viewModel.removeFavorite(viewModel.movie.imdbID!);
                    },)
                      : InkWell(child:
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      AssetPath.kLike,height: 20.sp,
                      width: 20.sp,color: Colors.red,),
                  ),
                    onTap: () {
                      viewModel.addFavorite(viewModel.movie.title!,viewModel.movie.year!,viewModel.movie.imdbID!,viewModel.movie.type!,viewModel.movie.poster!,);
                    },),
                ),
              ],
            ),
            SizedBox(height: 12.sp,),
            Row(
              children: [
                const Text("Title : "),
                Expanded(child: Text(viewModel.movie.title!)),
              ],
            ),
                Row(
                  children: [
                    const Text("Year : "),
                    Expanded(child: Text(viewModel.movie.year!)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Type : "),
                    Expanded(child: Text(viewModel.movie.type!)),
                  ],
                ),
          ]),
        ),
      ),
    );
  }
}
