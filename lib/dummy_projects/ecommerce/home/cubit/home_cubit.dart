import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rwad/dummy_projects/ecommerce/const/KApis.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/dio_helper.dart';
import 'package:rwad/dummy_projects/ecommerce/home/models/BannerModel.dart';

import '../models/ProductModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  BannerModel bannerModel = BannerModel();
  ProductModel productModel = ProductModel();

  void getBanners() async {
    emit(HomeBannerLoading());
    try {
      final response = await DioHelper.getData(
        path: KApis.banners,
      );
      bannerModel = BannerModel.fromJson(response.data);
      if (bannerModel.status == true) {
        emit(HomeBannerSuccess());
      } else {
        emit(HomeBannerError(bannerModel.message));
      }
    } catch (e) {
      emit(HomeBannerError(e.toString()));
    }
  }

  void getProduct() async {
    emit(HomeProductLoading());
    try {
      final response = await DioHelper.getData(
        path: KApis.products,
      );
      productModel = ProductModel.fromJson(response.data);
      if (productModel.status == true) {
        emit(HomeProductSuccess());
      } else {
        emit(HomeProductError(productModel.message));
      }
    } catch (e) {
      emit(HomeProductError(e.toString()));
    }
  }
}
