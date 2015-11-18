%Clearing all the previous variables
clear

%PART OF THE CODE FOR GETTING THE SPECTROGRAM OF THE TEST SONG
%--------------------------------------------------------------------------
%Changing the directory to test folder
cd test
%Finding out all files with 
test=dir('*.wav');
%Reading the wav file and storing it in the variable song and its
%corresponding sampling frequency fs
[song,fs]=wavread(test(1).name);
[pathstr, NAME, ext] = fileparts(song_name);
%Summing the amplituded of both channels and finding the average 
s=(song(:,1)+song(:,2));
song=s/2;
%Spectrogram function
[S,F,T]=spectrogram(song,1024,.75*1024,[],fs,'yaxis');



%Going back to the original folder
cd ../




%__________________________________________________________________________

%PART OF THE CODE FOR GETTING THE FINGERPRINT OF THE TEST FILE
%-------------------------------------------------------------------------
%s2 is the temporary matrix where the finger print of the test song is
%saved


%Returning the Size of the Amplitude matrix
[rows,columns]=size(S);
%FInding the  amplitude in the whole Amplitude Matrix
S=abs(S);
for i=1:88:rows
   S=abs(S);
    for j=1:10
        
        [time,freq]=max(max(S,[],i:i+88));
        [time,freq]=find(S==max(max(S(:,i:i+88)))); %index maximum of the matrix A
        s2(k,1)=F(freq,1);
        s2(k,2)=T(1,time);
        S(time,freq)=-S(time,freq);
        k=k+1;
    end
end
writecsv()
        

















%Changing directory to the CSV folder
cd csv
%To get the list of all files with the extension .csv
files=dir('*.csv');
no_of_files = length(files);

for i=1:length(files)
    dbase_fingerprints_file=csvread(files(i).name);
    [rows, columns] = size(dbase_fingerprints_file);
end

    











