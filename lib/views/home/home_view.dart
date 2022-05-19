// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omdbapi_flutter/core/components/global_widgets/buttons/button.dart';
import 'package:omdbapi_flutter/views/home/home_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view/base_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/assets_constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: Provider.of<HomeViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      onPageBuilder: (context, viewModel, _) => GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Column(children: [
              buildSearchContainer(viewModel),
            CustomButton(
                text: "Search",
              onPressed: () async {
                  print("asdasd");
               FocusScope.of(context).unfocus();
              await viewModel.getMovieForSearch(viewModel.searchController.text);

              },
            ),
            SizedBox(height: 10.sp,),
            viewModel.loading == true ? const Center(child: CircularProgressIndicator(),) : Expanded(
              child: ListView.builder(
                  itemCount: viewModel.movieList?.search?.length ?? 0,
                  itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  onTap: ()  {
                        viewModel.navigateToDetailPage(context, viewModel.movieList?.search?[index]);
                  },
                  child: Padding(
                    padding:  EdgeInsets.all(16.0.sp),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1, //
                        ),
                      ),
                   //   color: Colors.red,
                      child: Padding(
                        padding:  EdgeInsets.all(8.0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.sp,
                              height: 100.sp  ,
                              child: viewModel.movieList!.search![index].poster! == "N/A"
                                  ? Center(child: Text("No Image"))
                                  : Image.network(
                                viewModel.movieList!.search![index].poster!,
                                  fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context, Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },),
                            ),
                            SizedBox(width: 5.sp,),
                            Expanded(child: Text(viewModel.movieList!.search![index].title!)),
                            SizedBox(width: 5.sp,),
                            viewModel.movieList!.search![index].isLiked == true
                                ? InkWell(child:
                            SvgPicture.asset(
                              AssetPath.kFilledLike,height: 20.sp,
                              width: 20.sp,color: Colors.red,),
                              onTap: () {
                                viewModel.deleteFavoriteMovie(viewModel.movieList!.search![index].imdbID!);
                                print("asdasd");
                              },)
                                : InkWell(child:
                             SvgPicture.asset(
                              AssetPath.kLike,height: 20.sp,
                              width: 20.sp,color: Colors.red,),
                              onTap: () {
                              viewModel.addMovieToDB(
                                  viewModel.movieList!.search![index].title!,
                                  viewModel.movieList!.search![index].year!,
                                  viewModel.movieList!.search![index].imdbID!,
                                  viewModel.movieList!.search![index].type!,
                                  viewModel.movieList!.search![index].poster!
                              );
                              print("asdasd");
                            },),


                          ],
                        ),
                      ),
                    ),
                  ),
                );
                } ),
            ),
          ]),
        ),
      ),
    );
  }

  Container buildSearchContainer(HomeViewModel viewModel) {
    return Container(
                decoration: BoxDecoration(
                //  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                margin:  EdgeInsets.all(16.sp),
                child: TextFormField(
                    controller: viewModel.searchController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Enter Movie Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                            borderSide: BorderSide(color: Colors.red)
                        )
                    ),
                )
            );
  }
}
