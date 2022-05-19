// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omdbapi_flutter/views/home/home_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view/base_view.dart';
import '../../core/constants/assets_constants.dart';
import 'favorites_viewmodel.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FavoritesViewModel>(
      viewModel: Provider.of<FavoritesViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      onPageBuilder: (context, viewModel, _) => Scaffold(
        body: Column(children: [
          SizedBox(height: 15.sp),
          Text("Favorites",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold),),
          Expanded(
              child: ListView.builder(
                  itemCount: viewModel.movies.length,
                  itemBuilder: (BuildContext context,int index){
                    return GestureDetector(
                      onTap: (){
                        //viewModel.navigateToDetailPage(context, viewModel.movieList?.search?[index]);
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
                                  child: viewModel.movies[index].poster == "N/A"
                                      ? Center(child: Text("No Image"))
                                      : Image.network(
                                      viewModel.movies[index].poster,
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
                                    }, ),
                                ),
                                SizedBox(width: 5.sp,),
                                Expanded(child: Text(viewModel.movies[index].title)),
                                SizedBox(width: 5.sp,),
                                InkWell(child:
                                SvgPicture.asset(
                                  AssetPath.kFilledLike,height: 20.sp,
                                  width: 20.sp,color: Colors.red,),
                                  onTap: () {
                                      viewModel.deleteFavoriteMovie(viewModel.movies[index].imdbID);
                                    print("asdasd");
                                  },),


                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } ),)
        ]),
      ),
    );
  }
}
