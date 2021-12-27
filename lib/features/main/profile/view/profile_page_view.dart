import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/core/constants/strings/strings_manager.dart';
import 'package:ecommerce/core/extensions/context_extension.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
import 'package:ecommerce/product/widgets/listtile/profile_listtile.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  String userImage =
      "https://firebasestorage.googleapis.com/v0/b/socialmediaproject2-dfd62.appspot.com/o/userProfileAvatar%2Fdata%2Fuser%2F0%2Fcom.example.project2_social_media%2Fcache%2F26848d79-23bd-433e-9761-66d73326ac178836014112081161802.jpg%2FTimeOfDay(14%3A02)?alt=media&token=fc3a7985-700f-44a7-8883-d8eedeefa389";
  @override
  Widget build(BuildContext context) {
    return _buildContentWidget();
  }

  Widget _buildContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: _buildProfileAppBar(),
      body: FadeInDown(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w15),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMyProfileText(),
                _buildUserRow(),
                SizedBox(
                  height: context.h28,
                ),
                _buildProfileChoices()
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildProfileAppBar() {
    return AppBar(
      backgroundColor: ColorManager.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.exit_to_app,
            size: context.h24,
          ),
        ),
      ],
    );
  }

  Widget _buildMyProfileText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h15),
      child: Text(
        AppStrings.myProfile.tr(),
        style: getBoldStyle(color: ColorManager.black, fontSize: context.h34),
      ),
    );
  }

  Widget _buildUserRow() {
    return Row(
      children: [
        CircleAvatar(
            radius: context.h32, backgroundImage: NetworkImage(userImage)),
        Padding(
          padding: EdgeInsets.only(left: context.w16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bugrahan KIRMIZI',
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: context.h18),
              ),
              Text(
                'burahankrmz@gmail.com',
                style: getLightStyle(
                    color: ColorManager.grey, fontSize: context.h14),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildProfileChoices() {
    return SizedBox(
      height: context.h466,
      child: Column(
        children: [
          ProfileListTile(
              context: context,
              title: AppStrings.myOrders.tr(),
              subtitle: 'Already have 12 orders',
              onTap: () {}),
          ProfileListTile(
              context: context,
              title: AppStrings.shippingAdresses.tr(),
              subtitle: '3 adresses',
              onTap: () {}),
          ProfileListTile(
              context: context,
              title: AppStrings.paymentMethods.tr(),
              subtitle: 'Visa **65',
              onTap: () {}),
          ProfileListTile(
              context: context,
              title: AppStrings.promocodes.tr(),
              subtitle: AppStrings.youHavePromo.tr(),
              onTap: () {}),
          ProfileListTile(
              context: context,
              title: AppStrings.myReviews.tr(),
              subtitle: 'Reviews for 4 items',
              onTap: () {}),
          ProfileListTile(
              context: context,
              title: AppStrings.settings.tr(),
              subtitle: AppStrings.notificationsPassword.tr(),
              onTap: () {}),
        ],
      ),
    );
  }
}
