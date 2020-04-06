///liquid_calculate_object_buoyancy(liquidy, liquiddensity, object y, object ysp, object density, obj height, obj grav, damping)
/*
    Calculates acceleration to be added to yspeed in order to coutneract the gravity force.
    
    ARGUMENTS
        y - real - liquid's y position
        density - real - liquid's density (simply set to 1)
        object y - real - y position of the object that is submerged
        object ysp - real - current y speed of the object
        object density - real - object's density. If the liquid's is 1, 0.5 will make the object float and 2 will make the object sink
        obj height - real - the height of the object so the displacement can be worked out
        obj grav - real - the downward force on the object to be counteracted
        damping - real - how much the object should react
        
    RETURNS
        acceleration - real - a value to be added to the ysp
*/   

    var liquid_ypos, liquid_density, object_ypos, object_ysp, object_density, object_height, object_gravity, damping, displacement, buoyancy;
    liquid_ypos = argument0;
    liquid_density = argument1;
    object_ypos = argument2;
    object_ysp = argument3;
    object_density = argument4;
    object_height = argument5;
    object_gravity = argument6;
    damping = argument7;
    
    displacement = clamp((object_ypos+(object_height*0.5)-liquid_ypos)/object_height, 0, 1);
    buoyancy = displacement*liquid_density*object_gravity;
    return(-buoyancy / object_density - object_ysp * damping);
