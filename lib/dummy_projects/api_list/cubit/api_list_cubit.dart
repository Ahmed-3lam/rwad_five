import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rwad/dummy_projects/api_list/api_helper.dart';

import '../model/post_model.dart';

part 'api_list_state.dart';

class ApiListCubit extends Cubit<ApiListState> {
  ApiListCubit() : super(ApiListInitial());

  List<PostModel> postList = [];

  void getPost() async {
    emit(ApiListLoading());
    try {
      final response = await ApiHelper.getData();
      if (response.statusCode == 200) {
        List tempList = response.data;
        postList = tempList.map((e) => PostModel.fromJson(e)).toList();
        emit(ApiListSuccess("Data Fetched Successfully"));
      } else {
        emit(ApiListError("Check your internet"));
      }
    } catch (e) {
      emit(ApiListError("There's a problem"));
    }
  }
}

/// MVVM
/// MODEL VIEW _ VIEW _ MODEL
