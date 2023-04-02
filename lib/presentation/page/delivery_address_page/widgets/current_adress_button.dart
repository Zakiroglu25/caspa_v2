import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_address_current/delivery_address_current_state.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../infrastructure/cubits/delivery_address_current/delivery_address_current_cubit.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../widget/custom/buttons/app_button.dart';
import 'location_button_text.dart';

class CurrentAddressButton extends StatelessWidget {
  const CurrentAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      left: 16,
      bottom: 30,
      child: AppButton(
        h: 76,
        //isButtonActive: !(state is DeliveryAddressCurrentError),
        onTap: () async {
          final state = context.read<DeliveryAddressCurrentCubit>().state;
          if (state is DeliveryAdressCurrentDisabled) {
            context
                .read<DeliveryAddressCurrentCubit>()
                .showAccessAlert(context);
          }
          if ((state is DeliveryAddressCurrentError)) {
            context.read<DeliveryAddressCurrentCubit>().get();
            return;
          }
          context.read<DeliveryAddressCurrentCubit>().add(context);
        },
        child: AnimatedContainer(
          duration: Durations.ms500,
          child: Padding(
            padding: Paddings.paddingA16 - Paddings.paddingV4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svgSend),
                MySizedBox.w16,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyText.currentAdress,
                        style: AppTextStyles.sanF500.copyWith(
                            color: MyColors.white, fontWeight: FontWeight.w600),
                      ),
                      MySizedBox.h4,
                      BlocConsumer<DeliveryAddressCurrentCubit,
                          DeliveryAddressCurrentState>(
                        listener: (context, state) {
                          if (state is DeliveryAdressCurrentAdded) {
                            context.read<DeliveryAddressCubit>().get();
                          }
                        },
                        builder: (context, state) {
                          if (state is DeliveryAdressCurrentSuccess) {
                            final address = state.address;
                            //final location = state.location;
                            return LocationButtonText(
                              text: address,
                            );
                          }
                          if (state is DeliveryAdressCurrentInProgress) {
                            return Container(
                              height: 4,
                              margin: Paddings.paddingV5,
                              width: 93,
                              child: LinearProgressIndicator(
                                color: MyColors.white,
                                backgroundColor: MyColors.mainOpacityDark,
                              ),
                            );
                          }
                          if (state is DeliveryAdressCurrentDenied) {
                            return LocationButtonText(
                              text: MyText.locationAccessDenied,
                            );
                          }
                          if (state is DeliveryAdressCurrentDisabled) {
                            return LocationButtonText(
                              text: MyText.locationAccessDisabled,
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
