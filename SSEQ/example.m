path = 'C:/Users/wyy/Desktop/SSEQ_release/SSEQ/real/';

for i in 
%1. Load the image, for example
    image        = imread( 'C:/Users/wyy/Desktop/SSEQ_release/SSEQ/real/2.jpg');
    
%2. Call this function to calculate the quality score:
    qualityscore = SSEQ(image)