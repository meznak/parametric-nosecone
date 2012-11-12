$fn=60;

r1 = 0.67*25.4;
l1 = 0.75*25.4;

r2 = 0.965*25.4;
l2 = 0.8*25.4;

l3 = 0.5*25.4;
l4 = 4*25.4;

wall = 1;
pad = 0.1;

// aft
rotate([0,180,0])
translate([0,0,-(l1+l2+l3)])
union() {
	seg(r1,r1,l1);
	seg(r1-.1,r1-1,l1-.1);
	translate([0,0,l1]) {
		cylinder(r=r1, h=wall*1.5);
		seg(r1,r2,l2);
		seg(r2/2,r2,l2);
		translate([0,0,l2]) {
			seg(r2,r2,l3);
		}
	}
	// ring
	translate([0,0,l1+pad]) {
		rotate([0,90,0]) {
			difference () {
				rotate_extrude(convexity=5)
					translate([5,0,0])
						circle(r=2);
				translate([-30,-15,-5]) {
					cube([30,30,10]);
				}
			}
		}
	}
}

// fore
translate([0,2*r2+10,0]) {
	seg(r2-wall,r2-wall,l3);
	translate([0,0,l3-2*pad]) {
		difference() {
			cylinder(r=r2, h=1);
			translate([0,0,-pad])
				cylinder(r=r2-wall, h=1+2*pad);
		}
		translate([0,0,1-2*pad])
			seg(r2,1,l4);
	}
}

module seg(rad1,rad2,len) {
	difference() {
		cylinder(r1=rad1, r2=rad2, h=len);
		translate([0,0,-pad])
			cylinder(r1=rad1-wall, r2=rad2-wall, h=len+2*pad);
	}
}