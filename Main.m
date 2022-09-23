close all;
Globe_Image = imread("Globe.png");             %%Image Read
figure('Name','Orginal Globe Image');          %%Display input image
imshow(Globe_Image); 
[row,col]=size(Globe_Image);                   %%Finding Row size and column size of image
%%Solving equations to find A and B
syms u v
eqns = [v*exp(-1*((((row/2)-(row/2)).^2)+(((row/2)-(row/2)).^2))/u)==2, v*exp(-1*(((0-(row/2)).^2)+((0-(row/2)).^2))/u)==.01];
vars = [v u];
[A, B] = solve(eqns,vars);
%%%Creating the sigma map.
[y,x]=meshgrid(0:col-1,0:row-1);
ExpTerm = ((((x-(row/2)).^2)+((y-(row/2)).^2))/3588); 
SigmaMap_Globe= (exp(-ExpTerm))*2;
SpaceVariantBlurred_Globe=SpaceVariant(Globe_Image,SigmaMap_Globe); %SpaceVariantBlurring
figure('Name','SpaceVariantBlurred:Globe');    %%Display image
imshow(uint8(SpaceVariantBlurred_Globe)); 
Nautilus_Image = imread("Nautilus.png");             %%Image Read
figure('Name','Orginal Nautilus Image');
imshow(Nautilus_Image); 
SigmaMap_Nautilus=ones(size(Nautilus_Image));          %%Defining sigma map
SpaceVariantBlurred_Nautilus=SpaceVariant(Nautilus_Image,SigmaMap_Nautilus);
figure('Name','SpaceVariantBlurred:Nautilus');
imshow(uint8(SpaceVariantBlurred_Nautilus));
SD=1;                                     %%Initializing Standard Deviation
gaussian=GaussianKernal(SD);                %%Find Gaussian kernal
SpaceInVariantBlurred_Nautilus=Convolution2D(Nautilus_Image,gaussian);       %%Convolving
figure('Name','SpaceInVariantBlurred:Nautilus');
imshow(uint8(SpaceInVariantBlurred_Nautilus));
figure('Name','Difference Image:Nautilus ');
%%Finding the difference
Subtracted=uint8(SpaceInVariantBlurred_Nautilus)-uint8(SpaceVariantBlurred_Nautilus);
imshow(Subtracted);





 