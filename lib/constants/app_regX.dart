// ignore_for_file: file_names

class AppRegX {
  final emailRegX = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final passwordRegX = RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$');
}
