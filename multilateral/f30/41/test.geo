ms = 7;

Point(1) = {0, -600, 0, ms};
Point(2) = {0, -600, -50, ms};
Point(3) = {0, -600, -1600, ms};

Point(4) = {0, -600, -3400, ms};
Point(5) = {0, -540, -3540, ms};
Point(6) = {0, -407, -3600, ms};

Point(7) = {0, -400, -3600, ms};
Point(8) = {0, -280, -3880, ms};
Point(9) = {0, -7, -4000, ms};

Point(10) = {0, 0, -4000, ms};
Point(11) = {30, 0, -4070, ms};
Point(12) = {100, 0, -4100, ms};

Point(13) = {4000-100, 0, -4100, ms};
Point(14) = {4000-30, 0, -4070, ms};
Point(15) = {4000-0, 0, -4000, ms};

Point(16) = {4000, 0, -1600, ms};
Point(17) = {4000, 0, -50, ms};
Point(18) = {4000, 0, 0, ms};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
BSpline(4) = {4, 5, 6};
BSpline(5) = {7, 8, 9};
BSpline(6) = {10, 11, 12};

Line(7) = {12, 13};

BSpline(8) = {13, 14, 15};
Line(9) = {15, 16};
Line(10) = {16, 17};
Line(11) = {17, 18};

Physical Point("inlet") = {1};
Physical Point("inlet_dav") = {7};
Physical Point("inlet_do") = {10};


Physical Line("left_vertical_up") = {1};
Physical Line("left_vertical_bet") = {2};
Physical Line("left_vertical_down") = {3};
Physical Line("left_vertical_down_curve") = {4,5};
Physical Line("horizontal") = {6,7,8};
Physical Line("right_vertical_down") = {9};
Physical Line("right_vertical_bet") = {10};
Physical Line("right_vertical_up") = {11};
