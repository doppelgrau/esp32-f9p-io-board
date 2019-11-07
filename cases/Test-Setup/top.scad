$fn=60;

// methoden
module wireStrapHolder(center=[0,0,0], rotation=[0,90,0], inner=2.0, outer=5.5, width=2.75) {
    translate(center){
        rotate(rotation){
            difference(){
                translate([0,0,-width/2]) cylinder(h=width, r=outer, center = true);
                translate([0,0,-width/2]) cylinder(h=width, r=inner, center = true);
                translate([0,0,outer]) cube(2*outer, center=true);
            };
        };
    };
};

module pcbHolder(center=[0,0,0], rotation=[0,0,0], l=10) {
    translate(center){
        rotate(rotation){
            difference(){
                cube([l,5,4], center = true);
                translate([0,1.5,-1.8]) cube([l,2,0.6], center = true); // pcb
                translate([0,2.67,-1]) rotate([40,0,0]) cube([l,4,2], center=true);
            };
        };
    };
};

// main
difference() {
    cube([95,195,10]);
    // cut for the base layer
    translate([79,0,0]) cube([20,10,10]);
    translate([79,15,0]) cube([20,10.6,10]);
    translate([79,30.6,0]) cube([20,10,10]);
    translate([79,155,0]) cube([20,10,10]);
    translate([79,170,0]) cube([20,10.6,10]);
    translate([79,185.6,0]) cube([20,10,10]);
    // hole
    translate([85,165,5]) rotate([0,90,90]) cylinder(h=22, d=5);
    translate([85,10,5]) rotate([0,90,90]) cylinder(h=22, d=5);
    translate([86.5,10,0]) rotate([0,45,0]) cube([20,10,10]);

    // a bit cleanter look
    translate([90,0,0]) cube([10,35,10]);
    translate([90,160,0]) cube([10,35,10]);
    // 1.2mm for the PCB (extended to the left)
    translate([0,29,8.8]) cube([78,161,10]);
    //below pcb
    translate([0,34,6]) cube([75.5,136,10]);

    // edgeHolder 
    for (a =[45:10:150]) wireStrapHolder(center=[97.5,a,10], rotation=[90,0,0], inner=5, outer=7, width=5);
}

pcbHolder(center=[72,28.5,12], rotation=[0,0,0], l=6);
pcbHolder(center=[43,190.5,12], rotation=[0,0,180], l=70);
pcbHolder(center=[78.5,59.5,12], rotation=[0,0,90], l=3);
pcbHolder(center=[78.5,142,12], rotation=[0,0,90], l=4);

