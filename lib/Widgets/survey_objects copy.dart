import 'package:flutter/widgets.dart';
import 'package:research_package/model.dart';

List<RPChoice> boolChoices = [
  RPChoice.withParams("Yes", 1),
  RPChoice.withParams("No", 0),
];


RPChoiceAnswerFormat choiceAnswerFormat = RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, boolChoices);



RPQuestionStep singleChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "Would you be interested in signing up?",
  choiceAnswerFormat,
);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "instructionID",
  imagePath: "assets/graphic.jpg",
  title: "",
)..text =
    "Please fill out this questionnaire if you're interested in learning more about Keva Platform!.";

RPFormStep formStep = RPFormStep.withTitle("formstepID",[singleChoiceQuestionStep], '');

RPOrderedTask surveyTask2 = RPOrderedTask(
  "surveyTaskID",
  [
    singleChoiceQuestionStep
  ],
);
