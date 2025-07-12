import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/resources/component/colors.dart';
import 'package:mvvm/utilis/routes_name.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.btnColor,
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //     size: 20,
        //   ), //  arrow color change yahan se
        //   onPressed: () {
        //     Navigator.pop(context); //  back le jaega previous screen pe
        //   },
        // ),
        actions: [
          InkWell(
            onTap: () {
              userPreference.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Center(
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, _) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return CircularProgressIndicator();

              case Status.ERROR:
                return Text(
                  value.moviesList.message.toString(),
                  style: TextStyle(color: Colors.black),
                );

              case Status.COMPLETED:
                return ListView.builder(
                  itemCount:
                      value.moviesList.data!.movies!.length, // ⚠ Required
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(
                        'asdf',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                );

              case null:
                return Text("Status is null");
            }

            return Container();
          },
        ),
      ),
    );
  }
}
