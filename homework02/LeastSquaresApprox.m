

x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
y = [1.3, 3.5, 4.2, 5.0, 7.0, 8.8, 10.1, 12.5, 13.0, 15.6];
m = 10;

topA = 0;
topBLeft = 0;
topBRight = 0;
bottomLeft = 0;
bottomRight = 0;
for i = 1:m
    topA = topA + (x(i) * x(i) * y(i)) - (x(i) * y(i) * x(i));
    topBLeft = topBLeft + x(i) * y(i);
    topBRight = topBRight + x(i) * y(i);
    bottomLeft = bottomLeft + x(i) * x(i);
    bottomRight = bottomRight + x(i);
end

bottom = m * bottomLeft - bottomRight * bottomRight;
topB = (m * topBLeft) - topBRight;

a0 = topA / bottom
a1 = topB / bottom