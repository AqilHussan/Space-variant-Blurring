function Blurred=SpaceVariant(Image,sigmaMap)
[row,col]=size(Image);                         %Find the row size and column size of image
Blurred = zeros(row , col);                    %Initializing the blurred image
%Iterating through each element in sigmamap 
for x = 1 : row
    for y = 1 : col
        Kernal=GaussianKernal(sigmaMap(x,y)); %Finding kernal for each sigma
        Kernal=Kernal*double(Image(x,y));     %Multiplying kernal with corresponding pixel intensity of image
        [KernalRow,KernalColmn] = size(Kernal); %Finding the kernal center
        KernalCnt = floor((KernalRow+1)/2);
        %Adding the scaled kernal to the blurred image.
        for i=0:KernalCnt-1
            for j=0:KernalCnt-1
                if(x+i<row && y+j<col)
                 Blurred(x+i,y+j)=Blurred(x+i,y+j)+Kernal(KernalCnt+i,KernalCnt+j);
                end
                 if(x+i<row && y-j-1>0 && KernalCnt-j-1>0)
                 Blurred(x+i,y-j-1)=Blurred(x+i,y-j-1)+Kernal(KernalCnt+i,KernalCnt-j-1);
                 end
                 if(x-i-1>0 && y+j<col && KernalCnt-i-1>0)
                 Blurred(x-i-1,y+j)=Blurred(x-i-1,y+j)+Kernal(KernalCnt-i-1,KernalCnt+j);
                 end
                 if(x-i-1>0 && y-j-1>0 && KernalCnt-i-1>0 && KernalCnt-j-1>0 )
                 Blurred(x-i-1,y-j-1)=Blurred(x-i-1,y-j-1)+Kernal(KernalCnt-i-1,KernalCnt-j-1);
                 end
            end
        end
    end 
end