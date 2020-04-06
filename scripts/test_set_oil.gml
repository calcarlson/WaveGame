///test_set_oil(id);
/*
    Sets the liquid to look and act like oil
    
    ARGUMENTS
        id - real - id of liquid object
        
*/

    //physical
    liquid_set_tension(argument0, 0.002);
    liquid_set_dampening(argument0, 0.0935);
    liquid_set_spread(argument0, 0.1705)
    liquid_set_bobbing(argument0, 0, liquid_get_node_width(argument0)/4, 0.25)
    liquid_set_jitter(argument0, 0, 2);
    
    //main visuals
    liquid_set_colour(argument0, c_black, c_black)
    liquid_set_alpha(argument0, 1, 0.9);
    liquid_set_blend(argument0, bm_normal);
    liquid_set_texture(argument0, -1);
    liquid_set_bubbles(argument0, 16, 0.0025, 6, 1/400);
    
    //surface visuals
    liquid_set_surface(argument0, -1);

