within iPSL.Electrical.Controls.DTU;


model pwPLL2 "Developed by DTU"
  parameter Real Kp = 10;
  parameter Real Ki = 30;
  parameter Real fmin = 0.8;
  parameter Real fmax = 1.2;
  parameter Real fnom = 50;
  parameter Real ini_PIIntegrator;
  parameter Real ini_Integrator(fixed = false);
  iPSL.Connectors.PwPin Vpin annotation(Placement(transformation(extent = {{-80, -6}, {-68, 6}}), iconTransformation(extent = {{-80, -6}, {-68, 6}})));
  Modelica.Blocks.Interfaces.RealOutput freq_meas annotation(Placement(transformation(extent = {{68, -26}, {80, -14}}), iconTransformation(extent = {{45, -36}, {59, -24}})));
  iPSL.Electrical.Sensors.PwVoltage pwVoltage annotation(Placement(transformation(extent = {{-68, -10}, {-48, 10}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator(k = Ki, y_start = ini_PIIntegrator, outMin = fmin, outMax = fmax, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{-12, -20}, {-4, -12}})));
  Modelica.Blocks.Math.Gain imGain(k = Kp) annotation(Placement(transformation(extent = {{-12, 12}, {-4, 20}})));
  Modelica.Blocks.Interfaces.RealInput freq annotation(Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {11, -37}), iconTransformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {0, -56})));
  Modelica.Blocks.Interfaces.RealOutput phi_meas annotation(Placement(transformation(extent = {{60, 14}, {72, 26}}), iconTransformation(extent = {{45, 24}, {59, 36}})));
  Modelica.Blocks.Continuous.Integrator imIntegrator(k = 1, y_start = ini_Integrator, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{50, -8}, {58, 0}})));
  Modelica.Blocks.Math.Gain imGain1(k = 1 / (2 * Modelica.Constants.pi * fnom)) annotation(Placement(transformation(extent = {{42, -24}, {50, -16}})));
  Modelica.Blocks.Math.Add add(k1 = -1, k2 = 1) annotation(Placement(transformation(extent = {{-28, -4}, {-20, 4}})));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-44, 20}, {-36, 28}})));
  Modelica.Blocks.Math.Product product1 annotation(Placement(transformation(extent = {{-44, -28}, {-36, -20}})));
  Modelica.Blocks.Math.Add add1(k2 = 1, k1 = 1) annotation(Placement(transformation(extent = {{0, -4}, {8, 4}})));
  Modelica.Blocks.Math.Add add2(k2 = 1, k1 = 1) annotation(Placement(transformation(extent = {{20, -6}, {28, 2}})));
  Modelica.Blocks.Math.Add add3(k1 = 1, k2 = -1) annotation(Placement(transformation(extent = {{36, -8}, {44, 0}})));
  Modelica.Blocks.Math.Sin sin annotation(Placement(transformation(extent = {{16, 52}, {0, 68}})));
  Modelica.Blocks.Math.Sin sin1 annotation(Placement(transformation(extent = {{16, -68}, {0, -52}})));
initial equation
  ini_Integrator = Modelica.Math.atan(Vpin.vi / Vpin.vr);
equation
  connect(pwVoltage.p, Vpin) annotation(Line(points = {{-63, 0}, {-74, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(add.y, imGain.u) annotation(Line(points = {{-19.6, 0}, {-16, 0}, {-16, 16}, {-12.8, 16}}, color = {0, 0, 127}));
  connect(imLimitedIntegrator.u, imGain.u) annotation(Line(points = {{-12.8, -16}, {-16, -16}, {-16, 16}, {-12.8, 16}}, color = {0, 0, 127}));
  connect(product1.y, add.u2) annotation(Line(points = {{-35.6, -24}, {-32, -24}, {-32, -2.4}, {-28.8, -2.4}}, color = {0, 0, 127}));
  connect(product.y, add.u1) annotation(Line(points = {{-35.6, 24}, {-32, 24}, {-32, 2.4}, {-28.8, 2.4}}, color = {0, 0, 127}));
  connect(pwVoltage.vr, product.u2) annotation(Line(points = {{-53.1, 3}, {-50, 3}, {-50, 21.6}, {-44.8, 21.6}}, color = {0, 0, 127}));
  connect(pwVoltage.vi, product1.u1) annotation(Line(points = {{-53.1, 0}, {-50, 0}, {-50, -21.6}, {-44.8, -21.6}}, color = {0, 0, 127}));
  connect(imLimitedIntegrator.y, add1.u2) annotation(Line(points = {{-3.6, -16}, {-0.8, -16}, {-0.8, -2.4}}, color = {0, 0, 127}));
  connect(imGain.y, add1.u1) annotation(Line(points = {{-3.6, 16}, {-0.8, 16}, {-0.8, 2.4}}, color = {0, 0, 127}));
  connect(add1.y, add2.u1) annotation(Line(points = {{8.4, 0}, {19.2, 0}, {19.2, 0.4}}, color = {0, 0, 127}));
  connect(add2.u2, freq) annotation(Line(points = {{19.2, -4.4}, {11, -4.4}, {11, -37}}, color = {0, 0, 127}));
  connect(add3.u1, add2.y) annotation(Line(points = {{35.2, -1.6}, {28.4, -1.6}, {28.4, -2}}, color = {0, 0, 127}));
  connect(sin.u, phi_meas) annotation(Line(points = {{17.6, 60}, {38, 60}, {66, 60}, {66, 20}}, color = {0, 0, 127}));
  connect(sin.y, product.u1) annotation(Line(points = {{-0.8, 60}, {-50, 60}, {-50, 26.4}, {-44.8, 26.4}}, color = {0, 0, 127}));
  connect(sin1.u, phi_meas) annotation(Line(points = {{17.6, -60}, {62, -60}, {62, -4}, {62, -4}, {62, 20}, {66, 20}}, color = {0, 0, 127}));
  connect(sin1.y, product1.u2) annotation(Line(points = {{-0.8, -60}, {-50, -60}, {-50, -26.4}, {-44.8, -26.4}}, color = {0, 0, 127}));
  connect(imIntegrator.u, add3.y) annotation(Line(points = {{49.2, -4}, {44.4, -4}, {44.4, -4}}, color = {0, 0, 127}));
  connect(imIntegrator.y, phi_meas) annotation(Line(points = {{58.4, -4}, {62, -4}, {62, 20}, {66, 20}}, color = {0, 0, 127}));
  connect(imGain1.y, freq_meas) annotation(Line(points = {{50.4, -20}, {74, -20}, {74, -20}}, color = {0, 0, 127}));
  connect(add3.u2, freq) annotation(Line(points = {{35.2, -6.4}, {32, -6.4}, {32, -20}, {11, -20}, {11, -37}}, color = {0, 0, 127}));
  connect(imGain1.u, add2.y) annotation(Line(points = {{41.2, -20}, {34, -20}, {34, -10}, {30, -10}, {30, -2}, {28.4, -2}, {28.4, -2}}, color = {0, 0, 127}));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-68, 46}, {46, -50}}, lineColor=  {0, 0, 255}, lineThickness=  0.5), Text(extent=  {{-42, 20}, {20, -24}}, lineColor=  {0, 0, 255}, lineThickness=  0.5, fillPattern=  FillPattern.Solid, textString=  "PLL")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end pwPLL2;
