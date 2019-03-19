#!/bin/bash

PBRT_SCENE_PATH=../pbrt-v3-scenes
OUTPUT_PATH=./test/noosp/

PBRT_SCENES=" \
./crown/crown.pbrt \
./vw-van/vw-van.pbrt \
./ecosys/ecosys.pbrt \
./cloud/f15-4a.pbrt \
./cloud/cloud.pbrt \
./cloud/f15-4c.pbrt \
./cloud/f15-4b.pbrt \
./cloud/smoke.pbrt \
./bathroom/bathroom.pbrt \
./veach-mis/mis.pbrt \
./figures/f7-19b.pbrt \
./figures/f7-34c.pbrt \
./figures/f7-30c.pbrt \
./figures/f7-30a.pbrt \
./figures/f7-30b.pbrt \
./figures/f7-19c.pbrt \
./figures/f10-1ac.pbrt \
./figures/f10-1b.pbrt \
./figures/f8-22.pbrt \
./figures/f7-34b.pbrt \
./figures/f3-18.pbrt \
./figures/f11-15.pbrt \
./figures/f7-19a.pbrt \
./figures/f7-34a.pbrt \
./smoke-plume/plume-284.pbrt \
./smoke-plume/plume-084.pbrt \
./smoke-plume/plume-184.pbrt \
./killeroos/killeroo-moving.pbrt \
./killeroos/killeroo-simple.pbrt \
./killeroos/killeroo-gold.pbrt \
./head/f9-5.pbrt \
./head/head.pbrt \
./dragon/f8-21b.pbrt \
./dragon/f8-14a.pbrt \
./dragon/f9-4.pbrt \
./dragon/f8-4b.pbrt \
./dragon/f9-3.pbrt \
./dragon/f8-10.pbrt \
./dragon/f8-14b.pbrt \
./dragon/f11-13.pbrt \
./dragon/f8-24.pbrt \
./dragon/f11-14.pbrt \
./dragon/f15-13.pbrt \
./dragon/f8-21a.pbrt \
./dragon/f14-5.pbrt \
./dragon/f14-3.pbrt \
./dragon/f8-4a.pbrt \
./breakfast/breakfast.pbrt \
./breakfast/f16-8a.pbrt \
./breakfast/f16-8b.pbrt \
./white-room/whiteroom-night.pbrt \
./white-room/whiteroom-daytime.pbrt \
./hair/straight-hair.pbrt \
./hair/curly-hair.pbrt \
./hair/sphere-hairblock.pbrt \
./wip/glass/glass.pbrt \
./chopper-titan/chopper-titan.pbrt \
./measure-one/frame25.pbrt \
./measure-one/frame210.pbrt \
./measure-one/frame380.pbrt \
./measure-one/frame300.pbrt \
./measure-one/frame180.pbrt \
./measure-one/frame85.pbrt \
./measure-one/main.pbrt \
./measure-one/frame35.pbrt \
./measure-one/frame52.pbrt \
./measure-one/frame120.pbrt \
./transparent-machines/frame812.pbrt \
./transparent-machines/frame888.pbrt \
./transparent-machines/frame1266.pbrt \
./transparent-machines/frame675.pbrt \
./transparent-machines/frame542.pbrt \
./simple/dof-dragons.pbrt \
./simple/caustic-proj.pbrt \
./simple/bump-sphere.pbrt \
./simple/anim-bluespheres.pbrt \
./simple/spheres-differentials-texfilt.pbrt \
./simple/room-sppm.pbrt \
./simple/teapot-area-light.pbrt \
./simple/spotfog.pbrt \
./simple/teapot-metal.pbrt \
./simple/room-mlt.pbrt \
./simple/geometry/room-geom.pbrt \
./simple/geometry/room-teapot.pbrt \
./simple/buddha.pbrt \
./simple/room-path.pbrt \
./simple/miscquads.pbrt \
./sssdragon/dragon_10.pbrt \
./sssdragon/f15-7.pbrt \
./sssdragon/dragon_50.pbrt \
./sssdragon/dragon_250.pbrt \
./veach-bidir/bidir.pbrt \
./structuresynth/ballpile.pbrt \
./structuresynth/metal.pbrt \
./structuresynth/microcity.pbrt \
./structuresynth/geometry/ballpile.pbrt \
./structuresynth/geometry/city.pbrt \
./structuresynth/arcsphere.pbrt \
./bunny-fur/f3-15.pbrt \
./buddha-fractal/buddha-fractal.pbrt \
./bmw-m6/bmw-m6.pbrt \
./yeahright/yeahright.pbrt \
./ganesha/ganesha.pbrt \
./ganesha/f3-11.pbrt \
./landscape/view-1.pbrt \
./landscape/view-0.pbrt \
./landscape/view-4.pbrt \
./landscape/f4-1.pbrt \
./landscape/view-3.pbrt \
./landscape/f6-13.pbrt \
./landscape/view-2.pbrt \
./landscape/f6-14.pbrt \
./lte-orb/lte-orb-roughglass.pbrt \
./lte-orb/lte-orb-silver.pbrt \
./tt/tt.pbrt \
./dambreak/dambreak0.pbrt \
./dambreak/dambreak1.pbrt \
./sportscar/f7-37b.pbrt \
./sportscar/sportscar.pbrt \
./sportscar/f12-20b.pbrt \
./sportscar/f12-20a.pbrt \
./sportscar/f12-19b.pbrt \
./sportscar/f12-19a.pbrt \
./sportscar/f7-37a.pbrt \
./pbrt-book/book.pbrt \
./volume-caustic/caustic.pbrt \
./volume-caustic/f16-22b.pbrt \
./volume-caustic/f16-22a.pbrt \
./coffee-splash/f15-5.pbrt \
./coffee-splash/splash.pbrt \
./caustic-glass/f16-9a.pbrt \
./caustic-glass/f16-9b.pbrt \
./caustic-glass/f16-11a.pbrt \
./caustic-glass/glass.pbrt \
./caustic-glass/f16-11b.pbrt \
./caustic-glass/f16-9c.pbrt \
./sanmiguel/f10-8.pbrt \
./sanmiguel/f16-21a.pbrt \
./sanmiguel/f6-17.pbrt \
./sanmiguel/sanmiguel_cam25.pbrt \
./sanmiguel/f6-25.pbrt \
./sanmiguel/sanmiguel_cam3.pbrt \
./sanmiguel/f16-21b.pbrt \
./sanmiguel/sanmiguel_cam18.pbrt \
./sanmiguel/sanmiguel_cam15.pbrt \
./sanmiguel/sanmiguel_cam14.pbrt \
./sanmiguel/sanmiguel_cam1.pbrt \
./sanmiguel/f16-21c.pbrt \
./sanmiguel/sanmiguel_cam4.pbrt \
./sanmiguel/sanmiguel_cam20.pbrt \
./sanmiguel/sanmiguel.pbrt \
./villa/villa-photons.pbrt \
./villa/f16-20b.pbrt \
./villa/villa-lights-on.pbrt \
./villa/f16-20c.pbrt \
./villa/villa-daylight.pbrt \
./villa/f16-20a.pbrt \
./contemporary-bathroom/contemporary-bathroom.pbrt \
./barcelona-pavilion/pavilion-night.pbrt \
./barcelona-pavilion/pavilion-day.pbrt \
"


for scene in $PBRT_SCENES; do
    echo ====================== parsing $scene ======================
#    ./pbrtinfo --lint $PBRT_SCENE_PATH/$scene
    dir=`dirname $scene`
    mkdir -p $OUTPUT_PATH/$dir
    base=`basename $scene .pbrt`
    ./build/pbrt2pbf $PBRT_SCENE_PATH/$scene -o $OUTPUT_PATH/$dir/$base.pbf
    ./build/pbfInfo $OUTPUT_PATH/$dir/$base.pbf
done

