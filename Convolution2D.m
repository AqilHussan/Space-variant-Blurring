function convoluted = Convolution2D(Image, Kernal)
%Find image row and column
[ImageRow,ImageColmn] = size(Image);   
%Find kernal row and column
[KernalRow,KernalColmn] = size(Kernal);
%Flip the kernal
FlippedKernal = rot90(Kernal, 2);
%Finding the kernel center point
KernalCnt = floor((size(FlippedKernal)+1)/2);
%Finding the number of columns to the left of kernel center point for
%padding
Colmn2Left = KernalCnt(2) - 1;
%Finding the number of columns to the Right of kernel center point for
%padding
Colmn2Right = KernalColmn - KernalCnt(2);
%Finding the number of Rows above kernel center point for
%padding
Row2Top = KernalCnt(1) - 1;
%Finding the number of Rows below kernel center point for
%padding
Row2Bottom = KernalRow - KernalCnt(1);
%Defining the zero padded image
PaddedImg = zeros(ImageRow + Row2Top + Row2Bottom, ImageColmn + Colmn2Left + Colmn2Right);
%Zero padding the image
for x = 1 + Row2Top : ImageRow + Row2Top
    for y = 1 + Colmn2Left : ImageColmn + Colmn2Left
        PaddedImg(x,y) = Image(x - Row2Top, y - Colmn2Left);
    end
end
%Defining the output matrix
convoluted = zeros(ImageRow , ImageColmn);
%Applying convolution
for x = 1 : ImageRow
    for y = 1 : ImageColmn
        for i = 1 : KernalRow
            for j = 1 : KernalColmn
                q = x - 1;
                w = y -1;
                convoluted(x, y) = convoluted(x, y) + (PaddedImg(i + q, j + w) * FlippedKernal(i, j));
            end
        end
    end
end