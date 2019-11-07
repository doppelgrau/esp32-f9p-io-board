$fn=60;

// methoden
module holder(edge=[0,0,0]) {
    translate(edge){
        difference(){
            union() {
                cube([10,20,30]);
                translate([0,10,0]) cube([10,10,35]);
                translate([0,15,35]) rotate([0,90,0]) cylinder(h=10, d=10);
            };
            translate([0,15,35]) rotate([0,90,0]) cylinder(h=10, d=5);
            translate([0,4,10]) cube([10,4,3]); 
            translate([0,12,10]) cube([10,4,3]); 
        };
    };
};

module pcbHolder(center=[0,0,0],h=12,d=10, screw=2) {
    translate(center){
        difference() {
            union() {
                cube([d,d,h], center=true);
            };
            translate([0,0,1]) cylinder(h=h+1, r=screw/2);
        };
    };
};


// main
translate([0,0,-6]) difference() {
    cube([95,185,6]);
    // for clamp
    translate([35,0,2]) cube([25,40,5]);
    // for resistors
    translate([15,133,1]) cube([60,14,5]);
    translate([15,098,1]) cube([60,14,5]);
    translate([15,080,1]) cube([60,14,5]);
    translate([15,045,1]) cube([60,14,5]);
}
// stopper
translate([25,165,0]) cube([40,10,30]);
translate([0,20,0]) cube([4,20,30]);
translate([91,0,0]) cube([4,12,30]);

// holder
holder(edge=[5,165,0]);
holder(edge=[80,165,0]);
pcbHolder([12,153,5]);
pcbHolder([72,153,5]);
pcbHolder([12,11,5]);
pcbHolder([72,11,5]);