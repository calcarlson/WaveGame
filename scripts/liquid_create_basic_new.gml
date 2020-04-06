///liquid_create_basic(x, y, w, h, nodewidth)
/*
    Creates a functional liquid object with defaults in place.
    
    ARGUMENTS
        x, y - real - liquid's top left corner
        w, h - real - liquid's size
        nodewidth - real - amount of space between moveable points on the liquid surface (less space = higher detail)
        
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
    
    //rebuild liquid array
    liquid_buildnodes(lid);
    
    //return liquid handle
    return lid;
