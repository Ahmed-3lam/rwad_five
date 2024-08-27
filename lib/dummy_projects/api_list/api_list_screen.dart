import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rwad/dummy_projects/api_list/cubit/api_list_cubit.dart';

class ApiListScreen extends StatelessWidget {
  const ApiListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ApiListCubit>();
    return BlocListener<ApiListCubit, ApiListState>(
      listener: (context, state) {
        if (state is ApiListError) {
          Get.snackbar("Error", state.msg);
        }
        if (state is ApiListSuccess) {
          Get.snackbar(
            "Success",
            state.msg,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Api List"),
        ),
        body: BlocBuilder<ApiListCubit, ApiListState>(
          builder: (context, state) {
            if (state is ApiListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ApiListError) {
              return Center(
                child: Text(
                  "Error",
                  style: TextStyle(fontSize: 50),
                ),
              );
            }
            return ListView.separated(
              itemCount: cubit.postList.length,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cubit.postList[index].title.toString() ?? ""),
                  subtitle: Text(cubit.postList[index].body ?? ""),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
