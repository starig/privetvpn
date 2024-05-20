import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wireguard_dart_example/config/colors.dart';
import 'package:wireguard_dart_example/features/authscreen/state/auth_cubit.dart';
import 'package:wireguard_dart_example/features/components/gradient_button.dart';
import 'package:wireguard_dart_example/features/subscribe/models/plan.dart';
import 'package:wireguard_dart_example/features/subscribe/state/subscribe_cubit.dart';
import 'package:wireguard_dart_example/features/wrapper/wrapper_view.dart';

class SubscribeView extends StatefulWidget {
  const SubscribeView({super.key});

  static const List<String> bonuses = [
    "Нет рекламы",
    "Максимальная скорость",
    "Премиальные точки доступа"
  ];

  static const List<Plan> plans = [
    Plan(period: "1 месяц", summary: 99, monthly: 99),
    Plan(period: "1 месяц", summary: 99, monthly: 99),
    Plan(period: "1 месяц", summary: 99, monthly: 99),
  ];

  @override
  State<SubscribeView> createState() => _SubscribeViewState();
}

class _SubscribeViewState extends State<SubscribeView> {
  final TextEditingController _promoController = TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperView(
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: SvgPicture.asset("assets/images/privetLogo.svg"),
              leading: GestureDetector(
                onTap: () {
                  context.read<AuthCubit>().logout();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.primaryPurple,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Подписаться",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: SubscribeView.bonuses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          SvgPicture.asset("assets/images/purpleDot.svg"),
                          Text(
                            SubscribeView.bonuses[index],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: SubscribeView.plans.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      Plan plan = SubscribeView.plans[index];
                      return Container(
                        height: 72,
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 28,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.defaultWhite,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  plan.period,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Итого ${plan.summary}₽",
                                  style: TextStyle(
                                    color: AppColors.mediumGray,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${plan.monthly}₽",
                                      style: TextStyle(
                                        color: AppColors.primaryPurple,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "Ежемесячно",
                                      style: TextStyle(
                                        color: AppColors.mediumGray,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                SvgPicture.asset("assets/images/arrowRight.svg"),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: state.showPromoInput
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "Ввести промокод",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _promoController,
                                keyboardType: TextInputType.text,
                                onChanged: (String value) {
                                  setState(() {
                                    _promoController.text = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.defaultWhite,
                                  suffixIcon: state.hasPromoError
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _promoController.text = '';
                                            });
                                            context.read<SubscribeCubit>().clearError();
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: AppColors.primaryRed,
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () async {
                                            final text =
                                                await Clipboard.getData(Clipboard.kTextPlain);
                                            if (text != null) {
                                              setState(() {
                                                _promoController.text = text.text!;
                                              });
                                            }
                                          },
                                          child: SvgPicture.asset(
                                            'assets/images/paste.svg',
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(57),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Ввести промокод',
                                  hintStyle: const TextStyle(
                                    color: AppColors.mediumGray,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              state.hasPromoError
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        "Неверный промокод",
                                        style: TextStyle(
                                          color: AppColors.primaryRed,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              context.read<SubscribeCubit>().setShowPromo();
                            },
                            child: Text(
                              "У меня есть промокод",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.defaultWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                decorationColor: AppColors.defaultWhite,
                              ),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GradientButton(
                    label: _promoController.text.isNotEmpty
                        ? "Активировать промокод"
                        : "Попробовать 3 дня за 1₽",
                    onTap: () async {
                      try {
                        String promo = _promoController.text;
                        await context.read<SubscribeCubit>().activatePromo(promo);
                        await context.read<AuthCubit>().checkSubscribe();
                      } catch (e) {
                        print(e);
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
