// to allow easier adjustments pcb is laying on the plane created by x and y-axis.  H3, H4 on y. H3, H2 on x
// 1.5mm of the pcb embedded in this part
error = 0.15; // how much increase for error during print
$fn=100;

// helper modules
module pcbHolder(center=[0,0,0],height=10.8,baseDia=16,topDia=8, screw=2) {
    translate(center){
        difference() {
            rotate([0,0,45]) cylinder(height,baseDia/2,topDia/2,$fn=4);
            translate([0,0,1]) cylinder(h=height+1, r=screw/2);
        };
    };
};

module wireStrapHolder(center=[0,0,0], rotation=[0,90,0], inner=2.0, outer=5.5, width=2.75+2*error) {
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

module edgeHolder(center=[0,0,0],angle=0) {
   translate(center){
       rotate([0,0,angle]) {
        cube([3,13,14], center=true);
        translate([0,2,-1.5]) cube([30,3,2.5]);
        translate([0,-5,-1.5]) cube([30,3,2.5]);
       };
    };
};

module switchSpace() {
    translate([0,-45,0]) cube([27+2*error,45,12]); // long inner part
    translate([5,-7,-0.3]) cube([17+2*error,7,1]); // dent for the small triangles at the side
    translate([-4,-32.4,0]) cube([35,30,12]); // wider space inside
    translate([0,-65,35]) rotate([-60,0,0]) cube([27+2*error,40,20]); // angle at the end
    translate([-2,-90,5.5]) cube([15,60,12]); // a bit space for cable management (under J3
}

module pcbClamp(center=[0,0,0], rotation=[0,0,0], l=10) {
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

// main design
difference(){
    // base form
    translate([-9.2,-1.2,-12]){
      cube([140,170,13.5]);
    };
    // pcb itselfwireStrapHolder
    cube([73+2*error,160.1+2*error,1.6]);
    //space below the pcb
    translate([1,2,-10.8]){
      cube([71,156,11]);
    };
    // space for the switch
    translate([79,170,-10.5]) switchSpace();

    // a bit lower for isolation foam (1mm)
    translate([104.5 ,12, 0.5]) cube([9.5,102,3.01]);
    // holder for wire straps (cables)
    for (a =[25:15:110]) wireStrapHolder([103, a, 1.5]);
    for (a =[17.5:15:110]) wireStrapHolder([98, a, 1.5]);
    // corner rows
    for (a =[25:15:110]) wireStrapHolder([123, a, 1.5]);
    for (a =[17.5:15:110]) wireStrapHolder([118, a, 1.5]);

    // corner (whole box)
     wireStrapHolder(center=[140-9.2,-1.2,-4.35], rotation=[0,0,0], inner=7.5, outer=10, width=5);
     wireStrapHolder(center=[140-9.2,170-1.2,-4.35], rotation=[0,0,0], inner=7.5, outer=10, width=5);
     wireStrapHolder(center=[-9.2,-1.2,-4.35], rotation=[0,0,0], inner=7.5, outer=10, width=5);
     wireStrapHolder(center=[-9.2,170-1.2,-4.35], rotation=[0,0,0], inner=7.5, outer=10, width=5);
    // edgeHolder 
    for (a =[22.5:25:155]) edgeHolder([127, a, -5.25]);
    for (a =[22.5 - 9.2:25:70]) edgeHolder([a, 165, -5.25], 90);
    for (a =[22.5 - 9.2+75:25:110]) edgeHolder([a, 2, -5.25], 270);
    // keep the antenna out
    for (a =[22.5:25:65]) edgeHolder([-5, a, -5.25],180);
    for (a =[122.5:25:155]) edgeHolder([-5, a, -5.25],180);
    // holes for the screws for the lid 
    translate([120,170-2*1.2-7, -3]) cylinder(h=10,r=2/2,center=true);
    translate([120,7, -3]) cylinder(h=10,r=2/2,center=true);    
    
    // outside edges 45° about 0.5mm
    translate([-9.2,-1.2,10]) rotate([0,0,45]) cube([1,1,50], center=true);
    translate([-9.2,-1.2+170,10]) rotate([0,0,45]) cube([1,1,50], center=true);
    translate([-9.2+140,-1.2,10]) rotate([0,0,45]) cube([1,1,50], center=true);
    translate([-9.2+140,-1.2+170,10]) rotate([0,0,45]) cube([1,1,50], center=true);
    translate([65,-1.2,-12]) rotate([-45,0,0]) cube([150,1,1], center=true);
    translate([65,-1.2+170,-12]) rotate([-45,0,0]) cube([150,1,1], center=true);
    translate([-9.2,85,-12]) rotate([0,45,0]) cube([1,180,1], center=true);
    translate([-9.2+140,85,-12]) rotate([0,45,0]) cube([1,180,1], center=true);
};
// pcbHolder, tanslate all on the bottom layer
translate([0,0,-10.8]) {
    pcbHolder(center=[5.9, 7.5,0], topDia=9);
    pcbHolder(center=[65.9,7.5,0], topDia=9);
    pcbHolder(center=[5.9,149.2,0]);
    pcbHolder(center=[65.9,149.2,0]);
};

// help during mount
pcbClamp(center=[73.8,29.5,3.5], rotation=[0,0,90], l=3);
pcbClamp(center=[73.8,112,3.5], rotation=[0,0,90], l=4);
