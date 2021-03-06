

a = 256;
b = 256;
I = zeros(a,b);
P = zeros(a,b);
P(20:50,30:80) = 255;
L1(:,1:b-1) = P(:,1:b-1)-P(:,2:b);
L2(1:a-1,:) = P(1:a-1,:)-P(2:a,:);


lambda = 0.1;
iterNum = 30;

figure(1);
imshow(I,[],'border','tight','InitialMagnification','fit');
saveas(figure(1),'I2','eps');
figure(2)
imshow(P,[],'border','tight','InitialMagnification','fit');
saveas(figure(2),'p2','eps');
%title('pattern');
figure(3);
imshow(L1,[],'border','tight','InitialMagnification','fit');
saveas(figure(3),'px2','eps');
%title('pattern-grad-x');
figure(4);
imshow(L2,[],'border','tight','InitialMagnification','fit');
saveas(figure(4),'py2','eps');
%title('pattern-grad-y');


del1 = zeros(a,b);
del2 = zeros(a,b);
del3 = zeros(a,b);

del4 = zeros(a,b);
del5 = zeros(a,b);
del6 = zeros(a,b);

for iter = 1:iterNum;
    del1(:,2:b-1) = I(:,2:b-1)-I(:,3:b);
    del2(:,2:b-1) = I(:,2:b-1)-I(:,1:b-2);
    del3(:,2:b-1) = L1(:,1:b-2)-L1(:,2:b-1);
    
    del4(2:a-1,:) = I(2:a-1,:)-I(3:a,:);
    del5(2:a-1,:) = I(2:a-1,:)-I(1:a-2,:);
    del6(2:a-1,:) = L2(1:a-2,:)-L2(2:a-1,:);
        
    I = I - lambda*(del1 +del2 +del3) - lambda*(del6+del4+del5);
end

I_grad_x = zeros(a,b);
I_grad_y = zeros(a,b);
I_grad_x(:,1:b-1) = I(:,1:b-1)-I(:,2:b);
I_grad_y(1:a-1,:) = I(1:a-1,:)-I(2:a,:);

figure(5)
imshow(I,[],'border','tight','InitialMagnification','fit');
saveas(figure(5),'Iout2','eps');
%title('I');
figure(6)
imshow(I_grad_x,[],'border','tight','InitialMagnification','fit');
saveas(figure(6),'Ioutx2','eps');
%title('I-grad-x');
figure(7)
imshow(I_grad_y,[],'border','tight','InitialMagnification','fit');
saveas(figure(7),'Iouty2','eps');
%title('I-grad-y');
