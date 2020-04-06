//====Clamp Speed
hsp = clamp(hsp,-hsp_max,hsp_max)
vsp = clamp(vsp,-vsp_max,vsp_max)


//====Fractional movement storage.
hsp_final = hsp + hsp_f;
hsp_f = hsp_final - floor(abs(hsp_final))*sign(hsp_final);
hsp_final -= hsp_f;
 
vsp_final = vsp + vsp_f;
vsp_f = vsp_final - floor(abs(vsp_final))*sign(vsp_final);
vsp_final -= vsp_f;
 

//====Collide and Move
if (place_meeting(x+hsp_final,y,par_wall))
{
    var inc = sign(hsp_final);
    while (!place_meeting(x+inc,y,par_wall)) x+= inc;
    hsp_final = 0;
    hsp = 0;
}
x+=hsp_final;
 
if (place_meeting(x,y+vsp_final,par_wall))
{
    var inc = sign(vsp_final);
    while (!place_meeting(x,y+inc,par_wall)) y+= inc;
    vsp_final = 0;
    vsp = 0;
}
y+=vsp_final;
