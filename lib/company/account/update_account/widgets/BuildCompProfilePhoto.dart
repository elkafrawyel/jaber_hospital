import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../../res/res.dart';
import '../update_account_data.dart';

class BuildCompProfilePhoto extends StatelessWidget {
  const BuildCompProfilePhoto();

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;
    return BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
      bloc: UpdateAccountData().profileImageCubit,
      builder: (_, state){
        if(state.data == null){
          return Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CachedImage(
                        url:  user.userData?[0].image??'https://picsum.photos/212',
                        width: 120,
                        height: 120,
                        boxShape: BoxShape.circle,
                        fit: BoxFit.cover,
                        haveRadius: false,
                      ),
                    ],
                ),
                Positioned(
                  bottom: 0,
                  left: 8,
                  right: -60,
                  child: GestureDetector(
                    onTap:()=> UpdateAccountData().setImage(),
                    child: Container(
                      height: 35,
                      width: 35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: MyColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MyColors.blackOpacity,
                          ),
                          image: DecorationImage(scale: 3,image: AssetImage(Res.imagesCam))
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }else{
          log("data=> ${state.data}");
          return Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(state.data??File('')),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: MyColors.greyWhite,
                      ),),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: -5,
                  right: -60,
                  child: GestureDetector(
                    onTap:()=> UpdateAccountData().setImage(),
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: MyColors.primary,
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: MyColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
