import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/create_address_cubit/create_address_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/shipping_address_sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomShippingAddress extends StatelessWidget {
  const CustomShippingAddress({
    super.key,
    this.onTap, 
  });

  final void Function()? onTap;
  // final AddressModel? addressModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ItemHasPadding(
        verPadding: 8,
        horPadding: kHorPadding + 12,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shiping address',
                    style: Styles.style16.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ShippingAddressSubTitle(
                      subTitle: BlocProvider.of<CreateAddressCubit>(context)
                              .addressModel
                              ?.fullName ??
                          'Full Name'),
                  ShippingAddressSubTitle(
                      subTitle: BlocProvider.of<CreateAddressCubit>(context)
                              .addressModel
                              ?.phoneNumber ??
                          'Phone'),
                  ShippingAddressSubTitle(
                      subTitle: BlocProvider.of<CreateAddressCubit>(context)
                              .addressModel
                              ?.state ??
                          'State, City'),
                ],
              ),
              Icon(
                Icons.play_arrow,
                size: 18,
                color: MyColors.hintColorTextField,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
