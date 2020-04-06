///liquid_buildnodes(id)
/*
    Ran by scripts when creating or refreshing a liquid object
    
    ARGUMENTS
        id - real - id of liquid object
*/
    
    //become the liquid object
    with (argument0)
    {
        //create each node
        for (i = 0; i <= liquidnodes; i += 1)
        {
            liquidarray[i, 0] = y;
            liquidarray[i, 1] = y;
            liquidarray[i, 2] = 0;
            liquidarray[i, 3] = 0;
            liquidarray[i, 4] = random(360);
        }
        /* 
        liquidarray[?,0] - the destination of the node
        liquidarray[?,1] - the y of the node
        liquidarray[?,2] - the speed of the node
        liquidarray[?,3] - the jitter offset of the node
        liquidarray[?,4] - the random jitter offset of the node
        */
    }
