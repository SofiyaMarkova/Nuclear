%Sofiya Markova 

%goal of code: 

%simulate a nuclear reactor

function Nuclear = Nuclear(numNeutrons, wallThick)

%number neutrons escape to outside environment
neutronsEscape = 0;

%number neutrons absorbed into wall
neutronsAbsorbed = 0;

%number of neutrons go back to reactor
neutronsBack = 0;

%total number of neutrons
totalNeutrons = 0;

%loop wile total number of neutrons is less than set value of neutrons
while totalNeutrons < numNeutrons
    
    %start total neutrons at 0 so increment in loop
    totalNeutrons = totalNeutrons + 1;
    
    %distance neutron traveled into wall
    distIntoWall = 1;
    
    %number of collisions experienced by neutron
    numCollisions = 0;
    
%loop while number collisions happening is less than 10, they are not 
%directly into the wall so greater than 0 distance into wall and distance
%into wall is not as much as a wall is thick
 while numCollisions < 10 && distIntoWall >= 0 && distIntoWall <= wallThick
     
     %increment in loop by 1
     numCollisions = numCollisions + 1;
     
     %check if number of collisions is equal to 10 as set value
     if (numCollisions == 10)
         %if number of collisions is 10 then on more neutron absorbed
         neutronsAbsorbed = neutronsAbsorbed + 1;
     else
         %generate random number
         z = rand;
         
         %set formula to calculate neutron distance into the wall
         distIntoWall = distIntoWall + cos(2*pi*z);
       
     end
     
     %check if distance into wall is greater than wall thickness
     if distIntoWall > wallThick  
         
         %then another neutron escapes
         neutronsEscape = neutronsEscape+1;
     end
     
     %check if distance into wall is less than 0
     if distIntoWall < 0
         
         %neutron goes back if distance into wall less than 0
         neutronsBack = neutronsBack+1;
     end
         
 end
 
 
end

%calculate percentage for each value
percentNeutronsEscape = (neutronsEscape/totalNeutrons) * 100;
percentNeutronsAbsorbed = (neutronsAbsorbed/totalNeutrons) * 100;
percentNeutronsBack = (neutronsBack/totalNeutrons) * 100;

%display values needed
display (percentNeutronsEscape);
display (percentNeutronsAbsorbed);
display (percentNeutronsBack);



