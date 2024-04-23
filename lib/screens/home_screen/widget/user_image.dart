// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/common/custom_button.dart';
import 'package:flutter_bloc_example/common/helper_functions.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/gen/assets.gen.dart';
import 'package:flutter_bloc_example/service/auth_service.dart';
import 'package:flutter_bloc_example/service/image_picker_service.dart';
import 'package:flutter_svg/svg.dart';

class UserImage extends StatelessWidget {
  UserImage({super.key});

  final ImagePickerService _pickerService = ImagePickerService();
  final IFirebaseAuthService _service = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        _bottomSheet(context);
      },
      child: Container(
        height: 50,
        width: 50,
        clipBehavior: Clip.antiAlias,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
        child: StreamBuilder(
          stream: _service.getUserImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data != null) {
                return Image.network(snapshot.data!, fit: BoxFit.cover);
              } else {
                return _defaultImage();
              }
            } else {
              return _loadingCase();
            }
          },
        ),
      ),
    );
  }

  Center _defaultImage() {
    return Center(
      child: SvgPicture.asset(
        Assets.vectors.user,
        width: 30,
        height: 30,
      ),
    );
  }

  Center _loadingCase() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryDark,
      ),
    );
  }

  Future<dynamic> _bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomButton(
                  buttonName: "Select image",
                  onPressed: () async => await _selectImage(context),
                  fontSize: 14,
                  height: 40,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: CustomButton(
                  buttonName: "Delete image",
                  onPressed: () async => await _deleteImage(context),
                  fontSize: 14,
                  backgroundColor: Colors.red,
                  height: 40,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _deleteImage(BuildContext context) async {
    try {
      await _service.deleteProfileImage();
    } catch (e) {
      HelperFunctions.showCustomSnackBar(
        context,
        e.toString(),
        Colors.red,
      );
    } finally {
      Navigator.pop(context);
    }
  }

  Future<void> _selectImage(BuildContext context) async {
    try {
      final imageFile = await _pickerService.selectImageFromGallery();
      final imageUrl = await _service.setUserImage(imageFile);
      await _service.updateUserImage(imageUrl);
    } catch (e) {
      HelperFunctions.showCustomSnackBar(
        context,
        e.toString(),
        Colors.red,
      );
    } finally {
      Navigator.pop(context);
    }
  }
}
