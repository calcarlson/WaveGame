///liquid_create(x, y, w, h, nodewidth, tension, dampening, spread, passes, jitter, jitteramount, jitterspeed, sides, bobamount, bobscale, bobspeed)
/*
    Creates a functional liquid object with custom attributes.
    
    ARGUMENTS
        x, y - real - liquid's top left corner
        w, h - real - liquid's size
        nodewidth - real - amount of space between moveable points on the liquid surface (less space = higher detail)
        tension - real - higher numbers will make the liquid act slower
        dampening - real - higher numbers will yeild a thicker liquid
        spread - real - the 'size' of the dynamics, smaller numbers for smaller jitters
        jitter - boolean - whether the liquid will wobble at the surface
        jitteramount - real - amount in pixels jitters can bob from the surface
        jitterspeed - real - 1-180 lower numer yeilds a slower speed - use low numbers for realistic results
        sides - boolean - whether the sides move or not
        
    RETURNS
        id - real - id of liquid object
*/

    ///PHYSICAL ------------------------------
    
    //set liquid variables
    var lid;
    lid = instance_create(argument0, argument1, objLiquid);
    lid.liquidwidth = argument2;
    lid.liquidheight = argument3;
    lid.image_xscale = lid.liquidwidth/sprite_get_width(lid.sprite_index);
    lid.image_yscale = lid.liquidheight/sprite_get_height(lid.sprite_index);
    lid.liquidnodes = floor(lid.liquidwidth/argument4);
    lid.liquidnodewidth = lid.liquidwidth/(lid.liquidnodes-1);
    
    lid.liquidtension = argument5;
    lid.liquiddampening = argument6;
    lid.liquidspread = argument7;
    
    lid.liquidpasses = argument8;
    
    lid.liquidjitter = argument9;
    
    lid.liquidjitteramount = argument10;
    lid.liquidjitterspeed = clamp(argument11, 1, 180);
    lid.liquidjitterangle = 0;
    lid.liquidsides = argument12;
    
    lid.liquidbobamount = argument13;
    lid.liquidbobscale = argument14;
    lid.liquidbobspeed = argument15;
    
    //rebuild liquid array
    liquid_buildnodes(lid);
    
    //return liquid handle
    return lid;
