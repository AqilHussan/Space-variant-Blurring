%The Gaussian distribution is non-zero everywhere,which would require an infinitely large
%convolution kernel.But in practice according to Chebyshev’s inequality ,it is effectively zero
%more than about three standard deviations from the mean,and so we can truncate the kernel at
%this point.The rule of thumb for Gaussian filter design is to choose the filter radius to be about 3
%times the standard deviation .Kernel size would be ceil(6*SD+1).
function Kernel=GaussianKernal(SD)
kernalRadius=ceil(SD*3);            %Defining Kernel Radius
%%%The formula for gaussian is (1/(2*pi*sd^2))*exp(-(x^2+y^2)/(2*sd^2))
[x,y]=meshgrid(-kernalRadius:kernalRadius,-kernalRadius:kernalRadius);
ExpTerm = -(x.^2+y.^2)/(2*SD*SD);
Kernel= exp(ExpTerm)/(2*pi*SD*SD);
%Normalizing the kernal
Kernel= Kernel/sum(Kernel,'all');