ms = 7;

Point(1) = {0, 0, 0, ms};
Point(2) = {0, 0, -50, ms};
Point(3) = {0, 0, -1600, ms};
Point(4) = {0, 0, -4000, ms};

Point(5) = {0, 0, -4007, ms};
Point(6) = {30, 0, -4070, ms};
Point(7) = {100, 0, -4100, ms};

Point(8) = {4000-100, 0, -4100, ms};
Point(9) = {4000-30, 0, -4070, ms};
Point(10) = {4000-0, 0, -4000, ms};

Point(11) = {4000, 0, -1600, ms};
Point(12) = {4000, 0, -50, ms};
Point(13) = {4000, 0, 0, ms};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
BSpline(4) = {5, 6, 7};
Line(5) = {7, 8};
BSpline(6) = {8, 9, 10};
Line(7) = {10, 11};
Line(8) = {11, 12};
Line(9) = {12, 13};

Physical Point("inlet") = {1};
Physical Point("inlet_do") = {5};

Physical Line("left_vertical_up") = {1};
Physical Line("left_vertical_bet") = {2};
Physical Line("left_vertical_down") = {3};
Physical Line("horizontal") = {4,5,6};
Physical Line("right_vertical_down") = {7};
Physical Line("right_vertical_bet") = {8};
Physical Line("right_vertical_up") = {9};
