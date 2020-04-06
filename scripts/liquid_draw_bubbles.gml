///liquid_draw_bubbles(id)
/*
    Draws the bubbles within the specified liquid
    
    ARGUMENTS
        id - real - id of liquid object
*/

    //draw bubbles
    if (argument0.liquidbubbles)
    {
        for (j = 0; j < argument0.liquidbubbles; j += 1)
        {
            if ((argument0.liquidbubblearray[j, 0] > 0) && (argument0.liquidbubblearray[j, 0] < argument0.liquidwidth) && ((argument0.liquidbubblearray[j, 1]+argument0.y > (liquid_point_y_precise(argument0, argument0.x+argument0.liquidbubblearray[j, 0])))) && (argument0.liquidbubblearray[j, 1] < argument0.liquidheight))
            {
                draw_set_colour(c_white);
                draw_set_alpha(0.6*(1-argument0.liquidbubblearray[j, 5]));
                draw_circle(argument0.x+argument0.liquidbubblearray[j, 0], argument0.y+argument0.liquidbubblearray[j, 1], argument0.liquidbubblearray[j,2]*argument0.liquidbubblearray[j, 5], argument0.liquidbubblearray[j, 7])
            }
        }
    }
    draw_set_alpha(1);
