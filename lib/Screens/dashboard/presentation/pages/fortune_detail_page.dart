import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/Screens/dashboard/presentation/pages/fortune_tells_page.dart';
import 'package:untitled/Screens/dashboard/presentation/widgets/elevated_button.dart';
import 'package:untitled/config/themes/themes.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/main.dart';

import '../manager/fortune_bloc.dart';
import '../widgets/textform_widget.dart';

class FortuneDetail extends StatefulWidget {
  FortuneDetail(
    this.fortuneTells,
  );

  FortuneTells fortuneTells;

  @override
  State<FortuneDetail> createState() => _FortuneDetailState();
}

class _FortuneDetailState extends State<FortuneDetail> {
  void showImage(BuildContext context, image) async {
    await showDialog(
      context: context,
      builder: (__) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: 200.0,
          height: 200.0,
          child: PhotoView(
            imageProvider: MemoryImage(base64Decode(image)),
          ),
        ),
      ),
    );
  }

  TextEditingController? bildirimController;
  TextEditingController? soruController;
  TextEditingController? falController;

  @override
  void initState() {
    super.initState();
    falController = TextEditingController(
        text: widget.fortuneTells.fortuneComment!.toString() == "null"
            ? "Fal Yorumunuzu Giriniz."
            : widget.fortuneTells.fortuneComment!.toString());
    soruController = TextEditingController(
        text: widget.fortuneTells.fortune_quest!["answer"].toString() == "null"
            ? "Cevap Yaz"
            : widget.fortuneTells.fortune_quest!["answer"]);
    bildirimController =
        TextEditingController(text: widget.fortuneTells.notifContent ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF612883),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF612883),
        elevation: 0,
        title: Text(
          "Kahve Falı Yorumla",
          style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Themes.mainColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HeaderFortune(context),
              ContentFortune(
                  context, falController, soruController, bildirimController),
              ElevatedButtonWidget(
                text: "Fal'ı Gönder",
                onPress: () async {
                  print(bildirimController!.text);
                  BlocProvider.of<FortuneBloc>(context).add(
                    SetFortunes(
                      FortuneTells(
                        fortuneId: widget.fortuneTells.fortuneId!,
                        userId: widget.fortuneTells.userId!,
                        flatCup: widget.fortuneTells.flatCup!,
                        inCup: widget.fortuneTells.inCup!,
                        userEmail: widget.fortuneTells.userEmail,
                        notifContent: bildirimController?.text.toString(),
                        fortune_quest: {
                          "answer": widget.fortuneTells.fortune_quest!["answer"]
                                      .toString() ==
                                  "null"
                              ? soruController!.text
                              : widget.fortuneTells.fortune_quest!["answer"],
                          "quest": widget.fortuneTells.fortune_quest!["quest"]
                        },
                        createDate: widget.fortuneTells.createDate!,
                        fortuneComment: falController!.text,
                        isDone: true,
                      ),
                    ),
                  );
                  final response = await http.post(
                    Uri.parse('https://onesignal.com/api/v1/notifications'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                      "Authorization":
                          "Basic YTBhZjY3NDctYmNjMS00ZDU0LTlmNDctYTc1MzVkMGQzZmFh"
                    },
                    body: jsonEncode(<String, dynamic>{
                      "app_id": "11dd0b75-1cce-40f0-a4b4-c08a08fb4a42",
                      "filters": [
                        {
                          "field": "email",
                          "value": widget.fortuneTells.userEmail
                        }
                      ],
                      "sound": "sent_fortune.ogg",
                      "priority": 10,
                      "channel_for_external_user_ids": "email",
                      "contents":
                        {"en": bildirimController?.text.toString()}
                      ,
                      "android_group_message": [
                        {"en": bildirimController?.text.toString()}
                      ]
                    }),
                  );
                  if (response.statusCode == 201) {
                    // If the server did return a 201 CREATED response,
                    // then parse the JSON.
                    print(response.body);
                  } else {
                    // If the server did not return a 201 CREATED response,
                    // then throw an exception.
                    print(response.body);
                  }
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ));
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget HeaderFortune(BuildContext context) {
    return Column(
      children: [
        Text(
          "Fincan İçi ",
          style:
              TextStyle(color: Themes.mainColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              childAspectRatio: 1.1,
              crossAxisSpacing: 10,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: widget.fortuneTells.inCup!.length == 0
                ? 1
                : widget.fortuneTells.inCup!.length,
            itemBuilder: (_, index) {
              if (widget.fortuneTells.inCup!.length == 0) {
                return Icon(Icons.image);
              } else {
                return InkWell(
                  onTap: () async {
                    showImage(context, widget.fortuneTells.inCup![index]);
                  },
                  child: Image.memory(
                      base64Decode(widget.fortuneTells.inCup![index]),
                      fit: BoxFit.cover),
                );
              }
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Tabak İçi ",
          style:
              TextStyle(color: Themes.mainColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .25,
          width: MediaQuery.of(context).size.height * .25,
          child: InkWell(
            onTap: () => showImage(context, widget.fortuneTells.flatCup!.first),
            child: Image.memory(
                base64Decode(widget.fortuneTells.flatCup!.first),
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget ContentFortune(
      BuildContext context, falController, soruController, bildirimController) {
    return Column(
      children: [
        ProfilTextFormWidget(
          formTitle: "Fal Yorumun",
          controller: falController,
          formHint: "Fal Yorumun",
          keyboardType: TextInputType.multiline,
          readOnly: false,
          maxLines: 12,
        ),
        widget.fortuneTells.fortune_quest!["quest"] != "null"
            ? ProfilTextFormWidget(
                formTitle: "Kullanıcının Sorusu: " +
                    (widget.fortuneTells.fortune_quest!["quest"] == "null"
                        ? "Henüz Bir Soru Yok"
                        : widget.fortuneTells.fortune_quest!["quest"]),
                controller: soruController,
                formHint: widget.fortuneTells.fortune_quest!["answer"]
                            .toString() ==
                        "null"
                    ? "Cevap Gir"
                    : widget.fortuneTells.fortune_quest!["answer"].toString(),
                keyboardType: TextInputType.multiline,
                readOnly:
                    widget.fortuneTells.fortune_quest!["quest"].toString() ==
                            "null"
                        ? true
                        : false,
                maxLines: 10,
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Henüz Bir Soru Yok",
                  style: TextStyle(
                    color: Themes.mainColor,
                    fontSize: 18,
                  ),
                ),
              ),
        ProfilTextFormWidget(
          formTitle: "Bildirim İçeriği",
          controller: bildirimController,
          readOnly: false,
          formHint: "Bildirim içeriği Gir",
          keyboardType: TextInputType.multiline,
          maxLines: 5,
        ),
      ],
    );
  }
}
