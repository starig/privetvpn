import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wireguard_dart_example/config/api.dart';
import 'package:wireguard_dart_example/config/colors.dart';
import 'package:wireguard_dart_example/config/constants.dart';
import 'package:wireguard_dart_example/config/storage.dart';
import 'package:wireguard_dart_example/features/authscreen/state/auth_cubit.dart';
import 'package:wireguard_dart_example/features/components/gradient_button.dart';
import 'package:wireguard_dart_example/features/subscribe/models/plan.dart';
import 'package:wireguard_dart_example/features/wrapper/wrapper_view.dart';

class SubscribeView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return WrapperView(
      child: Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                itemCount: bonuses.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      SvgPicture.asset("assets/images/purpleDot.svg"),
                      Text(
                        bonuses[index],
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
                itemCount: plans.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                itemBuilder: (BuildContext context, int index) {
                  Plan plan = plans[index];
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
              Spacer(),
              GradientButton(
                label: "Попробовать 3 дня за 1₽",
                onTap: () async {
                  try {
                    const String promo = "U5PJTC6WB5OOO792G279";
                    final String? uid =
                        await LocalStorage().storage.read(key: StorageConstants().idToken);
                    Response response =
                        await PrivetAPI().dio.get("$baseURL/activatePromo?promo=$promo&uid=$uid");
                    await context.read<AuthCubit>().checkSubscribe();
                  } catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
