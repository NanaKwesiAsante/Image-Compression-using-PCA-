clear;
A=imread('dela.jpg');

%convert from 3D to 2D
A=rgb2gray(A);
%convert to double
A=im2double(A);
[m,n]=size(A); %Size of the matrix obtained from A.

Data_mean= mean(A);% Calculate the mean of the data to be used to from the covariance matrix

Data_meanNew=repmat(Data_mean,m,1);%column matrix with means = row

Adjusted_Data=A-Data_meanNew; % Data is adjusted substracting mean from the Original data before cov

C=cov(Adjusted_Data); % compute a symmetric covariance matrix 

[eig_vec,eig_val]=eig(C); %obtain eigenvector and eigenvalues

eigenvec_Trans=transpose(eig_vec); %transpose of eigenvector

%figure, imshow(D)
Adjusted_Data_Trans=transpose(Adjusted_Data); %transpose of Adjusted Matrix


%image compression
PCs=input('Number of PC columns needed ');
PCs=n-PCs;
Reduced_Vec=eig_vec;
for i=1:PCs
    Reduced_Vec(:,1)=[];
end

Compressed_Data=Reduced_Vec*Reduced_Vec'*Adjusted_Data_Trans;
Compressed_Data=Compressed_Data'+Data_meanNew;
figure(1)
imshow(Compressed_Data)

%imwrite(A,'new.jpg')
%error of between the original image and the compressed image
MSE=double(sum(sum((Compressed_Data-A).*(Compressed_Data-A))/(m*n)))

%plot of error and PC's
x=[1,10,50,100,1000,3000];
y=[0.0185, 0.0047,5.0194e-04, 1.0431e-04,1.7395e-06, 3.7019e-08];
plot(x,y,'.', 'MarkerSize',20')
hold on
plot(x,y,'k-')

% X = reshape(I,size(I,1)*size(I,2),3);
% coeff = pca(X);
% % coeff = pca(I);
% Itransformed = X*coeff;
% % Itransformed = I*coeff;
% Ipc1 = reshape(Itransformed(:,1),size(I,1),size(I,2));
% Ipc2 = reshape(Itransformed(:,2),size(I,1),size(I,2));
% Ipc3 = reshape(Itransformed(:,3),size(I,1),size(I,2));
% figure, imshow(Ipc1,[]);
% figure, imshow(Ipc2,[]);
% figure, imshow(Ipc3,[]);