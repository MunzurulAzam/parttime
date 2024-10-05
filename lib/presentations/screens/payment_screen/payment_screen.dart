import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/data/models/details/villa_details.dart';
import 'package:hotel_management/providers/payment/payment_provider.dart';
import 'package:hotel_management/providers/product_details_provider/product_details_provider.dart';

import '../../../core/config/routes/app_routes.dart';
import '../../../core/utils/date_formatter.dart';
import '../../widgets/on_process_button.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final String? villaId;

  const PaymentScreen({super.key, required this.villaId});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  bool useGlassMorphism = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final detailsController = ref.watch(detailsProvider);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Payment',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(
              'assets/images/bg-dark.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            CreditCardWidget(
              enableFloatingCard: true,
              glassmorphismConfig: _getGlassmorphismConfig(),
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: 'Master card',
              frontCardBorder: Border.all(color: Colors.grey),
              backCardBorder: Border.all(color: Colors.grey),
              showBackView: true,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              // cardBgColor: isLightTheme
              //     ? AppColors.cardBgLightColor
              //     : AppColors.cardBgColor,
              backgroundImage: 'assets/images/bcImage2.jpg',
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'assets/icons/mastercard.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: 'XXXX XXXX XXXX XXXX',
                      cvvCode: 'XXX',
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: '',
                      expiryDate: '',
                      inputConfiguration: const InputConfiguration(
                        cardNumberTextStyle: TextStyle(color: Colors.white),
                        expiryDateTextStyle: TextStyle(color: Colors.white),
                        cvvCodeTextStyle: TextStyle(color: Colors.white),
                        cardHolderTextStyle: TextStyle(color: Colors.white),
                        cardNumberDecoration: InputDecoration(
                          fillColor: Colors.black,
                          labelText: 'Number',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: InputDecoration(
                          fillColor: Colors.black,
                          labelText: 'Expired Date',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          fillColor: Colors.black,
                          labelText: 'CVV',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          fillColor: Colors.black,
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Card Holder',
                        ),
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: OnProcessButtonWidget(
                        height: 60,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
                        borderRadius: BorderRadius.circular(10),
                        child: AutoSizeText('Pay Now', style: TextStyle(fontSize: 16.sp, color: Theme.of(context).scaffoldBackgroundColor)),
                        onTap: () async {
                          final success = await _onValidate();

                          if (success == true) {
                            return true;
                          } else {
                            return false;
                          }
                        },
                        onDone: (value) {
                          if (value == true) {
                            Navigator.pushNamedAndRemoveUntil(context, RouteName.navigationScreen, (route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('Payment failed!Please try again!'),
                            ));
                          }
                        },
                      ),
                    ),

                    /* GestureDetector(
                      onTap: () {
                        _onValidate();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: const Text(
                          'Pay Now',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onValidate() async {
    if (formKey.currentState?.validate() ?? false) {
      // formKey.currentState?.save();

      // String expiryDate = 'XX/XX';
      final startDate = ref.read(detailsProvider).startDate;
      final endDate = ref.read(detailsProvider).endDate;

      final fixTimeFor12Pm = ref.read(detailsProvider).fixedTime;


      String date = convertToYearMonth(expiryDate);
      String totalAmount = ref.read(detailsProvider).totalAmount ?? '0';

      final success = await ref.read(paymentProvider).processPayment(
            cardNumber: cardNumber.split(' ').join(),
            expirationDate: date,
            cvv: cvvCode,
            totalAmount: double.parse(totalAmount),
            context: context,
            villaID: widget.villaId ?? '',
            bookingStartDate: DateTime(startDate!.year, startDate.month, startDate.day, fixTimeFor12Pm.hour, fixTimeFor12Pm.minute).toString(),
            bookingEndDate: DateTime(endDate!.year, endDate.month, endDate.day, fixTimeFor12Pm.hour, fixTimeFor12Pm.minute).toString(),
            dayCount: "${ref.read(detailsProvider).dayCount ?? 0}",
          );

      if (success == true) {
        log('valid!');

        return true;
      } else {
        return false;
      }
    } else {
      log('invalid!');

      return false;
    }
  }

  Glassmorphism? _getGlassmorphismConfig() {
    if (!useGlassMorphism) {
      return null;
    }

    final LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
      stops: const <double>[0.3, 0],
    );

    return Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient);
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
