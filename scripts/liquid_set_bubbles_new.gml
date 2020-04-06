///liquid_set_bubbles(id, bubbles, speed, size, life)
/*
    Changes how many bubbles appear within the liquid and their properties
    
    ARGUMENTS
        id - real - id of liquid object
        bubbles - real - amount of bubbles
        speed - real - speed of the bubbles
        size - real - size of the bubbles
        life - real - life of the bubbles
*/
    
    //update variable
    argument0.liquidbubbles = argument1;
    argument0.liquidbubblespeed = argument2;
    argument0.liquidbubblesize = argument3;
    argument0.liquidbubblelife = argument4;
    
    //rebuild the bubbles
    liquid_buildbubbles(argument0)
