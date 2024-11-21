import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/theme/theme_bloc/theme_bloc.dart';
import 'package:screen_scene/features/auth/domain/entities/user_entity.dart';
import 'package:screen_scene/features/settings/presentation/display_user_info_cubit/display_user_info_cubit.dart';
import 'package:screen_scene/features/settings/presentation/views/widgets/name_images.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayUserInfoCubit, DisplayUserInfoState>(
      builder: (context, state) {
        if (state is DisplayUserInfoLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DisplayUserInfoSuccess) {
          return _success(state.entity, context);
        }

        if (state is DisplayUserInfoFailure) {
          return Text(state.errMessage);
        }
        return Container();
      },
    );
  }

  Column _success(UserEntity entity, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: NameImage(
              user: entity,
              fontSize: 36,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? AppColors.gold
                : AppColors.secondBackground,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 4,
            ),
            title: Text(
              entity.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getBoldStyle(
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  entity.email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            trailing: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Text(
                'Edit',
                style: TextStyle(
                  fontSize: 16,
                  color:
                      context.isDarkMode ? AppColors.black : AppColors.darkGold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
