import 'package:flutter/material.dart';

class alertDialog{
showAlertDialog(BuildContext context, Function onConfirm) {
  // set up the buttons
  Widget tombolBatal = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop(); // Tutup dialog
    },
  );
  Widget tombolHapus = TextButton(
    child: Text("Delete"),
    onPressed: () {
      Navigator.of(context).pop(); // Tutup dialog
      onConfirm(); // Panggil fungsi konfirmasi, agar dapat melanjutkan fungsi hapus
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Remove activity?"),
    content: Text("This will delete your plans"),
    actions: [
      tombolBatal,
      tombolHapus,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// Di dalam file perpus_view.dart

}