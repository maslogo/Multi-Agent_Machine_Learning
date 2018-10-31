while 1;
    for r11 = -2:0.01:4;
        q1 = 0:0.01:1;
        q2 = 1 - q1;
        plot((2-r11)*q1-2,q1,(-4)*q1+1,q1)
        xlim([-5 5])
        ylim([0 1])
        title(['r11 = ' num2str(r11)])
        ax = gca;
        ax.FontSize = 20;
        drawnow
        if (r11 == -2)||(r11 == 0)||(r11 == 2)||(r11 == 4);
            pause(3)
        end
    end
end