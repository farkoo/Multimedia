function I = color_change(I, W, new_color)
%% در این قسمت پیکسل انتخابی کاربر برای تغییر رنگ را دریافت میکند.
    imshow(I);
    [column, row] = ginput(1);
    column = round(column);
    row = round(row);
    hold on;
    plot(column, row, 'xg', 'MarkerSize', 20, 'LineWidth', 2);
%% در این قسمت کل پیکسهای تصویر را بررسی میکند و اگر با مقدار W اختلاف در ن
% رنگ پیکسل در ناحیه انتخابی باشد آن پیکسل رنگ جدیدی میگیرد که به اندازه ای
% که از رنگ انتخابی رنگ جاری اختلاف داشته باشد به همان میزان نیز از رنگ
% جایگزین اختلاف خواهد داشت.
    MR = I(row, column, 1);
    MG = I(row, column, 2);
    MB = I(row, column, 3);
    for i = 1 : size(I, 1)
        for j = 1 : size(I, 2)
            if (I(i, j, 1) <= MR + W && I(i, j, 1) >= MR - W && I(i, j, 2) <= MG + W && I(i, j, 2) >= MG - W && I(i, j, 3) <= MB + W && I(i, j, 3) >= MB - W)
                I(i, j, 1) = new_color(1) + I(i, j, 1) - MR;
                I(i, j, 2) = new_color(2) + I(i, j, 2) - MG;
                I(i, j, 3) = new_color(3) + I(i, j, 3) - MB;
            end
        end
    end
    imshow(I);