// based on the MakerBot Build Plate Library at http://www.thingiverse.com/thing:44094

cube([20,20,20]);
tiko_build_plate();

module tiko_plate(height=1)
{
  hull()
  {
    for(i=[0:2])
      rotate([0,0,i*120])
        translate([0,61,0])
          cylinder(h=height,r=31.8,center=true);
  }
}

module tiko_build_plate()
{
  //#circle(62.5);
  %union()
  {
    translate([0, 0,-.52])
      tiko_plate();

    difference()
    {
      translate([0,0,-.5])
      {
        for(i = [-8:8])
        {
          translate([i*10,0,0])
            cube([.5,190,1.01],center = true);
        }
        for(i = [-6:9])
        {
          translate([0,i*10,0])
            cube([169,.5,1.01],center = true);
        }
      }
      difference()
      {
        cube([170,191,3],center=true);
        tiko_plate(4);
      }
    }
  }
}
