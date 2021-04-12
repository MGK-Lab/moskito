ms = 7;

Point(1) = {0, -700, 0, ms};
Point(2) = {0, -700, -50, ms};
Point(3) = {0, -700, -1600, ms};

Point(4) = {0, -700, -3300, ms};
Point(5) = {0, -670, -3370, ms};
Point(6) = {0, -607, -3400, ms};

Point(7) = {0, -600, -3400, ms};
Point(8) = {0, -540, -3540, ms};
Point(9) = {0, -407, -3600, ms};

Point(10) = {0, -400, -3600, ms};
Point(11) = {0, -280, -3880, ms};
Point(12) = {0, -7, -4000, ms};

Point(13) = {0, 0, -4000, ms};
Point(14) = {30, 0, -4070, ms};
Point(15) = {100, 0, -4100, ms};

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
BSpline(7) = {13, 14, 15};

Line(8) = {15, 16};

BSpline(9) = {16, 17, 18};
Line(10) = {18, 19};
Line(11) = {19, 20};
Line(12) = {20, 21};

Physical Point("inlet") = {1};
Physical Point("inlet_yaz") = {7};
Physical Point("inlet_dav") = {10};
Physical Point("inlet_do") = {13};

Physical Line("left_vertical_up") = {1};
Physical Line("left_vertical_bet") = {2};
Physical Line("left_vertical_down") = {3};
Physical Line("left_vertical_down_curve") = {4,5,6};
Physical Line("horizontal") = {7,8,9};
Physical Line("right_vertical_down") = {10};
Physical Line("right_vertical_bet") = {11};
Physical Line("right_vertical_up") = {12};
