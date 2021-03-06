within OpenIPSL.Electrical.Solar.KTH.Auxiliary;
model Calcurrent
  parameter Types.Voltage Udc0=700 "Initial dc voltage";
  Modelica.Blocks.Interfaces.RealInput yi annotation (Placement(
      transformation(
        origin={-155.0,40.0},
        extent={{-20.0,-20.0},{20.0,20.0}}),
      iconTransformation(
        origin={-120.0,40.0},
        extent={{-20.0,-20.0},{20.0,20.0}})));
  Modelica.Blocks.Interfaces.RealInput udc(start=Udc0) annotation (Placement(
      transformation(
        origin={-150.0,-15.0},
        extent={{-20.0,-20.0},{20.0,20.0}}),
      iconTransformation(
        origin={-120.0,-50.0},
        extent={{-20.0,-20.0},{20.0,20.0}})));
  Modelica.Blocks.Interfaces.RealOutput yo annotation (Placement(
      transformation(
        origin={157.5089,7.3692},
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        origin={110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
equation
  yo = yi/udc*1000000;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Text(
          origin={-80.1182,38.5265},
          fillPattern=FillPattern.Solid,
          extent={{-13.2292,-11.4735},{13.2292,11.4735}},
          textString="0",
          fontName="Arial"),Text(
          origin={-80.0,-51.4735},
          fillPattern=FillPattern.Solid,
          extent={{-13.2292,-11.4735},{13.2292,11.4735}},
          textString="1",
          fontName="Arial"),Text(
          origin={76.7708,-0.0},
          fillPattern=FillPattern.Solid,
          extent={{-13.2292,-11.4735},{13.2292,11.4735}},
          textString="out",
          fontName="Arial"),Rectangle(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={-2.514,58.5651},
          fillPattern=FillPattern.Solid,
          extent={{-27.486,-14.5669},{27.486,14.5669}},
          textString="Calc_current",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Last update</p></td>
<td>2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end Calcurrent;
