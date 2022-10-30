import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Screens/appenv/domain/entities/app_env.dart';
import 'package:untitled/Screens/appenv/presentation/manager/appenv_bloc.dart';
import 'package:untitled/Screens/appenv/presentation/widgets/appenv_textform_widget.dart';
import 'package:untitled/Screens/appenv/presentation/widgets/appenv_textform_widget.dart';
import 'package:untitled/Screens/appenv/presentation/widgets/appenv_textform_widget.dart';
import 'package:untitled/Screens/appenv/presentation/widgets/appenv_textform_widget.dart';
import 'package:untitled/Screens/appenv/presentation/widgets/appenv_textform_widget.dart';
import 'package:untitled/Screens/dashboard/presentation/widgets/elevated_button.dart';
import 'package:untitled/Screens/dashboard/presentation/widgets/textform_widget.dart';

class AppEnvPage extends StatelessWidget {
  TextEditingController? textEditingController1;
  TextEditingController? textEditingController2;
  TextEditingController? textEditingController3;
  TextEditingController? textEditingController4;
  TextEditingController? textEditingController5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<AppEnvBloc,AppEnvState>(
        builder: (context, state) {
          if (state is AppEnvLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AppEnvLoaded) {
            textEditingController1 =
                TextEditingController(text: state.appEnv.dailyFortune.toString());
            textEditingController2 =
                TextEditingController(text: state.appEnv.fortuneTime.toString());
            textEditingController3 =
                TextEditingController(text: state.appEnv.helpChar.toString());
            textEditingController4 =
                TextEditingController(text: state.appEnv.busyFortuneTime.toString());
            textEditingController5 =
                TextEditingController(text: state.appEnv.readedDailyFortune.toString());
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  AppEnvTextFormWidget(
                    formTitle: "Günlük Fal Sayısı",
                    formHint: "",
                    controller: textEditingController1!,
                  ),
                  AppEnvTextFormWidget(
                    formTitle: "Fal Bakma Süresi",
                    controller: textEditingController2!,
                    formHint: '',
                  ),
                  AppEnvTextFormWidget(
                    formTitle: "Fal Max Soru Karakteri Uzunluğu",
                    formHint: "",
                    controller: textEditingController3!,
                  ),
                  AppEnvTextFormWidget(
                    formTitle: "Meşgul Fal Bakma Süresi",
                    formHint: "",
                    controller: textEditingController4!,
                  ),
                  AppEnvTextFormWidget(
                    formTitle: "Okunan Fal Sayısı",
                    formHint: "",
                    enabled: false,
                    controller: textEditingController5!,
                  ),
                  ElevatedButtonWidget(
                    onPress: () {
                      BlocProvider.of<AppEnvBloc>(context).add(
                        SetAppEnvEvent(
                          AppEnv(
                           dailyFortune:int.parse(textEditingController1!.text),
                            fortuneTime: int.parse(textEditingController2!.text),
                            helpChar: int.parse(textEditingController3!.text),
                            busyFortuneTime: int.parse(textEditingController4!.text),
                            readedDailyFortune: int.parse(textEditingController5!.text),
                          ),
                        ),
                      );
                    },
                    text: "Güncelle",
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
