


clear

cd test
song=dir('*.wav');
song2='VERY'
song1='GOOD MATCH'
song_final='HORI'

[song,fs]=wavread(song(1).name);
cd ..\



len=size(song)
s=(song(:,1)+song(:,2));
song=s;
[S,F,T]=spectrogram(song,1024,.75*1024,[],fs,'yaxis');

g=abs(max(max(S)))
[m,n]=size(S)




k=1



for i=1:n
    for j=1:m
        if ((abs(S(j,i)))>.50*g)
            if  ((k>2) && (T(1,i)==s2(k-1,2)) && (((abs(S(j,i))>=s2(k-1,4))) ))
                
                s2(k-1,4)=abs(S(j,i));
                
                s2(k-1,1)=F(j,1);
                s2(k-1,6)=angle(S(j,i));
            
            elseif  ((k>2) && (T(1,i)==s2(k-1,2)) && (((abs(S(j,i))<s2(k-1,4))) ))
            
            else
                
                s2(k,1)=F(j,1);
                
                s2(k,2)=T(1,i);
                
                s2(k,3)=1;
                
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
csvwrite('m.csv',s2);


files= dir('csv\*.csv');
max=0;

    num_files = length(files);
    max=0;
    cd('csv');
    
    

for l=1:num_files
        song_name=files(l).name
        
        s4=csvread(song_name);

        [m,n]=size(s4);
        count=0;


  for i=1:m
      for j=1:k-1
          freq= abs((s4(i,1)-s2(j,1))/s2(j,1)) ;
          deltime= abs((s4(i,5)-s2(j,5))/s2(j,5));
          
          if (freq<=0.75 && deltime<=0.0111  )
              count=count+1;
          end
      end
  end
 count 
 m
 
 count=count/(m)
 if(count>max)
     max=count;
     song1=song2;
     song2=song_final;
     song_final=song_name;
 end
 
     
 
 
 
end


 
 max
 cd('../')
 k
 if (max>k*k)
     max=100
 else
     max=count*100/k
 end
 
song1
song2
song_final

msgbox(song1)
msgbox(song2)
msgbox(song_final)

msgbox(sprintf('TOP MATCHs:',song_final))

 clear
  

        


  









