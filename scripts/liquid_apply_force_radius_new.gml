///liquid_apply_force_radius(id, x, radius, force)
/*
    Applies a force, distributed between multiple nodes within a given radius at a specific x
    
    ARGUMENTS
        id - real - the liquid id
        x - real - the x in the room (not relative) to apply the effect
        radius - real - the size of the force
        force - real - the force in pixels to shift the node
*/
    
    for (i = 0; i < argument2; i += argument0.liquidnodewidth)
    {
        //find the nearest node to the x
        var node1, node2, sx;
        
        //get relative node x
        sx = clamp(((argument1+(i))-argument0.x)/argument0.liquidnodewidth, 0 , argument0.liquidnodes-1);
        
        //find surrounding nodes
        node1 = floor(sx);
        node2 = ceil(sx);
    
        //apply the shared force to the nodes
        argument0.liquidarray[node1, 2] = (argument3*(1-(i/argument2)))*(1-frac(sx));
        argument0.liquidarray[node2, 2] = (argument3*(1-(i/argument2)))*frac(sx);
        
        //if (i != 0)
        {
            //find the nearest node to the x
            var node1, node2, sx;
            
            //get relative node x
            sx = clamp(((argument1-(i))-argument0.x)/argument0.liquidnodewidth, 0 , argument0.liquidnodes-1);
            
            //find surrounding nodes
            node1 = floor(sx);
            node2 = ceil(sx);
        
            //apply the shared force to the nodes
            argument0.liquidarray[node1, 2] = (argument3*(1-(i/argument2)))*(1-frac(sx));
            argument0.liquidarray[node2, 2] = (argument3*(1-(i/argument2)))*frac(sx);        
        }
        
    }
