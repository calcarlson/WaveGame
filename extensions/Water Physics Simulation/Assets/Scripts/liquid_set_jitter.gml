///liquid_set_jitter(id, jitteramount, jitterspeed)
/*
    Changes the automatic jitters settings of the liquid
    
    ARGUMENTS
        id - real - id of liquid object
        jitteramount - real - amount in pixels jitters can bob from the surface
        jitterspeed - real - 1-180 lower numer yeilds a slower speed - use low numbers for realistic results
*/
    
    //update variables
    argument0.liquidjitteramount = argument1;
    argument0.liquidjitterspeed = clamp(argument2, 1, 180);
