%MATCH CODE DEVOLOPED BY GANESH S

%Clearing all the previous variables
clear
MAX=0

%PART OF THE CODE FOR GETTING THE SPECTROGRAM OF THE TEST SONG
%--------------------------------------------------------------------------
%Changing the directory to test folder
cd test
%Finding out all files with 
test=dir('*.wav');
%Going back to the original folder
cd ../

cd test
[pathstr, NAME, ext] = fileparts(test(1).name);
%Reading the wav file and storing it in the variable song and its
%corresponding sampling frequency fs
[song,fs]=wavread(test(1).name);
%Summing the amplituded of both channels and finding the average 
s=song(:,1)+song(:,2);
song=s/2;
%Spectrogram function
[S,F,T]=spectrogram(song(:,1),1024,.75*1024,[],fs,'yaxis');
%__________________________________________________________________________

%PART OF THE CODE FOR GETTING THE FINGERPRINT OF THE TEST FILE
%-------------------------------------------------------------------------
%s2 is the temporary matrix where the finger print of the test song is
%saved
%Returning the Size of the Amplitude matrix
[rows,columns]=size(S);
%FInding the  amplitude in the whole Amplitude Matrix
S=abs(S);
k=1
 for i=1:88:columns
    i;
    mm=i+88;
    if(mm>columns-1)
        break;
    end
    
    temp=S(:,i:mm);
    MAX=max(max(temp));
    
     for j=1:3
         [x,y]=find(temp==max(max(temp)))
         s2(k,1)=F(x(1,1),1);
         s2(k,2)=T(1,i+y(1,1));
         temp(x,y)=-temp(x(1,1),y(1,1));
         k=k+1;
     end
 end
 cd ../
test=s2;


csvwrite('test.csv',s2);
s2=csvread('test.csv');
fff=1
cd csv


csvlist=dir('*.csv');
bestMatchIndex=0;
len=length(csvlist);
[m,n]=size(s2);
MAX=0

for bb=1:len
    s4=csvread(csvlist(bb).name);
    
    [rows,columns]=size(s4);
    bin=zeros(1,600000);
    
    
    for i=1:rows
        for j=1:m
            if (s4(i,1)==s2(j,1))
                timeDel=s4(i,2)-s2(j,2);
                if(timeDel>0)
                    bin(1,ceil(timeDel*100))=bin(1,ceil(timeDel*100))+1;
                end
            end
        end
    end
    
    bin_sum=sum(bin);
    bin_max=max(bin);
    
    if((bin_max)>MAX)
        MAX=bin_max
        csvlist(bb).name
        
        plot(bin);
        
        bestMatchIndex=bb;
    end  
    
                
               
end

csvlist(bestMatchIndex).name
msgbox(csvlist(bestMatchIndex).name)
MAX*100
cd ../




