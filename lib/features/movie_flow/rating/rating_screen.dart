import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation/core/constants.dart';
import 'package:movie_recommendation/core/widgets/primary_button.dart';
import 'package:movie_recommendation/features/movie_flow/movie_flow_controller.dart';

class RatingScreen extends ConsumerWidget {
  double rating = 5; //State
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Select a minimum rating\nranging from 1-10',
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${rating.ceil()}',
                  style: theme.textTheme.headlineMedium,
                ),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 62.0,
                ),
              ],
            ),
            const Spacer(),
            Slider(
              value: ref.watch(movieFlowControllerProvider).rating.toDouble(),
              min: 1.0,
              max: 10.0,
              divisions: 10,
              label: '${ref.watch(movieFlowControllerProvider).rating}',
              onChanged: (value) {
                ref.read(movieFlowControllerProvider.notifier).updateRating(value.toInt());
              },
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage,
              text: 'Yes please',
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
