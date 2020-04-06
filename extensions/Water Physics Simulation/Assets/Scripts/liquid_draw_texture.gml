///liquid_draw_texture(id)
/*
    Draws the liquid with a texture and colour blend, alpha and alpha blend
    
    ARGUMENTS
        id - real - id of liquid object
*/

    //texture_set_repeat(1) (for tiled textures which doesnt work atm)

    var nx, ny, by, xt;
    
    //calculate the bottom y of the liquid
    by = argument0.y+argument0.liquidheight;
    
    //set liquid's blend mode
    draw_set_blend_mode(argument0.liquidblend);
    
    //actually draw the liquid
    draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(argument0.liquidtexture, 0));
    
    for(i = 0; i < argument0.liquidnodes; i += 1) 
    {
        //calculate where the points to draw at are
        nx = argument0.x+i*argument0.liquidnodewidth;
        ny = argument0.liquidarray[i, 1]+argument0.liquidarray[i, 3]
        +(argument0.liquidbobamount*dsin((i*argument0.liquidbobscale)
        -(current_time*argument0.liquidbobspeed)));
        
        //draw points
        xt = (i)/argument0.liquidnodes;
        draw_vertex_texture_colour(nx, ny, xt, 0, argument0.liquidcolourtop, argument0.liquidalphatop) //argument3, argument5);
        draw_vertex_texture_colour(nx, by, xt, 1, argument0.liquidcolourbottom, argument0.liquidalphabottom) //argument4, argument6);
    }
    draw_primitive_end();
    
    //reset blend mode
    draw_set_blend_mode(bm_normal);
