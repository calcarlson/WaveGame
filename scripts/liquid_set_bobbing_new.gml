///liquid_set_bobbing(id, amount, scale, speed)
/*
    Changes the bobbing (large automatic waves) of the liquid
    
    ARGUMENTS
        id - real - id of liquid object
        amount - real - height radius of the bobs
        scale - real - width of the bobs (set to node width for default)
        speed - real - speed of the bobs in relation to gametime
*/
    
    //update variable
    argument0.liquidbobamount = argument1;
    argument0.liquidbobscale = argument2;
    argument0.liquidpbobspeed = argument3;
