///test_set_lava(id);
/*
    Sets the liquid to look and act like lava
    
    ARGUMENTS
        id - real - id of liquid object
        
*/

    //physical
    liquid_set_tension(argument0, 0.0200);
    liquid_set_dampening(argument0, 0.0935);
    liquid_set_spread(argument0, 0.1705);
    liquid_set_bobbing(argument0, 1, liquid_get_node_width(argument0)/2, 0.25)
    liquid_set_jitter(argument0, 2, 4);
    
    //main visuals
    liquid_set_colour(argument0, c_white, c_white)
    liquid_set_alpha(argument0, 1, 1);
    liquid_set_blend(argument0, bm_normal);
    liquid_set_texture(argument0, sprTestLavaTexture);
    liquid_set_bubbles(argument0, 0, 0.05, 6, 1/400);
    
    //surface visuals
    liquid_set_surface(argument0, 1);
    liquid_set_surface_colour(argument0, c_yellow, c_white)
    liquid_set_surface_alpha(argument0, glowsin, 1-glowsin);
    liquid_set_surface_blend(argument0, bm_add);
    liquid_set_surface_offset(argument0, -32);
    liquid_set_surface_texture(argument0, sprTestLavaSurface, 64);
