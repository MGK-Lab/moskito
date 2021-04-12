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

Point(10) = {107, 0, -4100, ms};
Point(11) = {220, -280, -4100, ms};
Point(12) = {500, -400, -4100, ms};

Point(13) = {4000-500, -400, -4100, ms};
Point(14) = {4000-220, -280, -4100, ms};
Point(15) = {4000-107, 0, -4100, ms};

Point(16) = {4000-100, 0, -4100, ms};
Point(17) = {4000-30, 0, -4070, ms};
Point(18) = {4000-0, 0, -4000, ms};

Point(19) = {4000, 0, -1600, ms};
Point(20) = {4000, 0, -50, ms};
Point(21) = {4000, 0, 0, ms};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
BSpline(4) = {4, 5, 6};
BSpline(5) = {7, 8, 9};
BSpline(6) = {10, 11, 12};

Line(7) = {12, 13};

BSpline(8) = {13, 14, 15};
BSpline(9) = {16, 17, 18};
Line(10) = {18, 19};
Line(11) = {19, 20};
Line(12) = {20, 21};

Physical Point("inlet") = {1};
Physical Point("inlet_do") = {7};
Physical Point("inlet_se") = {10};
Physical Point("inlet_hash") = {16};

Physical Line("left_vertical_up") = {1};
Physical Line("left_vertical_bet") = {2};
Physical Line("left_vertical_down") = {3};
Physical Line("left_vertical_down_curve") = {4};
Physical Line("horizontal") = {5,6,7,8,9};
Physical Line("right_vertical_down") = {10};
Physical Line("right_vertical_bet") = {11};
Physical Line("right_vertical_up") = {12};
