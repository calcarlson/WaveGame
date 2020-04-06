///liquid_buildbubbles(id)
/*
    Ran by scripts when the liquid's bubbles need refreshing
    
    ARGUMENTS
        id - real - id of liquid object
*/
    
    //become the liquid object
    with (argument0)
    {
        //create each bubble
        for (i = 0; i < liquidbubbles; i += 1)
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
        /* 
        liquidbubblearray[?,0] - the x of the node
        liquidbubblearray[?,1] - the y of the bubble
        liquidbubblearray[?,2] - the radius of the bubble
        liquidbubblearray[?,3] - the direction of the bubble
        liquidbubblearray[?,4] - the speed of the bubble
        liquidbubblearray[?,5] - the deterioration of the bubble
        liquidbubblearray[?,6] - the deterioration speed of the bubble
        liquidbubblearray[?,7] - whether the bubble is filled or not
        */
    }
