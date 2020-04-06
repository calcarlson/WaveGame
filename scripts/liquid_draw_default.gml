///liquid_draw_default(id)
/*
    Draws the liquid with custom colours, alphas and blend mode
    
    ARGUMENTS
        id - real - id of liquid object
*/

    var nx, ny, by, xt;
    
    //calculate the bottom y of the liquid
    by = argument0.y+argument0.liquidheight;
    
    //set liquid's blend mode
    draw_set_blend_mode(argument0.liquidblend);

    //actually draw the liquid
    draw_primitive_begin(pr_trianglestrip);
    for (i = 0; i < argument0.liquidnodes; i += 1) 
    {
        //calculate where the points to draw at are
        nx = argument0.x+i*argument0.liquidnodewidth;
        ny = argument0.liquidarray[i, 1]+argument0.liquidarray[i, 3]
        +(argument0.liquidbobamount*dsin((i*argument0.liquidbobscale)
        -(current_time*argument0.liquidbobspeed)));
    
        //draw points
        draw_vertex_color(nx, ny, argument0.liquidcolourtop, argument0.liquidalphatop);
        draw_vertex_color(nx, by, argument0.liquidcolourbottom, argument0.liquidalphabottom);
    }
    draw_primitive_end();
     
    //reset blend mode
    draw_set_blend_mode(bm_normal);
