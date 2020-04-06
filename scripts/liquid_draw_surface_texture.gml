///liquid_draw_surface_texture(id)
/*
    Draws the liquid surface with an image centered on the liquid's surface
    
    ARGUMENTS
        id - real - id of liquid object
*/

    //liquid's surface variables
    var xt, nx, ny;
    
    //set surface's blend mode
    draw_set_blend_mode(argument0.liquidsurfaceblend);
    
    //actually draw the surface
    draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(argument0.liquidsurfacetexture, 0));

    for (i = 0; i < argument0.liquidnodes; i += 1) 
    {
        //calculate where the points to draw at are
        nx = argument0.x+i*argument0.liquidnodewidth;
        ny = argument0.liquidarray[i, 1]+argument0.liquidarray[i, 3]
        +(argument0.liquidbobamount*dsin((i*argument0.liquidbobscale)
        -(current_time*argument0.liquidbobspeed)));
        
        //draw points
        xt = (i-1)/argument0.liquidnodes;
        draw_vertex_texture_colour(nx, ny+argument0.liquidsurfaceyoffset, xt, 0, argument0.liquidsurfacecolourtop, argument0.liquidsurfacealphatop);
        draw_vertex_texture_colour(nx, (ny+argument0.liquidsurfaceyoffset)+argument0.liquidsurfacetextureheight, xt, 1, argument0.liquidsurfacecolourbottom, argument0.liquidsurfacealphabottom);
    }
    
    draw_primitive_end();

    //reset blend mode
    draw_set_blend_mode(bm_normal)
