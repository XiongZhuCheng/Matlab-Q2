function I = simpson(f, a, b, n)
% 使用复合 Simpson 规则计算积分
if mod(n, 2) ~= 0
    error('n 必须为偶数');
end
h = (b - a) / n;
x = a:h:b;
y = f(x);
I = h/3 * (y(1) + 2 * sum(y(3:2:end-2)) + 4 * sum(y(2:2:end)) + y(end));
end
