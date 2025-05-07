import 'dart:math';
import 'method.dart';

void main() {
  //################# Constants ###################
  double V = 100; // Velocity (m/s)
  double S = 30; // Surface area (m²)
  double CD0 =
      0.025; // Zero-lift[parasite] drag coefficient
  double AR = 9.0; // Aspect ratio
  double e = 0.82; // Oswald efficiency factor
  double weight = 40000; // Weight Of A/C (N)
  double rho = 1.058; // Air density (kg/m³)
  //################# User Input ###################
  double altitude;
  double thrustAvailable_TA;
  double powerAvailable_PA;
  //################# Results ###################
  double CL;
  double parasiteDrag_Do;
  double inducedDrag_Di;
  double thrustRequired_TR;
  double powerRequired_PR;
  double excessThrust_ET;
  double excessPower_EP;
  double rateOfClimb_Thrust;
  double rateOfClimb_Power;
  //################---Main Menu---######################
  double count = displayMenuAndGetChoice();
  if (count == 1) {
  } else if (count == 2) {
    // Continue with user input
    ChangePropertiesValue();
  } else if (count == -1) {
    return;
  } else {
    print('Invalid choice.');
    return;
  }
  // ################### User Input Required ##################
  // Take Altitude input
  altitude = getDoubleInput(text: 'Altitude');
  // Take Thrust available input
  thrustAvailable_TA = getDoubleInput(
    text: 'Thrust available',
  );
  // Take Power available input
  powerAvailable_PA = getDoubleInput(
    text: 'Power available',
  );
  //############## Calc Left Coefficient ##############
  CL =
      (2 * weight) /
      (rho * pow(V, 2) * S); // Lift coefficient
  // Calc Left
  double left_L = 1 / 2 * rho * pow(V, 2) * S * CL;
  //################## Calc Drag #######################
  // Calc Parasite Drag
  parasiteDrag_Do = 1 / 2 * rho * pow(V, 2) * S * CD0;
  //##########################################
  // Calc (Induced Drag Coefficient)
  double CDI = pow(CL, 2) / (pi * e * AR);
  //Calc Induced Drag
  inducedDrag_Di = 1 / 2 * rho * pow(V, 2) * S * CDI;
  // ######### Calc Total Drag#################
  double totalDrag = parasiteDrag_Do + inducedDrag_Di;
  // # OR
  //    totalDrag = (CD0 + CDI) * 1 / 2 * rho * pow(V, 2) * S
  //################## Calc Thrust Required #######################
  thrustRequired_TR = totalDrag;
  //##################Calc Power Required #######################
  powerRequired_PR = thrustRequired_TR * V;
  // calc Excess Thrust
  //################# Calc Excess Thrust #######################
  excessThrust_ET = thrustAvailable_TA - thrustAvailable_TA;
  //################# Calc Excess Power #######################
  excessPower_EP = powerAvailable_PA - powerRequired_PR;
  // Calc Rate Of Climb
  rateOfClimb_Thrust = (excessThrust_ET * V) / weight;
  // Calc Rate Of Climb
  rateOfClimb_Power = (excessPower_EP) / weight;

  //Display All Result
  printFlightData(
    left_L: left_L,
    thrustAvailable_TA: thrustAvailable_TA,
    powerAvailable_PA: powerAvailable_PA,
    parasiteDrag_Do: parasiteDrag_Do,
    inducedDrag_Di: inducedDrag_Di,
    totalDrag_D: totalDrag,
    thrustRequired_TR: thrustRequired_TR,
    powerRequired_PR: powerRequired_PR,
    excessThrust_ET: excessThrust_ET,
    excessPower_EP: excessPower_EP,
    weight: weight,
    rateOfClimb_Thrust: rateOfClimb_Thrust,
    rateOfClimb_Power: rateOfClimb_Power,
    altitude: altitude,
  );
}
