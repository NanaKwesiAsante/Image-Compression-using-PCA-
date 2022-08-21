%Hw7
clear all;
A=imread('lena.jpg');

%change to matrix
A=im2double(A);

%selecting the n we want when using loop
%n=[10 50 100 200];
tic
%singular value decomposition
[U,S,V]=svd(A);
S1=diag(S);

%when not using a loop
n=10;%10,50,100,200

%deleting the nonessential singular values
u=U(:,1:n);
s=S(1:n,1:n);
v=V(:,1:n);
AA=u*s*v';
toc
figure (5)
imshow(AA)
% 
% %ploting the single value
% figure (1)
% semilogy(S1);
% xlabel('X','FontSize',16)
% ylabel('Y','FontSize',16)
% 
% %finding the cumulative of single values
% Y=cumsum(S1);
% Y1=sum(S1);
% 
% %ploting the graph to determine what number is good
% figure (2)
% plot(Y/Y1);
% xlabel('X','FontSize',16)
% ylabel('Y','FontSize',16)

% %using a for loop
% for p=1:length(n)
%     
%     u=U(:,1:n(p));
%     s=S(1:n(p),1:n(p));
%     v=V(:,1:n(p)); 
%     AA=u*s*v';
%
%     figure(1)
%     subplot(2,2,p)
%     imshow(AA)
% end

