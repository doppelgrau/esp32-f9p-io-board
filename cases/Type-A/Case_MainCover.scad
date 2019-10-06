// to allow easier adjustments the top of the pcb is laying on the plane created by x and y-axis.  H3, H4 on y. H3, H2 on x
// 0.1mm of pcb not in the lower part
// printed turned by 180° (but so the coordinated match with the lower part)
error = 0.15; // how much increase for error during print
$fn=100;

// helper modules
module screwHole(center=[0,0,0],height=24.95,inner=4.8,wall=1.6, hole=2.2, slope=1.8) {
    translate(center) {
        difference() {
            translate([0,0,height/2]) cylinder(h=height, r=inner/2+2*wall/2+0.01, center = true);
            translate([0,0,height/2]) cylinder(h=height, r=hole/2, center = true);
            translate([0,0,(height - wall - slope)/2+wall+slope]) cylinder(h=height - wall - slope, r=inner/2, center = true);
            translate([0,0,slope/2 + wall]) cylinder(h=slope, r1=hole/2, r2=inner/2, center = true);
        };
    };
};

// main design
difference(){
    // base form
    translate([-9.2,-1.2,0]) cube([140,170,25.25]);
    // 0.15mm for the pcb
    translate([0,0,-0.1]) cube([73+2*error,160.1+2*error,0.25]);
    // space above pcb (1mm of the small sides solid)
    translate([0,1,-0.1]) cube([73+2*error,158.1+2*error,24.1]);
    // space for esp32 antenna
    translate([-7.9,62,-0.1]) cube([8,30,24.1]);
    // space above the holder
    translate([-10,11,-0.1]) cube([8,49,24.1]);
    translate([-10,94,-0.1]) cube([8,62,24.1]);
    translate([2,164,-0.1]) cube([70,8,24.1]);
    translate([85,-3,-0.1]) cube([15,8,24.1]);
    translate([140-9.2-7,12,-0.1]) cube([8,170-1.2-2*12,24.1]);
    // space between the dust isolation
    translate([70 ,12, -0.1]) cube([80,102,10.1]);
    // holder for the dust isolation
    translate([105 ,12, 0]) cube([9.5,102,11]);
    // space behind the isolation to the pcb
    translate([70 ,12, -0.1]) cube([30,130,24.1]);
    // holes for screws
    translate([120,170-2*1.2-7, -3]) cylinder(h=100, r=4, center = true);
    translate([120,7, -3]) cylinder(h=100, r=4, center = true);
    translate([5.6, 7.3,0]) cylinder(h=100, r=4, center = true);
    translate([65.7,7.5,0]) cylinder(h=100, r=4, center = true);
    translate([5.7,149,0]) cylinder(h=100, r=4, center = true);
    translate([65.7,149,0]) cylinder(h=100, r=4, center = true);
    // openning rs232
    
    //openning usb
};
screwHole(center=[120,170-2*1.2-7, 0.15], height=25.1);
screwHole(center=[120,7, 0.15], height=25.1);
screwHole(center=[5.6, 7.3,0.3], wall=2.4);
screwHole(center=[65.7,7.5,0.3], wall=2.4);
screwHole(center=[5.7,149,0.3], wall=2.4);
screwHole(center=[65.7,149,0.3], wall=2.4);