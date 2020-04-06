///liquid_update(id)
/*
    Updates the liquid object (stop this executing if you want a pause)
    
    ARGUMENTS
        id - real - id of liquid object
*/

    //update through the jitter wobble
    argument0.liquidjitterangle += argument0.liquidjitterspeed;
    
    
    var columnx, leftDeltas, rightdelta;

    //update springs
    for(i = 0; i < argument0.liquidnodes; i+=1) 
    {
        columnx = argument0.liquidarray[i, 0]-argument0.liquidarray[i, 1];
        argument0.liquidarray[i, 2] += argument0.liquidtension*columnx-(argument0.liquidarray[i, 2]*argument0.liquiddampening);
        argument0.liquidarray[i, 1] += argument0.liquidarray[i, 2];
    }
    
    //spread out the jitters (transfer force to adjacent springs)
    for (i = 0; i < argument0.liquidpasses; i += 1) 
    {
        for (j = 0; j < argument0.liquidnodes; j += 1) 
        {
            if (j > 0) 
            {
                leftdelta[j] = argument0.liquidspread*(argument0.liquidarray[j, 1] - argument0.liquidarray[j-1, 1]);
                argument0.liquidarray[j-1, 2] += leftdelta[j];
            }
            
            if (j < argument0.liquidnodes-1) 
            {
                rightdelta[j] = argument0.liquidspread*(argument0.liquidarray[j, 1]-argument0.liquidarray[j+1, 1]);
                argument0.liquidarray[j+1, 2] += rightdelta[j];
            }
        }
        
        for (j = 0; j < argument0.liquidnodes; j += 1) 
        {
            if (j > 0) 
            {
                argument0.liquidarray[j-1, 1] += leftdelta[j];
            }
            
            if (j < argument0.liquidnodes-1) 
            {
                argument0.liquidarray[j+1, 1] += rightdelta[j];
            }
        }
        
        for (j = 0; j < argument0.liquidnodes; j += 1) 
        {
            argument0.liquidarray[j, 3] = (dsin(argument0.liquidjitterangle+argument0.liquidarray[j, 4])*argument0.liquidjitteramount)*is_even(j);
        }
    }

    //update bubbles
    if (argument0.liquidbubbles)
    {
        //loop through to manipulate each bubble
        for (i = 0; i < argument0.liquidbubbles; i += 1)
        {
            liquidbubblearray[i, 0] += lengthdir_x(liquidbubblearray[i, 4], liquidbubblearray[i, 3]);
            liquidbubblearray[i, 1] += lengthdir_y(liquidbubblearray[i, 4], liquidbubblearray[i, 3]);
            liquidbubblearray[i, 5] -= liquidbubblearray[i, 6];
            
            //reset bubble if done
            if (liquidbubblearray[i, 5] <= 0)
            {
                liquidbubblearray[i, 0] = random(liquidwidth);
                liquidbubblearray[i, 1] = random(liquidheight);
                liquidbubblearray[i, 2] = random(liquidbubblesize/2);
                liquidbubblearray[i, 3] = random(360);
                liquidbubblearray[i, 4] = random_range(liquidbubblespeed-0.025, liquidbubblespeed+0.025);
                liquidbubblearray[i, 5] = 1;
                liquidbubblearray[i, 6] = random_range(liquidbubblelife/2, liquidbubblelife);
                liquidbubblearray[i, 7] = irandom(1);
            }
        }
    }
    
