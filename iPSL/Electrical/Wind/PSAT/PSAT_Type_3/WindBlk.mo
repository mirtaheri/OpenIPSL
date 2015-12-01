within iPSL.Electrical.Wind.PSAT.PSAT_Type_3;


model WindBlk
  import Modelica.Constants.pi;
  Modelica.Blocks.Interfaces.RealInput vw "Real voltage" annotation(Placement(transformation(extent = {{-102.0, 54.0}, {-62.0, 94.0}}, origin = {-43.0, 7.7602}, rotation = 0), visible = true, iconTransformation(origin = {2.0, -2.4053}, extent = {{-102.0, 54.0}, {-62.0, 94.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput theta_p "Real voltage" annotation(Placement(transformation(extent = {{-102.0, 54.0}, {-62.0, 94.0}}, origin = {-43.0, -34.0}, rotation = 0), visible = true, iconTransformation(origin = {2.0, -76.5688}, extent = {{-102.0, 54.0}, {-62.0, 94.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput omega_m "Real voltage" annotation(Placement(transformation(extent = {{-102.0, 54.0}, {-62.0, 94.0}}, origin = {-43.0, -74.0}, rotation = 0), visible = true, iconTransformation(origin = {2.0, -146.3226}, extent = {{-102.0, 54.0}, {-62.0, 94.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Tm "Real voltage" annotation(Placement(transformation(extent = {{102.0, 54.0}, {62.0, 94.0}}, origin = {43.0, -74.0}, rotation = 0), visible = true, iconTransformation(origin = {-2.0, -71.3573}, extent = {{102.0, 54.0}, {62.0, 94.0}}, rotation = 0)));
  parameter Real vw_base = 15 "Vw Nominal (m/s)";
  parameter Real rho = 1.225 "Air Density (kg/m^3)";
  parameter Real Sbase = 100 "Power Rating [Normalization Factor] (MVA)";
  parameter Real l = 75 "Blade length (m)";
  parameter Real ngb = 0.01123596 "gear box ratio";
  parameter Real Radapt = ngb * l "r_{gearbox}*r";
  parameter Real poles = 2 "Number of poles-pair";
  parameter Real freq = 50 "frequency rating (Hz)";
  parameter Real wbase = 2 * pi * freq;
  parameter Real Ar = pi * l ^ 2 "blades area";
  Real lambda "Tip speed Ratio";
  Real lambdai "Tip Speed Ratio optimal";
  Real cp "Capacity coefficient";
  Real Pw "Power in the Wind";
equation
  lambda = omega_m * wbase * Radapt / (vw * vw_base);
  lambdai = 1 / (1 / (lambda + 0.08 * theta_p) - 0.035 / (theta_p ^ 3 + 1));
  cp = 0.22 * (116 / lambdai - 0.4 * theta_p - 5) * exp(-12.5 / lambdai);
  Pw = 0.5 * rho * cp * Ar * (vw * vw_base) ^ 3 / (Sbase * 1000000.0);
  Tm = Pw / omega_m;
  annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible=  true, fillColor=  {255, 255, 255}, extent=  {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible=  true, origin=  {5.2917, -1.4606}, fillPattern=  FillPattern.Solid, extent=  {{-39.3935, -41.4606}, {39.3935, 41.4606}}, textString=  "wind", fontName=  "Arial")}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
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
end WindBlk;
