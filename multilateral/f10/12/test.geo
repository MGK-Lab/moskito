ms = 7;

Point(1) = {0, 0, 0, ms};
Point(2) = {0, 0, -50, ms};
Point(3) = {0, 0, -1600, ms};
Point(4) = {0, 0, -4000, ms};

Point(5) = {0, 0, -4007, ms};
Point(6) = {30, 0, -4070, ms};
Point(7) = {100, 0, -4100, ms};

Point(8) = {107, 0, -4100, ms};
Point(9) = {220, -280, -4100, ms};
Point(10) = {500, -400, -4100, ms};

Point(11) = {4000-500, -400, -4100, ms};
Point(12) = {4000-220, -280, -4100, ms};
Point(13) = {4000-107, 0, -4100, ms};

Point(14) = {4000-100, 0, -4100, ms};
Point(15) = {4000-30, 0, -4070, ms};
Point(16) = {4000-0, 0, -4000, ms};

Point(17) = {4000, 0, -1600, ms};
Point(18) = {4000, 0, -50, ms};
Point(19) = {4000, 0, 0, ms};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
BSpline(4) = {5, 6, 7};
BSpline(5) = {8, 9, 10};

Line(6) = {10, 11};

BSpline(7) = {11, 12, 13};
BSpline(8) = {14, 15, 16};
Line(9) = {16, 17};
Line(10) = {17, 18};
Line(11) = {18, 19};

Physical Point("inlet") = {1};
Physical Point("inlet_do") = {5};
Physical Point("inlet_se") = {8};
Physical Point("inlet_hash") = {14};

Physical Line("left_vertical_up") = {1};
Physical Line("left_vertical_bet") = {2};
Physical Line("left_vertical_down") = {3};
Physical Line("horizontal") = {4,5,6,7,8};
Physical Line("right_vertical_down") = {9};
Physical Line("right_vertical_bet") = {10};
Physical Line("right_vertical_up") = {11};
