%Clearing all the previous variables
clear

%PART OF THE CODE FOR GETTING THE SPECTROGRAM OF THE TEST SONG
%--------------------------------------------------------------------------
%Changing the directory to test folder
cd wav
%Finding out all files with 
test=dir('*.wav');
%Going back to the original folder
cd ../





for l=1:length(test)
    cd wav
[pathstr, NAME, ext] = fileparts(test(l).name);
%Reading the wav file and storing it in the variable song and its


%corresponding sampling frequency fs
[song,fs]=wavread(test(l).name);



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
    MAX=max(max(temp))
    
     for j=1:3
         [x,y]=find(temp==max(max(temp)))
         s2(k,1)=F(x(1,1),1);
         s2(k,2)=T(1,i+y(1,1));
         temp(x,y)=-temp(x(1,1),y(1,1));
         k=k+1;
     end
 end
 cd ../
cd csv 
NAMECSV=strcat(NAME,'.csv');
csvwrite(NAMECSV,s2);
cd ../

cd wav
copyfile(test(l).name,'done\');
delete (test(l).name);


cd ../

end





clear



























