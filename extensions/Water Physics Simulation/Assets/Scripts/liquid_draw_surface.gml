///liquid_draw_surface(id)
/*
    Draws the liquid surface based on the jitter (larer jitter, larger surface)
    
    ARGUMENTS
        id - real - id of liquid object
*/


    //liquid's surface variables
    var xt, nx, ny, ny2;
    
    //set surface's blend mode
    draw_set_blend_mode(argument0.liquidsurfaceblend);
    
    //find start and end nodes for drawing on-screen nodes only
    var pos1, pos2;
    pos1 = clamp(floor((view_xview-argument0.x)/argument0.liquidnodewidth), 0, argument0.liquidnodes-1);
    pos2 = clamp(pos1+ceil((view_wview-(argument0.x-view_xview))/argument0.liquidnodewidth)+2, 0, argument0.liquidnodes-1);
    
    //ensure it is on-screen
    if !((pos1 >= (argument0.liquidnodes-1)) || (pos2 <= 0) || (argument0.y > (view_yview+view_hview)) || ((argument0.y+argument0.liquidheight) < view_yview))
    {
        //actually draw the surface
        draw_primitive_begin(pr_trianglestrip);
        
        for(i = pos1; i <= pos2; i += 1) 
        {
            //calculate where the points to draw at are
            nx = argument0.x+i*argument0.liquidnodewidth;
            ny = argument0.liquidarray[i, 1]+argument0.liquidarray[i, 3]+(argument0.liquidbobamount*dsin((i*argument0.liquidbobscale)-(current_time*argument0.liquidbobspeed)));
            ny2 = argument0.liquidarray[i, 1]-argument0.liquidarray[i, 3]+(argument0.liquidbobamount*dsin((i*argument0.liquidbobscale)-(current_time*argument0.liquidbobspeed)));
            
            //draw points
            draw_vertex_colour(nx, ny+argument0.liquidsurfaceyoffset, argument0.liquidsurfacecolourtop, argument0.liquidsurfacealphatop);
            draw_vertex_colour(nx, ny2+argument0.liquidsurfaceyoffset, argument0.liquidsurfacecolourbottom, argument0.liquidsurfacealphabottom);
        }
        
        draw_primitive_end();
    }
    
    //reset blend mode
    draw_set_blend_mode(bm_normal)
    
    
