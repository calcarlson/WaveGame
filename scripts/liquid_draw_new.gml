///liquid_draw(id)
/*
    Draws the with all of it's enabled features
    
    ARGUMENTS
        id - real - id of liquid object
*/

    //main body
    if !(argument0.liquidtexture)
    {
        liquid_draw_default(argument0);
    }
    else
    {
        liquid_draw_texture(argument0);
    }
    
    //bubbles
    liquid_draw_bubbles(argument0);
    
    //surface
    if (argument0.liquidsurface)
    {
        if !(argument0.liquidsurfacetexture)
        {
            liquid_draw_surface(argument0);
        }
        else
        {
            liquid_draw_surface_texture(argument0);
        }
    }
