while 1;
    for r11 = -2:0.01:4;
        p1 = 0:0.01:1;
        p2 = 1 - p1;
        plot((r11-3)*p1+3,p1,3*p1-1,p1)
        xlim([-5 5])
        ylim([0 1])
        title(['r11 = ' num2str(round(r11,3))])
        ax = gca;
        ax.FontSize = 20;
        drawnow
        if (r11 == -2)||(r11 == 0)||(r11 == 2)||(r11 == 4);
            pause(3)
        end
    end
end