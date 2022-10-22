import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/config/themes/themes.dart';

import '../../../dashboard/presentation/manager/user_fortune_bloc.dart';
import '../../../dashboard/presentation/pages/user_fortune_tells_page.dart';
import '../manager/user_bloc.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Kullanıcılar",
              style: TextStyle(
                color: Themes.mainColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserLoaded) {
              final users = state.profileUsers;
              return RefreshIndicator(
                onRefresh: ()async{BlocProvider.of<UserBloc>(context).add(GetUserEvent());},
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final userIndex = users[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        onTap: () {
                          BlocProvider.of<UserFortuneBloc>(context)
                              .add(GetUserFortuneEvent(userIndex.uid!));
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UserFortuneTellsPage(
                                  userId: userIndex.uid,
                                ),
                              ),
                            );
                        },
                        contentPadding: const EdgeInsets.all(5),
                        minLeadingWidth: 3,
                        minVerticalPadding: 5,
                        title: Text(
                          userIndex.name!+": okunmamış Fal Sayısı: ${userIndex.fortuneNotReadId!.length}",
                          style: TextStyle(
                            color: Themes.mainColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                           "okunmamış Soru  Sayısı: ${userIndex.userQuest!.length} -  ${userIndex.email!}",
                          style: TextStyle(
                            color: Themes.mainColor.withOpacity(0.8),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: users.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
