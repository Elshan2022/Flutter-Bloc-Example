import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/common/custom_textField.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/gen/assets.gen.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_state.dart';
import 'package:flutter_bloc_example/service/auth_service.dart';
import 'package:flutter_bloc_example/service/image_picker_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key});
  final ImagePickerService _pickerService = ImagePickerService();
  final IFirebaseAuthService _service = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<UserInformationBloc, UserInformationState>(
          builder: (context, state) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: _userImage(),
                  title: _userName(state),
                  subtitle: _location(state),
                  trailing: _notification(),
                ),
                const SizedBox(height: 15),
                const CustomTextField(hintText: "Search", padding: 10),
              ],
            );
          },
        ),
      ),
    );
  }

  IconButton _notification() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.notifications_on_sharp,
        color: AppColors.white,
        size: 20,
      ),
    );
  }

  Text _location(UserInformationState state) {
    return Text(
      "${state.phoneNumber}",
      style: TextStyles.medium(
        color: AppColors.white,
        fontSize: 12,
      ),
    );
  }

  Text _userName(UserInformationState state) {
    return Text(
      "${state.name} ${state.surname}",
      style: TextStyles.sameBold(
        color: AppColors.white,
        fontSize: 14,
      ),
    );
  }

  InkWell _userImage() {
    return InkWell(
      onTap: () async {
        final imageFile = await _pickerService.selectImageFromGallery();
        debugPrint("Image file $imageFile");
        final imageUrl = await _service.setUserImage(imageFile);
        debugPrint("Image url $imageUrl");
      },
      child: Container(
        height: 50,
        width: 50,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
        child: Center(
          child: SvgPicture.asset(Assets.vectors.user, width: 30, height: 30),
        ),
      ),
    );
  }
}
