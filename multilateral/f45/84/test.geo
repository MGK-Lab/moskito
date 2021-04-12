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

Point(16) = {107, 0, -4100, ms};
Point(17) = {220, -280, -4100, ms};
Point(18) = {500, -400, -4100, ms};

Point(19) = {507, -400, -4100, ms};
Point(20) = {560, -540, -4100, ms};
Point(21) = {700, -600, -4100, ms};

Point(22) = {4000-700, -600, -4100, ms};
Point(23) = {4000-560, -540, -4100, ms};
Point(24) = {4000-507, -400, -4100, ms};

Point(25) = {4000-500, -400, -4100, ms};
Point(26) = {4000-220, -280, -4100, ms};
Point(27) = {4000-107, 0, -4100, ms};

Point(28) = {4000-100, 0, -4100, ms};
Point(29) = {4000-30, 0, -4070, ms};
Point(30) = {4000-0, 0, -4000, ms};

Point(31) = {4000, 0, -1600, ms};
Point(32) = {4000, 0, -50, ms};
Point(33) = {4000, 0, 0, ms};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
BSpline(4) = {4, 5, 6};
BSpline(5) = {7, 8, 9};
BSpline(6) = {10, 11, 12};
BSpline(7) = {13, 14, 15};
BSpline(8) = {16, 17, 18};
BSpline(9) = {19, 20, 21};

Line(10) = {21, 22};

BSpline(11) = {22, 23, 24};
BSpline(12) = {25, 26, 27};
BSpline(13) = {28, 29, 30};
Line(14) = {30, 31};
Line(15) = {31, 32};
Line(16) = {32, 33};

Physical Point("inlet") = {1};
Physical Point("inlet_yaz") = {7};
Physical Point("inlet_dav") = {10};
Physical Point("inlet_do") = {13};
Physical Point("inlet_se") = {16};
Physical Point("inlet_ch") = {19};

Physical Point("inlet_haf") = {25};
Physical Point("inlet_hash") = {28};

Physical Line("left_vertical_up") = {1};
Physical Line("left_vertical_bet") = {2};
Physical Line("left_vertical_down") = {3};
Physical Line("left_vertical_down_curve") = {4,5,6};
Physical Line("horizontal") = {7,8,9,10,11,12,13};
Physical Line("right_vertical_down") = {14};
Physical Line("right_vertical_bet") = {15};
Physical Line("right_vertical_up") = {16};
