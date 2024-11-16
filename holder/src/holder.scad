$fn = 64;

wall_thickness = 1.5;

// core
core_h = 25;
core_id = 22;
core_od = core_id + wall_thickness * 2;
core_slot_w = 11.5;

difference() {
  cylinder(core_h, d = core_od);
  translate([0, 0, -wall_thickness]) {
    cylinder(core_h, d = core_id);
  }
  translate([0, 0, -1]) {
    rotate([0, 0, 0]) {
      hull() {
        cylinder(core_h + 2, d = core_slot_w);
        translate([0, -core_slot_w / 2, 0]) {
          cube([core_od / 2, core_slot_w, core_h + 2]);
        }
      }
    }
  }

  translate([0, -(core_id / 2 + pen_od / 2), core_h - pen_h ]) { 
    magnet();
  }
}

// sprayholder
spray_h = 70;
spray_id = 35;
spray_od = spray_id + wall_thickness * 2;

translate([0, core_id / 2 + spray_od / 2, core_h - spray_h ]) { 
  difference() {
    cylinder(spray_h, d = spray_od);
    translate([0, 0, wall_thickness]) {
      cylinder(spray_h, d = spray_id);
    }
    translate([0, spray_od / 2, spray_h / 2]) {
      rotate([0, -90, 90]) {
        hull() {
          cylinder(spray_od / 2, d = core_slot_w);
          translate([0, -core_slot_w / 2, 0]) {
            cube([spray_h, core_slot_w, spray_od / 2]);
          }
        }
      }
    }
  }
}

// Magnet
module magnet() {
  translate([0, pen_id / 2 + magnet_thickness, pen_h / 2]) {
    rotate([90, 0, 0]) {
      cylinder(magnet_thickness * 3, d = magnet_d);
    }
  }
}

// Penholder
magnet_d = 10.1;
magnet_thickness = 2.6;
pen_h = core_h;
pen_id = 10;
pen_od = pen_id + magnet_thickness * 2;

translate([0, -(core_id / 2 + pen_od / 2), core_h - pen_h ]) { 
  difference() {
    cylinder(pen_h, d = pen_od);
    translate([0, 0, -1]) {
      cylinder(pen_h + 2, d = pen_id);
    }
    translate([-pen_od / 2 - 1, -pen_od - 2, -1]) {
      cube([pen_od + 2, pen_od + 2, pen_h + 2]);
    }
    magnet();
  }
}

