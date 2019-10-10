// to allow easier adjustments the top of the pcb is laying on the plane created by x and y-axis.  H3, H4 on y. H3, H2 on x
// 0.1mm of pcb not in the lower part
// printed turned by 180° (but so the coordinated match with the lower part)
error = 0.15; // how much increase for error during print
$fn=200;

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
    // space above pcb (1mm/1.5 of the small sides solid)
    translate([0,1.5,-0.1]) cube([73+2*error,157.6+2*error,24.1]);
    // space for esp32 antenna
    translate([-7.9,67,-0.1]) cube([8,30,24.1]);
    // space above the side holder
    translate([-10,11,-0.1]) cube([8,54.5,24.1]);
    translate([-10,98.5,-0.1]) cube([8,62,24.1]);
    translate([2,163,-0.1]) cube([70,8,24.1]);
    translate([80,-3,-0.1]) cube([20,8,24.1]);
    translate([140-9.2-7,12,-0.1]) cube([8,170-1.2-2*12,24.1]);
    // space between the dust isolation
    translate([70 ,12, -0.1]) cube([80,102,10.1]);
    // holder for the dust isolation
    translate([104.5 ,12, 0]) cube([9.5,102,11]);
    // space behind the isolation to the pcb
    translate([70 ,12, -0.1]) cube([30,130,24.1]);
    // holes for screws
    translate([120,170-2*1.2-7, -3]) cylinder(h=100, r=3, center = true);
    translate([120,7, -3]) cylinder(h=100, r=3, center = true);
    translate([5.9, 7.5,0]) cylinder(h=100, r=3, center = true);
    translate([65.9,7.5,0]) cylinder(h=100, r=3, center = true);
    translate([5.9,149,0]) cylinder(h=100, r=3, center = true);
    translate([65.9,149,0]) cylinder(h=100, r=3, center = true);
    // openning rs232
    translate([14.9-error,-1.25,0]) cube([31.2+2*error,4,12.5+0.1+error]);
    //openning usb (front a bit wider than the rest
    translate([52.9-error,-1.25,0]) cube([7.6+2*error,4,2.6+0.1+error]); // main
    translate([52.7-error,-1.25,0]) cube([8+2*error,1.6,2.85+0.1+error]); // main

    // space for the switch
    translate([84,163,-0.4]) cube([17+2*error,7,1]);
};
screwHole(center=[120,170-2*1.2-7, 0.15], height=25.1);
screwHole(center=[120,7, 0.15], height=25.1);
screwHole(center=[5.9, 7.5,0.3], wall=1.2);
screwHole(center=[65.9,7.5,0.3], wall=1.2);
screwHole(center=[5.9,149.2,0.3], wall=2.4);
screwHole(center=[65.9,149.2,0.3], wall=2.4);
// a bit more support (thin walls)
translate([0, 6.5,0.3]) cube([3,2,24]);
translate([69.4, 6.5,0.3]) cube([4.5,2,24]);
translate([4.9, 1,0.3]) cube([2,3,24]);
translate([64.9, 1,0.3]) cube([2,3,24]);
translate([0, 148.2,0.3]) cube([3,2,24]);
translate([69.9, 148.2,0.3]) cube([4,2,24]);
