$fn=60;

// methoden
module holder(edge=[0,0,0]) {
    translate(edge){
        rotate([0,0,90]) difference(){
            union() {
                translate([0,10,0]) cube([10,10,5]);
                translate([0,15,5]) rotate([0,90,0]) cylinder(h=10, d=10);
            };
            translate([0,15,5]) rotate([0,90,0]) cylinder(h=10, d=5);
            translate([0,4,10]) cube([10,4,3]); 
            translate([0,12,10]) cube([10,4,3]); 
        };
    };
};


// main
difference() {
    cube([95,195,10]);
    // cut for the base layer
    translate([5,170,0]) cube([10.4,25,10]);
    translate([80,170,0]) cube([10.4,25,10]);
    translate([20,175,0]) cube([10.4,20,10]);
    translate([65,175,0]) cube([10.4,20,10]);
    // screw hole
    translate([0,180,5]) rotate([0,90,0]) cylinder(h=20, d=5);
    translate([75,180,5]) rotate([0,90,0]) cylinder(h=20, d=5);
        // dent for the front hinge of the top plate
    translate([85,0,14]) rotate([-90,0,0]) cylinder(h=5, d=13);

    //easier access to the screws
    translate([0,185,0]) cube([21,10,10]);
    translate([74,185,0]) cube([21,10,10]);
    // place as stopper
    translate([80,15,0]) cube([20,145,10]);
    // edge for holder on the top layer
    translate([30,0,0]) rotate([0,0,-45]) cube([30,28.3,10]);
    cube([50,20,10]);
}


// holder
holder(edge=[100,160,10]);
holder(edge=[100,5,10]);
