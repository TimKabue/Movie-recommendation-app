import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation/core/constants.dart';
import 'package:movie_recommendation/core/widgets/primary_button.dart';
import 'package:movie_recommendation/features/movie_flow/movie_flow_controller.dart';

import '../result/result_screen.dart';

class YearsBackScreen extends ConsumerWidget {

  double yearsBack = 10; //State
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'How many years back should we check for?',
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ref.watch(movieFlowControllerProvider).yearsBack}',
                  style: theme.textTheme.headlineMedium,
                ),
                Text(
                  'Years back',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.62),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Slider(
              value: ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
              min: 0.0,
              max: 70.0,
              divisions: 70,
              label: '${ref.watch(movieFlowControllerProvider).yearsBack}',
              onChanged: (value) {
                ref.read(movieFlowControllerProvider.notifier).updateYearsBack(value.toInt());
              },
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: (){
                Navigator.push(context, ResultScreen.route());
              },
              text: 'Amazing',
            ),
            const SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
