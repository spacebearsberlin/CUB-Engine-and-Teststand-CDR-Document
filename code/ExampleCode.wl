(*Three Body Problem in Mathematica*)


(*Body Masses*)
m1 = 1;
m2 = 1;
m3 = 10;

(*Gravitational Parameter*)
G = 0.1;

ClearAll[x1, x2, x3, y1, y2, y3];
(*Initial Positions*)
initialPositions = {
	x1[0] == 5,
	y1[0] == 0,
	
	x2[0] == -5,
	y2[0] == 0,
	
	x3[0] == 0,
	y3[0] == 0
};

(*Initial Velocities*)
initialVelocities = {
	x1'[0] == -0.1,
	y1'[0] == 1,
	
	x2'[0] == 1,
	y2'[0] == 1,
	
	x3'[0] == 0,
	y3'[0] == 0
};

(*Kepler's Law*)
equations = {
	x1''[t] == G * m2 / (Sqrt[(x2[t] - x1[t])^2 + (y2[t] - y1[t])^2]^3) * (x2[t] - x1[t]) + G * m3 / (Sqrt[(x3[t] - x1[t])^2 + (y3[t] - y1[t])^2]^3) * (x3[t] - x1[t]),
	x2''[t] == G * m1 / (Sqrt[(x1[t] - x2[t])^2 + (y1[t] - y2[t])^2]^3) * (x1[t] - x2[t]) + G * m3 / (Sqrt[(x3[t] - x2[t])^2 + (y3[t] - y2[t])^2]^3) * (x3[t] - x2[t]),
	x3''[t] == G * m1 / (Sqrt[(x1[t] - x3[t])^2 + (y1[t] - y3[t])^2]^3) * (x1[t] - x3[t]) + G * m2 / (Sqrt[(x2[t] - x3[t])^2 + (y2[t] - y3[t])^2]^3) * (x2[t] - x3[t]),
	
	y1''[t] == G * m2 / (Sqrt[(x2[t] - x1[t])^2 + (y2[t] - y1[t])^2]^3) * (x2[t] - x1[t]) + G * m3 / (Sqrt[(x3[t] - x1[t])^2 + (y3[t] - y1[t])^2]^3) * (y3[t] - y1[t]),
	y2''[t] == G * m1 / (Sqrt[(x1[t] - x2[t])^2 + (y1[t] - y2[t])^2]^3) * (x1[t] - x2[t]) + G * m3 / (Sqrt[(x3[t] - x2[t])^2 + (y3[t] - y2[t])^2]^3) * (y3[t] - y2[t]),
	y3''[t] == G * m1 / (Sqrt[(x1[t] - x3[t])^2 + (y1[t] - y3[t])^2]^3) * (x1[t] - x3[t]) + G * m2 / (Sqrt[(x2[t] - x3[t])^2 + (y2[t] - y3[t])^2]^3) * (y2[t] - y3[t])
};

(*Calculate Numerical Solution*)
solution = NDSolve[Flatten[{initialPositions, initialVelocities, equations}], {x1, x2, x3, y1, y2, y3}, {t, 0, 10}];
{{x1, x2, x3, y1, y2, y3}} = {x1, x2, x3, y1, y2, y3}/.solution;

(*Create Parametric Plot*)
plot = ParametricPlot[{{x1[t], y1[t]}, {x2[t], y2[t]}, {x3[t], y3[t]}}, {t, 0, 50}]