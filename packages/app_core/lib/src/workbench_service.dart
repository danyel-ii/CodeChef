import 'package:execution_protocol/execution_protocol.dart';
import 'package:executor_broker/executor_broker.dart';
import 'package:recipe_domain/recipe_domain.dart';

class WorkbenchService {
  WorkbenchService(this._broker);

  final ExecutorBroker _broker;

  Future<ExecutionResult> runRecipe(
    ExecutionRequest request, {
    CancellationToken? cancellationToken,
  }) {
    return _broker.execute(
      request,
      cancellationToken: cancellationToken,
    );
  }

  RecipeDocument duplicateRecipe(
    RecipeDocument recipe, {
    required String recipeId,
    required DateTime now,
  }) {
    return recipe.copyWith(
      recipeId: recipeId,
      createdAt: now.toUtc(),
      updatedAt: now.toUtc(),
    );
  }
}
