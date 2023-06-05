import 'package:flutter/material.dart';
import 'package:m10/fullscreen_dialog_widget.dart';

class Screen10 extends StatefulWidget {
  const Screen10({super.key});

  @override
  State<Screen10> createState() => _Screen10State();
}

class _Screen10State extends State<Screen10> {
  String language = 'Dart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan M10'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Banner',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('Text.')
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()
                  ..showMaterialBanner(showBanner(context)),
                child: const Text('Show Banner'),
              ),
            ],
          ),
          MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Dialogs',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('Reza')
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => showPeringatan(context),
                ),
                child: const Text('Alert'),
              ),
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => showRingtoneDialog(context),
                ),
                child: const Text('Simple Dialog'),
              ),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: ((context) => const FullScreenDialog()))),
                  child: const Text('Fullscreen Dialog'))
            ],
          ),
          MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Snackbars',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                    'Snackbars provide brief messages about app processes at the bottom of the screen.'),
              ],
            ),
            actions: [
              TextButton(
                  child: const Text('Snackbar'),
                  onPressed: () => ScaffoldMessenger.of(context)
                      .showSnackBar((showSnackBar(context)))),
            ],
          ),
        ],
      ),
    );
  }

  showBanner(BuildContext context) {
    return MaterialBanner(
      content: const Text('Ini Banner'),
      leading: const Icon(
        Icons.info,
        color: Colors.red,
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Agree'),
        ),
        TextButton(
          onPressed: () =>
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          child: const Text('Dismiss'),
        ),
      ],
    );
  }

  showPeringatan(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset settings?'),
      content: const Text(
          'This will reset your device to its default factory settings.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('ACCEPT'),
        ),
      ],
    );
  }

  showSnackBar(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 6),
      content: const Text('Welcome to snackbar'),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      ),
    );
  }

  // showSederhana(BuildContext context) {
  //   return SimpleDialog(
  //     title: const Text('Phone Ringtone'),
  //     children: List.generate(4, ((index) {
  //       return SimpleDialogOption(
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: const [
  //             Icon(
  //               Icons.abc,
  //               size: 36.0,
  //               color: Colors.amber,
  //             ),
  //             Padding(
  //               padding: const EdgeInsetsDirectional.only(start: 16.0),
  //               child: Text('abc'),
  //             ),
  //           ],
  //         ),
  //       );
  //     })),
  //   );
  // }

  // showRingtone(BuildContext context) {
  //   Enum Items {A, };
  //   int selectedRadio = 0;
  //   return SimpleDialog(
  //     title: const Text('Phone Ringtones'),
  //     children: List.empty(Items, () {
  //       return SimpleDialogOption(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Row(
  //               children: [
  //                 const Text('None'),
  //                 Radio(
  //                   value: index,
  //                   groupValue: selectedRadio,
  //                   onChanged: (val) {
  //                     setState(() {
  //                       selectedRadio = 0;
  //                     });
  //                   },
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //         // child: Radio(
  //         //     value: index,
  //         //     groupValue: selectedRadio,
  //         //     onChanged: (value) {
  //         //       setState(() {
  //         //         selectedRadio == value;
  //         //       });
  //         //     }),
  //       );
  //     }),
  //   );
  // }

//   void _showDialog(BuildContext context) {
//     showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Language'),
//           content: Column(
//             children: [
//               ListTile(
//                 title: const Text('Dart'),
//                 leading: Radio<String>(
//                   value: 'Dart',
//                   groupValue: language,
//                   onChanged: (String selectedLanguage) {
//                     setState(() {
//                       language = selectedLanguage;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               child: const Text('Close'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

  showRingtoneDialog(BuildContext context) {
    String selectedRingtone = 'Ringtone 1';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Ringtone'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile(
                    title: const Text('Ringtone 1'),
                    value: 'Ringtone 1',
                    groupValue: selectedRingtone,
                    onChanged: (value) {
                      setState(() {
                        selectedRingtone == value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Ringtone 2'),
                    value: 'Ringtone 2',
                    groupValue: selectedRingtone,
                    onChanged: (value) {
                      setState(() {
                        selectedRingtone == value;
                      });
                    },
                  ),
                  // Add more radio list tiles for each ringtone
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Handle the selected ringtone
                print('Selected Ringtone: $selectedRingtone');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
