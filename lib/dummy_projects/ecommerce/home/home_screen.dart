import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwad/dummy_projects/ecommerce/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banners(cubit),
              SizedBox(
                height: height * .04,
              ),
              Row(
                children: [
                  Text(
                    "Product Pack",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final productList = cubit.productModel.data?.data;
                  if (state is HomeProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList?.length ?? 0,
                      itemBuilder: (c, i) => Container(
                        height: 220,
                        width: 180,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.grey.withOpacity(.2))),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.network(productList?[i].image ?? ""),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        productList?[i].name ?? "",
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        productList?[i].description ?? "",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ ${productList?[i].price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  productList?[i].oldPrice.toString() ?? "",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Spacer(),
                                FloatingActionButton(
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    shape: CircleBorder(),
                                    mini: true,
                                    onPressed: () {})
                              ],
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (c, i) => SizedBox(
                        width: 20,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * .02,
              ),
              Row(
                children: [
                  Text(
                    "New Pack",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final productList = cubit.productModel.data?.data;
                  if (state is HomeProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList?.length ?? 0,
                      itemBuilder: (c, i) => Container(
                        height: 220,
                        width: 180,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.grey.withOpacity(.2))),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.network(productList?[i].image ?? ""),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        productList?[i].name ?? "",
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        productList?[i].description ?? "",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ ${productList?[i].price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  productList?[i].oldPrice.toString() ?? "",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Spacer(),
                                FloatingActionButton(
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    shape: CircleBorder(),
                                    mini: true,
                                    onPressed: () {})
                              ],
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (c, i) => SizedBox(
                        width: 20,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<HomeCubit, HomeState> _banners(HomeCubit cubit) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final bannerData = cubit.bannerModel.data;
        if (state is HomeBannerLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return CarouselSlider(
            items: List.generate(
                bannerData?.length ?? 0,
                (index) => Container(
                      height: 150,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          bannerData?[index].image ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
            options: CarouselOptions(
              height: 150,
              // aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              // autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ));
      },
    );
  }
}
