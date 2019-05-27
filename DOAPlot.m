function DOAPlot(DOA_TOP,DOA_SIDE)
% Visualisation from the top veiw
figure('Name','Estimate of the DOA','NumberTitle','off','Position', [1 1 550 900]);
subplot(2,1,1)
hold on
% Unite cirkel
r = 1;
theta = linspace(0,2*pi);
x = r*cos(theta);
y = r*sin(theta);
plot(x,y,'b')
% DRONE drawing
p1x = [0.1 0.1];
p1y = [0.05 -0.05];
p2x = [0.05 -0.05];
p2y = [0.1 0.1];
p3x = [-0.1 -0.1];
p3y = [0.05 -0.05];
p4x = [-0.05 0.05];
p4y = [-0.1 -0.1];
angel = (pi*22.62/180);
r2 = 0.075;
p5x = [0.05 0.2-cos(angel)*r2];
p5y = [0.1 0.2-sin(angel)*r2];
p6x = [0.1 0.2-sin(angel)*r2];
p6y = [0.05 0.2-cos(angel)*r2];
p7x = [-0.05 -0.2+cos(angel)*r2];
p7y = [0.1 0.2-sin(angel)*r2];
p8x = [-0.1 -0.2+sin(angel)*r2];
p8y = [0.05 0.2-cos(angel)*r2];
p9x = [-0.1 -0.2+sin(angel)*r2];
p9y = [-0.05 -0.2+cos(angel)*r2];
p10x = [-0.05 -0.2+cos(angel)*r2];
p10y = [-0.1 -0.2+sin(angel)*r2];
p11x = [0.05 0.2-cos(angel)*r2];
p11y = [-0.1 -0.2+sin(angel)*r2];
p12x = [0.1 0.2-sin(angel)*r2];
p12y = [-0.05 -0.2+cos(angel)*r2];
plot(p1x,p1y,'k')
plot(p2x,p2y,'k')
plot(p3x,p3y,'k')
plot(p4x,p4y,'k')
plot(p5x,p5y,'k')
plot(p6x,p6y,'k')
plot(p7x,p7y,'k')
plot(p8x,p8y,'k')
plot(p9x,p9y,'k')
plot(p10x,p10y,'k')
plot(p11x,p11y,'k')
plot(p12x,p12y,'k')
x1 = r2*cos(theta)+0.2;
y1 = r2*sin(theta)+0.2;
plot(x1,y1,'k--')
x2 = r2*cos(theta)-0.2;
y2 = r2*sin(theta)+0.2;
plot(x2,y2,'k--')
x3 = r2*cos(theta)-0.2;
y3 = r2*sin(theta)-0.2;
plot(x3,y3,'k--')
x4 = r2*cos(theta)+0.2;
y4 = r2*sin(theta)-0.2;
plot(x4,y4,'k--')

% DOA offset
DOA_TOP = DOA_TOP+90;
% DOA plot
A = tan(pi*DOA_TOP/180);
z = linspace(0,cos(pi*DOA_TOP/180));
plot(z,A*z,'r')
% DOA CONE plot
DOAP_TOP=DOA_TOP+10;
p = tan(pi*DOAP_TOP/180);
e = linspace(0,cos(pi*DOAP_TOP/180));
plot(e,p*e,'g--')

DOAN_TOP=DOA_TOP-10;
n = tan(pi*DOAN_TOP/180);
angel = linspace(0,cos(pi*DOAN_TOP/180));
plot(angel,n*angel,'g--')
% Text in the figure
text(-0.23,1.1,'Azimuth Estimate')
ax = gca;
ax.XAxis.Color = 'none';
ax.YAxis.Color = 'none';
txt = ['The angle is ',num2str(DOA_TOP-90)];
% Move text out of the way
if DOA_TOP > 90 && DOA_TOP < 270
    text(-0.2,0.4,txt)
else
    text(-0.2,-0.4,txt)
end    

hold off

% Visualisation from the side veiw
%figure('Name','Side View of Estimate','NumberTitle','off');
subplot(2,1,2)
hold on
% Unit circel
r = 1;
theta = linspace(0,2*pi);
x = r*cos(theta);
y = r*sin(theta);
plot(x,y,'b')
% Drone
plot(0.05,0.05,'r.')
plot(-0.05,0.05,'r.')
plot(-0.05,-0.05,'r.')
plot(0.05,-0.05,'r.')
plot(0,0,'b.')
plot([-0.05 -0.05],[-0.05 0.12],'k')
plot([0.05 0.05],[-0.05 0.12],'k')
plot([-0.15 0.15],[0.12 0.12],'k')
plot([-0.15 0.15],[0.14 0.14],'k')
plot([-0.15 -0.15],[0.12 0.14],'k')
plot([0.15 0.15],[0.12 0.14],'k')
plot([-0.15 -0.1],[0.15 0.15],'k')
plot([-0.15 -0.1],[0.16 0.16],'k')
plot([0.1 0.15],[0.15 0.15],'k')
plot([0.1 0.15],[0.16 0.16],'k')
plot([-0.15 -0.15],[0.15 0.16],'k')
plot([-0.1 -0.1],[0.15 0.16],'k')
plot([0.15 0.15],[0.15 0.16],'k')
plot([0.1 0.1],[0.15 0.16],'k')
plot([-0.12 -0.12],[0.15 0.14],'k')
plot([-0.13 -0.13],[0.15 0.14],'k')
plot([0.12 0.12],[0.15 0.14],'k')
plot([0.13 0.13],[0.15 0.14],'k')

% DOA_SIDE plot
A = tan(pi*DOA_SIDE/180);
z = linspace(0,cos(pi*DOA_SIDE/180));
plot(z,A*z,'r')
% DOA_SIDE CONE plot
DOAP_SIDE=DOA_SIDE+10;
p2 = tan(pi*DOAP_SIDE/180);
e2 = linspace(0,cos(pi*DOAP_SIDE/180));
plot(e2,p2*e2,'g--')

DOAN_SIDE=DOA_SIDE-10;
n2 = tan(pi*DOAN_SIDE/180);
angel = linspace(0,cos(pi*DOAN_SIDE/180));
plot(angel,n2*angel,'g--')
% Text in the figure
txt = ['The angle is ',num2str(DOA_SIDE)];
text(-0.25,1.1,'Elevation Estimate')
ax = gca;
ax.XAxis.Color = 'none';
ax.YAxis.Color = 'none';
% Move text out of the way
if DOA_SIDE > 180 
    text(-0.2,0.4,txt)
else
    text(-0.2,-0.4,txt)
end   
hold off
%44100(sampel/s)/8*16(bit/sampel)




