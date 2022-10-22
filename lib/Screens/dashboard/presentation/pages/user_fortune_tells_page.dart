import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/Screens/dashboard/presentation/manager/user_fortune_bloc.dart';
import 'package:untitled/config/themes/themes.dart';

import '../widgets/empty_fortune.dart';
import 'fortune_detail_page.dart';

class UserFortuneTellsPage extends StatefulWidget {
  UserFortuneTellsPage({Key? key, this.userId}) : super(key: key);
  String? userId;
  String? userEmail;

  @override
  State<UserFortuneTellsPage> createState() => _UserFortuneTellsPageState();
}

class _UserFortuneTellsPageState extends State<UserFortuneTellsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Themes.gradientColors.first,
          bottom: TabBar(tabs: [
            SizedBox(
                height: 40,
                child: Text(
                  "Okunmamış Fallar",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
                height: 40,
                child: Text(
                  "okunmuş Fallar",
                  style: TextStyle(color: Colors.white),
                ))
          ]),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<UserFortuneBloc>(context)
                .add(GetUserFortuneEvent(widget.userId!));
          },
          child: Container(
            padding: const EdgeInsets.only(top: 8),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Themes.gradientColors.first),
            alignment: Alignment.center,
            child: BlocBuilder<UserFortuneBloc, UserFortuneState>(
              builder: (context, state) {
                if (state is UserFortuneLoaded) {
                  final List<FortuneTells> fortuneTels = state.userFortunes;
                  if (fortuneTels.isEmpty) {
                    return TabBarView(
                      children: [
                        EmptyFortuneWidget(
                          onTap: () => 0,
                        ),
                        EmptyFortuneWidget(
                          onTap: () => 0,
                        ),
                      ],
                    );
                  } else {
                    return TabBarView(
                      children: [
                        ListView.builder(
                          itemCount:
                              fortuneTels.isEmpty ? 1 : fortuneTels.length,
                          itemBuilder: (context, index) {
                            final FortuneTells fortuneIndex =
                                fortuneTels[index];
                            if (!fortuneIndex.isDone!) {
                              return Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FortuneDetail(fortuneIndex),
                                          ),
                                        );
                                      },
                                      contentPadding: const EdgeInsets.all(5),
                                      minLeadingWidth: 3,
                                      minVerticalPadding: 5,
                                      title: Text(
                                        fortuneIndex.isDone!
                                            ? "Kahve Falı Okundu"
                                            : "Kahve Falı Okunmamış",
                                        style: TextStyle(
                                          color: Themes.mainColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "" /* "${formatDate(fortuneIndex.createDate!)}-${fortuneIndex.fortuneId!}"*/,
                                        style: TextStyle(
                                          color: Themes.mainColor.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Divider(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          },

                        ),
                        ListView.builder(
                          itemCount:
                              fortuneTels.isEmpty ? 1 : fortuneTels.length,
                          itemBuilder: (context, index) {
                            final FortuneTells fortuneIndex =
                                fortuneTels[index];
                            if (fortuneIndex.isDone!) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FortuneDetail(fortuneIndex),
                                          ),
                                        );
                                      },
                                      contentPadding: const EdgeInsets.all(5),
                                      minLeadingWidth: 3,
                                      minVerticalPadding: 5,
                                      title: Text(
                                        fortuneIndex.isDone!
                                            ? "Kahve Falı Okundu"
                                            : "Kahve Falı Okunmamış",
                                        style: TextStyle(
                                          color: Themes.mainColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      subtitle: Text(
                                        fortuneIndex.fortune_quest!["quest"] !=
                                                "null"
                                            ? "Okunmamış Soru var"
                                            : "Henüz Soru yok",
                                        style: TextStyle(
                                          color:
                                              Themes.mainColor.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Divider(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        )
                      ],
                    );
                  }
                } else if (state is UserFortuneLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorUserFortuneLoad) {
                  return TabBarView(
                    children: [
                      EmptyFortuneWidget(
                        onTap: () => 0,
                      ),
                      EmptyFortuneWidget(
                        onTap: () => 0,
                      ),
                    ],
                  );
                } else {
                  return TabBarView(
                    children: [
                      EmptyFortuneWidget(
                        onTap: () => 0,
                      ),
                      EmptyFortuneWidget(
                        onTap: () => 0,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
