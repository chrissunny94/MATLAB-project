clear

files= dir('wav\*.wav');
 
 

g1=0


num_files = length(files)
    
 for l=1:num_files
        g1=g1+1
        cd wav
        song_name=files(l).name
        [song,fs]=wavread(song_name);
        cd ../
        len=size(song);
        s=(song(:,1)+song(:,2));
        song=s;


        [S,F,T]=spectrogram(song,1024,.75*1024,[],fs,'yaxis');
                
        [m,n]=size(S);
        g=abs(max(max(S)));


        k=1;
        s2=zeros(1:800,1:5);



        for i=1:n
            for j=1:m-1
                if ((abs(S(j,i)))>.70*g)
                    if((k>2) && (T(1,i)==s2(k-1,2)) && (((abs(S(j,i))>=s2(k-1,4))) ))
                        s2(k-1,4)=abs(S(j,i));
                        s2(k-1,1)=F(j,1);
                        s2(k-1,2)=T(1,i);
                        s2(k-1,6)=angle(S(j,i));
                        
                    elseif((k>2) && (T(1,i)==s2(k-1,2)) && (((abs(S(j,i))<s2(k-1,4))) ))
                    else
                        s2(k,1)=F(j,1);
                        
                        s2(k,2)=T(1,i);
                        s2(k,4)=abs(S(j,i));
                        s2(k,6)=angle(S(j,i));
                        if (k>1)
                          s2(k,5)=s2(k,2)-s2(k-1,2);
                        else
                          s2(k,5)=0;
                        end
                        k=k+1;
                     
                    end
                end
            end
       end

[pathstr, name, ext] = fileparts(song_name);
 %song_name=strcat('csv\',name,'.csv');
 cd csv
ccc=num2str(g/2);
sss=song_name;
song_name=strcat(name,'--',ccc,'.csv');
csvwrite(song_name,s2);
ccc=num2str(g)
%song_name=strcat('csv\',name,'--',ccc)
%csvwrite(song_name,g)
cd ../
cd wav
copyfile(sss,'done\')
delete (sss)

cd ../

    
 end
 
    

 