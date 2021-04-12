ms = 7;

Point(1) = {0, -400, 0, ms};
Point(2) = {0, -400, -50, ms};
Point(3) = {0, -400, -1600, ms};

Point(4) = {0, -400, -3600, ms};
Point(5) = {0, -280, -3880, ms};
Point(6) = {0, -7, -4000, ms};

Point(7) = {0, 0, -4000, ms};
Point(8) = {30, 0, -4070, ms};
Point(9) = {100, 0, -4100, ms};

Point(10) = {4000-100, 0, -4100, ms};
Point(11) = {4000-30, 0, -4070, ms};
Point(12) = {4000-0, 0, -4000, ms};

Point(13) = {4000, 0, -1600, ms};
Point(14) = {4000, 0, -50, ms};
Point(15) = {4000, 0, 0, ms};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
BSpline(4) = {4, 5, 6};
BSpline(5) = {7, 8, 9};

Line(6) = {9, 10};

BSpline(7) = {10, 11, 12};
Line(8) = {12, 13};
Line(9) = {13, 14};
Line(10) = {14, 15};

Physical Point("inlet") = {1};
Physical Point("inlet_do") = {7};

Physical Line("left_vertical_up") = {1};
Physical Line("left_vertical_bet") = {2};
Physical Line("left_vertical_down") = {3};
Physical Line("left_vertical_down_curve") = {4};
Physical Line("horizontal") = {5,6,7};
Physical Line("right_vertical_down") = {8};
Physical Line("right_vertical_bet") = {9};
Physical Line("right_vertical_up") = {10};
