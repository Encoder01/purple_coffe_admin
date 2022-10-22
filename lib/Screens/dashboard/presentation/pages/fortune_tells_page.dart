import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/Screens/dashboard/presentation/manager/fortune_bloc.dart';
import 'package:untitled/Screens/dashboard/presentation/widgets/empty_fortune.dart';
import 'package:untitled/config/themes/themes.dart';
import 'fortune_detail_page.dart';

class FortuneTellsPage extends StatefulWidget {
  FortuneTellsPage({Key? key, required this.onTap }) : super(key: key);
  Function(int) onTap;
  @override
  State<FortuneTellsPage> createState() => _FortuneTellsPageState();
}

class _FortuneTellsPageState extends State<FortuneTellsPage>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    Future.delayed(Duration(seconds: 1)).whenComplete(
            () => BlocProvider.of<FortuneBloc>(context).add(GetMyFortunes()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Gelen Kutusu",
                style: TextStyle(
                    color: Themes.mainColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<FortuneBloc>(context).add(const GetMyFortunes());
        },
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: BlocBuilder<FortuneBloc, FortuneState>(
            builder: (context, state) {
              if (state is FortuneLoaded) {
                final List<FortuneTells> fortuneTels = state.fortuneTells;
                if (fortuneTels.isEmpty) {
                  return EmptyFortuneWidget(
                    onTap: () {
                      BlocProvider.of<FortuneBloc>(context)
                          .add(const GetMyFortunes());
                    },
                  );
                } else {
                  return ListView.separated(
                    itemCount: fortuneTels.isEmpty ? 1 : fortuneTels.length,
                    itemBuilder: (context, index) {
                      final FortuneTells fortuneIndex = fortuneTels[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    FortuneDetail(fortuneIndex,),
                              ),
                            );
                          },
                          contentPadding: const EdgeInsets.all(5),
                          minLeadingWidth: 3,
                          minVerticalPadding: 5,
                          title: Text(
                            fortuneIndex.isDone!
                                ? "Kahve Falı okunmuş"
                                : "Kahve Falı okunmamış",
                            style: TextStyle(
                              color: Themes.mainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            fortuneIndex.fortune_quest!["quest"] != "null" &&  fortuneIndex.fortune_quest!["answer"] == "null"
                                ? "Okunmamış Soru var"
                                : "Henüz Soru yok",
                            style: TextStyle(
                              color: Themes.mainColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: Colors.white,
                        ),
                      );
                    },
                  );
                }
              } else if (state is FortuneLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorFortuneLoad) {
                return Center(
                  child: EmptyFortuneWidget(onTap: () {
                    BlocProvider.of<FortuneBloc>(context)
                        .add(const GetMyFortunes());
                  }),
                );
              } else {
                return Center(
                  child: EmptyFortuneWidget(onTap: () {
                    BlocProvider.of<FortuneBloc>(context)
                        .add(const GetMyFortunes());
                  }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
