import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/model/service_model.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/about_bloc.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/about_event.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/about_state.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key, required this.model});
  final ServiceModel model;

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  bool isMore = false;

  @override
  void initState() {
    context.read<AboutBloc>().add(ToggleEvent(isMore: false));
    context
        .read<AboutBloc>()
        .add(ReadMoreEvent(about: widget.model.about!.substring(0, 120)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutBloc, AboutState>(
      builder: (context, state) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: state.about,
                style: TextStyles.medium(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: state.isMore == true ? "...Read less" : "...Read more",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    isMore = !isMore;
                    context.read<AboutBloc>().add(ToggleEvent(isMore: isMore));
                    context
                        .read<AboutBloc>()
                        .add(ReadMoreEvent(about: widget.model.about));
                  },
                style: TextStyles.medium(
                  fontSize: 15,
                  color: AppColors.primaryDark,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
