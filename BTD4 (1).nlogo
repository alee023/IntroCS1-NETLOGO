globals [ health end? balloonsCreated money lvlMoney numBalloons
  numDead addLevelMoney? originalBloonHealth numCreated lvlEvery
monkeyUpgradeCost tackUpgradeCost colorTrack ]

turtles-own [moneySpent]

breed [ balloons balloon ]
balloons-own [ balloon-health traveltime ]

breed [ dart-monkeys dart-monkey ]
breed [ dart-monkey-bullets dart-monkey-bullet ]
dart-monkeys-own [dart-defense-level]

breed [tack-shooters tack-shooter]
breed [tack-shooter-bullets tack-shooter-bullet]
tack-shooters-own [ tack-shooter-defense-level]

breed [bomb-towers bomb-tower]
breed [bomb-tower-bullets bomb-tower-bullet]
bomb-towers-own [bomb-tower-defense-level]

breed [monkey-aces monkey-ace]
breed [monkey-ace-bullets monkey-ace-bullet]
monkey-aces-own [monkey-ace-defense-level]

breed [super-monkeys super-monkey]
breed [super-monkey-bullets super-monkey-bullet]
super-monkeys-own [super-monkey-defense-level]


to map1
  set end? false
  set colorTrack 4
  ;58 = ground and 4 = track
  ask patches [ set pcolor 58 ]
  ask patches with [ ( pxcor >= -7 and pxcor <= 5 and pycor >= -6 and pycor <= 7 ) ]
    [ set pcolor 4 ]
  ask patch -7 8 [ set pcolor 4 ]
  ask patch -8 -6 [ set pcolor 4 ]
  ask patches with [ pxcor = -6 and pycor >= 1 ] [ set pcolor 58 ]
  ask patches with [ pxcor = -2 and pycor >= 1 ] [ set pcolor 58 ]
  ask patches with [ pxcor = 2 and pycor >= 1 ] [ set pcolor 58 ]
  ask patches with [ pxcor = -6 and pycor <= -3 ] [ set pcolor 58 ]
  ask patches with [ pxcor = -2 and pycor <= -3 ] [ set pcolor 58 ]
  ask patches with [ pxcor = 2 and pycor <= -3 ] [ set pcolor 58 ]
  ask patches with [ pxcor = -4 and pycor >= -5 and pycor <= 6 ] [ set pcolor 58 ]
  ask patches with [ pxcor = 0 and pycor >= -5 and pycor <= 6 ] [ set pcolor 58 ]
  ask patches with [ pxcor = 4 and pycor >= -5 and pycor <= 6 ] [ set pcolor 58 ]
  ask patches with [ pxcor <= 4 and pycor = -1 ] [ set pcolor 58 ]
end

to map2
  set end? false
  set colorTrack 49
  ;132 = ground and 49 = track
  ask patches [ set pcolor 132 ]
  ask patch 6 8 [ set pcolor 49 ]
  ask patch -8 -4 [ set pcolor 49 ]
  ask patches with [ pxcor >= -7 and pxcor <= 6 and pycor >= -6 and pycor <= 7 ]
    [ set pcolor 49 ]
  ask patches with [ pxcor >= 4 and pxcor <= 5 and pycor >= 5 ]
    [ set pcolor 132 ]
  ask patches with [ pxcor >= -6 and pxcor <= 2 and pycor >= 3 and pycor <= 6 ]
    [ set pcolor 132 ]
  ask patches with [ pxcor = -6 and pycor >= -1 and pycor <= 6 ] [ set pcolor 132 ]
  ask patches with [ pxcor = -2 and pycor >= -1 and pycor <= 6 ] [ set pcolor 132 ]
  ask patches with [ pxcor = 2 and pycor >= -3 and pycor <= 6 ] [ set pcolor 132 ]
  ask patches with [ pxcor >= 2 and pycor >= 2 and pycor <= 3 ] [ set pcolor 132 ]
  ask patches with [ pxcor >= 4 and pxcor <= 5 and pycor >= -5 and pycor <= 0 ]
    [ set pcolor 132 ]
  ask patches with [ pxcor >= 0 and pxcor <= 5 and pycor = -5 ] [ set pcolor 132 ]
  ask patches with [ pxcor = 0 and pycor >= -5 and pycor <= 1 ] [ set pcolor 132 ]
  ask patches with [ pxcor <= 0 and pycor = -3 ] [ set pcolor 132 ]
  ask patches with [ pxcor = -4 and pycor >= -3 and pycor <= 1 ] [ set pcolor 132 ]
  ask patches with [ pxcor <= -2 and pycor <= -5 ] [ set pcolor 132 ]
end

to map3
  set end? false
  set colorTrack 0
  ;103 = ground and 0 = track
  ask patches [ set pcolor 103 ]
  ask patches with [ pxcor = 2 and pycor >= 6 ] [ set pcolor 0 ]
  ask patches with [ pxcor >= 2 and pxcor <= 6 and pycor = 6 ] [ set pcolor 0 ]
  ask patches with [ pxcor = 6 and pycor >= -1 and pycor <= 6 ] [ set pcolor 0 ]
  ask patches with [ pxcor >= 4 and pxcor <= 6 and pycor = -1 ] [ set pcolor 0 ]
  ask patches with [ pxcor = 4 and pycor >= -3 and pycor <= -1 ] [ set pcolor 0 ]
  ask patches with [ pxcor >= 4 and pxcor <= 6 and pycor = -3 ] [ set pcolor 0 ]
  ask patches with [ pxcor = 6 and pycor >= -7 and pycor <= -3 ] [ set pcolor 0 ]
  ask patches with [ pxcor >= -6 and pxcor <= 6 and pycor = -7 ] [ set pcolor 0 ]
  ask patches with [ pxcor = -6  and pycor >= -7 and pycor <= -5 ] [ set pcolor 0 ]
  ask patches with [ pxcor >= -6 and pxcor <= 0 and pycor = -5 ] [ set pcolor 0 ]
  ask patches with [ pxcor = 0 and pycor >= -5 and pycor <= 5 ] [ set pcolor 0 ]
  ask patches with [ pxcor >= -3 and pxcor <= 0 and pycor = 5 ] [ set pcolor 0 ]
  ask patches with [ pxcor = -3 and pycor >= 0 and pycor <= 5 ] [ set pcolor 0 ]
  ask patches with [ pxcor <= -3 and pycor = 0 ] [ set pcolor 0 ]
end

to createBalloons
  let bloonHealth 0
  let bloonSize 1
  every lvlEvery
    [ if Levels = "level 1"
        [ set numBalloons 20
          set bloonHealth 1 set originalBloonHealth 1
          set lvlMoney 250 ]
      if Levels = "level 2"
        [ set numBalloons 40
          set bloonHealth 2 set originalBloonHealth 2
          set lvlMoney 350 ]
      if Levels = "level 3"
        [ set numBalloons 55
          set bloonHealth 3 set originalBloonHealth 3
          set lvlMoney 450 ]
      if Levels = "level 4"
        [ set numBalloons 70
          set bloonHealth 4 set originalBloonHealth 4
          set lvlMoney 550 ]
      if Levels = "level 5"
        [ set numBalloons 80
          set bloonHealth 5 set originalBloonHealth 5
          set lvlMoney 650 ]
      if Levels = "level 6"
        [ set numBalloons 100
          set bloonHealth 6 set originalBloonHealth 6
          set lvlMoney 750 ]
      if Levels = "level 7"
        [ set numBalloons 120
          set bloonHealth 7 set originalBloonHealth 7
          set lvlMoney 850 ]
      if Levels = "level 8"
        [ set numBalloons 150
          set bloonHealth 8 set originalBloonHealth 8
          set lvlMoney 950 ]
      if Levels = "level 9"
        [ set numBalloons 5
          set bloonHealth 200 set originalBloonHealth 50 set bloonSize 5
          set lvlMoney 1200 ]
      if Levels = "level 10"
        [ set bloonSize 1
          set numBalloons 200
          set bloonHealth 10 set originalBloonHealth 10
          set lvlMoney 1050 ]
      if balloonsCreated < numBalloons and end? = false
        [ set balloonsCreated ( balloonsCreated + 1 )
          create-balloons 1
            [ if Maps = "map1"
                [ setxy -7 8 ]
              if Maps = "map2"
                [ setxy 6 8 ]
              if Maps = "map3"
                [ setxy 2 8 ]
              set balloon-health bloonHealth
              set size bloonSize
              if balloon-health = 1 [ set color 14 ]
              if balloon-health = 2 [ set color 24 ]
              if balloon-health = 3 [ set color 34 ]
              if balloon-health = 4 [ set color 44 ]
              if balloon-health = 5 [ set color 54 ]
              if balloon-health = 6 [ set color 64 ]
              if balloon-health = 7 [ set color 74 ]
              if balloon-health = 8 [ set color 84 ]
              if balloon-health = 9 [ set color 94 ]
              if balloon-health = 10 [ set color 124 ]
              if balloon-health = 100 [ set color 114 ]
              set heading 180 ]]]
end

to balloonMotion
  if Levels = "level 1" [ set lvlEvery 0.5 ]
  if Levels = "level 2" [ set lvlEvery 0.48 ]
  if Levels = "level 3" [ set lvlEvery 0.45 ]
  if Levels = "level 4" [ set lvlEvery 0.4 ]
  if Levels = "level 5" [ set lvlEvery 0.35 ]
  if Levels = "level 6" [ set lvlEvery 0.3 ]
  if Levels = "level 7" [ set lvlEvery 0.25 ]
  if Levels = "level 8" [ set lvlEvery 0.2 ]
  if Levels = "level 9" [ set lvlEvery 3 ]
  if Levels = "level 10" [ set lvlEvery 0.2 ]
  createBalloons
  ask balloons
    [ fd 0.1
      set traveltime ( traveltime + 1 )
      set label balloon-health
      ifelse Maps = "map3" [ set label-color white ]
                           [ set label-color black ]
      let ground 0 let track 0
      if Maps = "map1" [ ( set ground 58 ) ( set track 4 ) ]
      if Maps = "map2" [ ( set ground 132 ) ( set track 49 ) ]
      if Maps = "map3" [ ( set ground 103 ) ( set track 0 ) ]
      if (( [ pcolor ] of patch-ahead 0.5 ) = ground ) and
         (( [ pcolor ] of patch-at 1 0 ) = track ) and heading = 180
         [ lt 90  ]
      if (( [ pcolor ] of patch-ahead 0.5 ) = ground ) and
         (( [ pcolor ] of patch-at 0 1 ) = track ) and heading = 270
         [ rt 90 ]
      if (( [ pcolor ] of patch-ahead 0.5 ) = ground ) and
         (( [ pcolor ] of patch-at 1 0 ) = track ) and heading = 0
         [ rt 90 ]
      if (( [ pcolor ] of patch-ahead 0.5 ) = ground ) and
         (( [ pcolor ] of patch-at 0 -1 ) = track ) and heading = 270
         [ lt 90 ]
      if (( [ pcolor ] of patch-ahead 0.5 ) = ground ) and
         (( [ pcolor ] of patch-at 0 -1 ) = track ) and heading = 90
         [ rt 90 ]
      if (( [ pcolor ] of patch-ahead 0.5 ) = ground ) and
         (( [ pcolor ] of patch-at -1 0 ) = track ) and heading = 0
         [ lt 90 ]
      if (( [ pcolor ] of patch-ahead 0.5 ) = ground ) and
         (( [ pcolor ] of patch-at 0 1 ) = track ) and heading = 90
         [ lt 90 ]
      if (( [ pcolor ] of patch-ahead 0.5 ) = ground ) and
         (( [ pcolor ] of patch-at -1 0 ) = track ) and heading = 180
         [ rt 90 ]
      if numBalloons = balloonsCreated
             [ set end? true ]
      if [ pxcor ] of patch-here < -7
         [ set numDead ( numDead + 1 )
           if numDead = numBalloons
             [ set money ( money + lvlMoney )
               set addLevelMoney? false ]
             ;if all the balloons were either popped and had reached the end, the round is over and money is added
           set health ( health - balloon-health )
           die ]
      if balloon-health <= 0 [ set money ( money + originalBloonHealth )
                               set numDead ( numDead + 1 )
                               die ]]
if numDead = balloonsCreated and addLevelMoney? = true
  ;if all balloons were killed
  [ set money ( money + lvlMoney )
    set addLevelMoney? false ]
end

to newGame
  ca
  set money 600
  set health 200
  if Maps = "map1"
    [ map1 ]
  if Maps = "map2"
    [ map2 ]
  if Maps = "map3"
    [ map3 ]
  set-default-shape balloons "balloon"
  set-default-shape dart-monkeys "arrow" ;"monkey"
  set-default-shape tack-shooters "orbit 6"
  set-default-shape bomb-towers "mortar pestle"
  set-default-shape monkey-aces "airplane"
  set-default-shape super-monkeys "person"
end

to newLevel
  ;ask balloons [ die ] ;bleh un-comment this part if you
  ;  want a new level while playing another level.
  if Maps = "map1"
    [ map1 ]
  if Maps = "map2"
    [ map2 ]
  if Maps = "map3"
    [ map3 ]
  set numBalloons 0
  set balloonsCreated 0
  set numDead 0
  set addLevelMoney? true
end

to go
  if health > 0
    [ if Levels = "level 1"
        [  every 0.05
          [ balloonMotion
            defend ]]
      if Levels = "level 2"
        [ every 0.045
          [ balloonMotion
            defend ]]
      if Levels = "level 3"
        [ every 0.04
          [ balloonMotion
            defend ]]
      if Levels = "level 4"
        [ every 0.035
          [ balloonMotion
            defend ]]
      if Levels = "level 5"
        [ every 0.03
          [ balloonMotion
            defend ]]
      if Levels = "level 6"
        [ every 0.025
          [ balloonMotion
            defend ]]
      if Levels = "level 7"
        [ every 0.02
          [ balloonMotion
            defend ]]
      if Levels = "level 8"
        [ every 0.015
          [ balloonMotion
            defend ]]
      if Levels = "level 9"
        [ every 0.1
          [ balloonMotion
            defend ]]
      if Levels = "level 8"
        [ every 0.04
          [ balloonMotion
            defend ]]
      if Levels = "level 9"
        [ every 0.03
          [ balloonMotion
            defend ]]
      if Levels = "level 10"
        [ every 0.02
          [ balloonMotion
            defend ]]]

end





to defend
  ask dart-monkeys [dart-monkey-defense]
  ask tack-shooters [tack-shooter-defense]
  ask bomb-towers [bomb-tower-defense]
  ask monkey-aces [monkey-ace-defense]
  ask super-monkeys [super-monkey-defense]
end

to dart-monkey-defense
        if dart-defense-level = 1  [dart-monkey-shot1]
        if dart-defense-level = 2 [dart-monkey-shot2 ]
        if dart-defense-level = 3 [dart-monkey-shot3 ]
        if dart-defense-level = 4 [dart-monkey-shot4 ]
        if dart-defense-level = 5 [dart-monkey-shot5 ]
end

to buy-dart-monkey
  if money >= 100 and [ pcolor ] of patch mouse-xcor mouse-ycor != colorTrack
 [ if mouse-inside? [create-dart-monkeys 1
    [ set color 5 set size 1 setxy mouse-xcor mouse-ycor set dart-defense-level 1
      set moneySpent moneySpent + 100]]
  set money money - 100]


end

to dart-monkey-upgrade
 ask min-one-of dart-monkeys [distancexy mouse-xcor mouse-ycor]
   [set dart-defense-level dart-defense-level + 1

 ifelse money >= 25 and dart-defense-level = 2 [set money money - (100 / 4) set moneySpent moneySpent + 100 / 4]

 [ifelse money >= 50 and dart-defense-level = 3 [set money money - ((100 / 4) + 25) set moneySpent moneySpent + (100 / 4) + 25]

 [ifelse money >= 75 and dart-defense-level = 4 [set money money - ((100 / 4) + 50) set moneySpent moneySpent + (100 / 4) + 50]

 [ifelse money >= 2000 and dart-defense-level = 5 [set money money - 2000 set moneySpent moneySpent + 2000]
   [set dart-defense-level dart-defense-level - 1]

   ]]]]
end

to dart-monkey-shot1
  if any? balloons in-radius 5
    [
      face max-one-of balloons in-radius 5[ traveltime ]
   hatch-dart-monkey-bullets 1
  [repeat 10
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .012 ]die]]
  die
  ]]
end

to dart-monkey-shot2
  if any? balloons in-radius 5.4
    [
      face max-one-of balloons in-radius 5.4 [ traveltime ]
   hatch-dart-monkey-bullets 1
 [ repeat (40 / 3)
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .015 ]die]]
  die]]
end

to dart-monkey-shot3
  if any? balloons in-radius 5.8
    [
      face max-one-of balloons in-radius 5.8[ traveltime ]
   hatch-dart-monkey-bullets 1
  [repeat (50 / 3)
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .018 ]die]]
  die]]
end

to dart-monkey-shot4
  if any? balloons in-radius 6.2
    [
      face max-one-of balloons in-radius 6.2 [ traveltime ]
  hatch-dart-monkey-bullets 1
 [ repeat 20
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .021 ]die]]
  die]]
end

to dart-monkey-shot5
   if any? balloons in-radius 6.6
    [
      face max-one-of balloons in-radius 6.6[ traveltime ]
   hatch-dart-monkey-bullets 1
 [ repeat (70 / 3)
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .024 ]]]
  die]]
end

to buy-tack-shooter
  if money >= 300 and [ pcolor ] of patch mouse-xcor mouse-ycor != colorTrack
[  if mouse-inside? [create-tack-shooters 1
    [ set color 15 set size 1 setxy mouse-xcor mouse-ycor set tack-shooter-defense-level 1
       set moneySpent moneySpent + 300]]
  set money money - 300]
end

to tack-shooter-upgrade
  ask min-one-of tack-shooters [distancexy mouse-xcor mouse-ycor]
   [set tack-shooter-defense-level tack-shooter-defense-level + 1

  ifelse tack-shooter-defense-level = 2 and money >= 60 [set money money - (300 / 5) set moneySpent moneySpent + 60]

 [ ifelse tack-shooter-defense-level = 3 and money >= 90 [set money money - ((300 / 5) + 30) set moneySpent moneySpent + 90]

  [ifelse tack-shooter-defense-level = 4 and money >= 120 [set money money - ((300 / 5) + 60) set moneySpent moneySpent + 120]

  [ifelse tack-shooter-defense-level = 5 and money >= 600 [set money money -  600 set moneySpent moneySpent + 600]
    [set tack-shooter-defense-level tack-shooter-defense-level - 1]
  ]]]]
end

to tack-shooter-defense
  if tack-shooter-defense-level = 1 [tack-shooter-shot1]
  if tack-shooter-defense-level = 2 [tack-shooter-shot2 ]
  if tack-shooter-defense-level = 3 [tack-shooter-shot3 ]
  if tack-shooter-defense-level = 4 [tack-shooter-shot4 ]
  if tack-shooter-defense-level = 5 [tack-shooter-shot5 ]
end

to tack-shooter-tracker1
 repeat 10
  [fd .3
  if any? balloons-here [   ask other balloons-here
    [ set balloon-health balloon-health - .012 ]die]]
  die
end

to tack-shooter-tracker2
 repeat 10
  [fd .3
  if any? balloons-here [   ask other balloons-here
    [ set balloon-health balloon-health - .015 ]die]]
  die
end

to tack-shooter-tracker3
 repeat 10
  [fd .3
  if any? balloons-here [   ask other balloons-here
    [ set balloon-health balloon-health - .018]die]]
  die
end

to tack-shooter-tracker4
 repeat 10
  [fd .3
  if any? balloons-here [   ask other balloons-here
    [ set balloon-health balloon-health - .021 ] die]]
  die
end

to tack-shooter-tracker5
 repeat 20
  [fd .3
  if any? balloons-here [   ask other balloons-here
    [ set balloon-health balloon-health - .016 ]die]]
 die
end

to tack-shooter-shot1
  if any? balloons in-radius 3
    [
      hatch-tack-shooter-bullets 1 [set heading 0 tack-shooter-tracker1]
    hatch-tack-shooter-bullets 1 [set heading 45 tack-shooter-tracker1]
    hatch-tack-shooter-bullets 1 [set heading 90 tack-shooter-tracker1]
    hatch-tack-shooter-bullets 1 [set heading 135 tack-shooter-tracker1]
    hatch-tack-shooter-bullets 1 [set heading 180 tack-shooter-tracker1]
    hatch-tack-shooter-bullets 1 [set heading 225 tack-shooter-tracker1]
    hatch-tack-shooter-bullets 1 [set heading 270 tack-shooter-tracker1]
    hatch-tack-shooter-bullets 1 [set heading 315 tack-shooter-tracker1]]
end

to tack-shooter-shot2
  if any? balloons in-radius 3.4
    [
      hatch-tack-shooter-bullets 1 [set heading 0 tack-shooter-tracker2]
    hatch-tack-shooter-bullets 1 [set heading 45 tack-shooter-tracker2]
    hatch-tack-shooter-bullets 1 [set heading 90 tack-shooter-tracker2]
    hatch-tack-shooter-bullets 1 [set heading 135 tack-shooter-tracker2]
    hatch-tack-shooter-bullets 1 [set heading 180 tack-shooter-tracker2]
    hatch-tack-shooter-bullets 1 [set heading 225 tack-shooter-tracker2]
    hatch-tack-shooter-bullets 1 [set heading 270 tack-shooter-tracker2]
    hatch-tack-shooter-bullets 1 [set heading 315 tack-shooter-tracker2]]
end

to tack-shooter-shot3
   if any? balloons in-radius 3.8
     [
       hatch-tack-shooter-bullets 1 [set heading 0 tack-shooter-tracker3]
    hatch-tack-shooter-bullets 1 [set heading 45 tack-shooter-tracker3]
    hatch-tack-shooter-bullets 1 [set heading 90 tack-shooter-tracker3]
    hatch-tack-shooter-bullets 1 [set heading 135 tack-shooter-tracker3]
    hatch-tack-shooter-bullets 1 [set heading 180 tack-shooter-tracker3]
    hatch-tack-shooter-bullets 1 [set heading 225 tack-shooter-tracker3]
    hatch-tack-shooter-bullets 1 [set heading 270 tack-shooter-tracker3]
    hatch-tack-shooter-bullets 1 [set heading 315 tack-shooter-tracker3]]
end

to tack-shooter-shot4
   if any? balloons in-radius 4.2
    [
   hatch-tack-shooter-bullets 1 [set heading 0 tack-shooter-tracker4]
   hatch-tack-shooter-bullets 1 [set heading 45 tack-shooter-tracker4]
   hatch-tack-shooter-bullets 1 [set heading 90 tack-shooter-tracker4]
   hatch-tack-shooter-bullets 1 [set heading 135 tack-shooter-tracker4]
   hatch-tack-shooter-bullets 1 [set heading 180 tack-shooter-tracker4]
   hatch-tack-shooter-bullets 1 [set heading 225 tack-shooter-tracker4]
   hatch-tack-shooter-bullets 1 [set heading 270 tack-shooter-tracker4]
   hatch-tack-shooter-bullets 1 [set heading 315 tack-shooter-tracker4]]
end

to tack-shooter-shot5
  if any? balloons in-radius 4.6
    [
    hatch-tack-shooter-bullets 1 [set heading 0 tack-shooter-tracker5]
     hatch-tack-shooter-bullets 1 [set heading 22.5 tack-shooter-tracker5]
    hatch-tack-shooter-bullets 1 [set heading 45 tack-shooter-tracker5]
     hatch-tack-shooter-bullets 1 [set heading 67.5 tack-shooter-tracker5]
    hatch-tack-shooter-bullets 1 [set heading 90 tack-shooter-tracker5]
     hatch-tack-shooter-bullets 1 [set heading 112.5 tack-shooter-tracker5]
    hatch-tack-shooter-bullets 1 [set heading 135 tack-shooter-tracker5]
     hatch-tack-shooter-bullets 1 [set heading 157.5 tack-shooter-tracker5]
    hatch-tack-shooter-bullets 1 [set heading 180 tack-shooter-tracker5]
     hatch-tack-shooter-bullets 1 [set heading 202.5 tack-shooter-tracker5]
    hatch-tack-shooter-bullets 1 [set heading 225 tack-shooter-tracker5]
     hatch-tack-shooter-bullets 1 [set heading 247.5 tack-shooter-tracker5]
    hatch-tack-shooter-bullets 1 [set heading 270 tack-shooter-tracker5]
     hatch-tack-shooter-bullets 1 [set heading 292.5 tack-shooter-tracker5]
    hatch-tack-shooter-bullets 1 [set heading 315 tack-shooter-tracker5]
     hatch-tack-shooter-bullets 1 [set heading 337.5 tack-shooter-tracker5]]
end

  to bomb-tower-defense
       if bomb-tower-defense-level = 1  [bomb-tower-shot1]
       if bomb-tower-defense-level = 2 [bomb-tower-shot2 ]
       if bomb-tower-defense-level = 3 [bomb-tower-shot3 ]
       if bomb-tower-defense-level = 4 [bomb-tower-shot4 ]
       if bomb-tower-defense-level = 5 [bomb-tower-shot5 ]
end

 to buy-bomb-tower
 if money >= 300 and [ pcolor ] of patch mouse-xcor mouse-ycor != colorTrack
 [ if mouse-inside? [create-bomb-towers 1
    [ set color 55 set size 1 setxy mouse-xcor mouse-ycor set bomb-tower-defense-level 1
      set moneySpent moneySpent + 300]]
  set money money - 300]
end

to bomb-tower-upgrade
  ask min-one-of bomb-towers [distancexy mouse-xcor mouse-ycor]
   [set bomb-tower-defense-level bomb-tower-defense-level + 1

   ifelse money >= 60 and bomb-tower-defense-level = 2 [set money money - (300 / 5) set moneySpent moneySpent + 60]

   [ifelse money >= 90 and bomb-tower-defense-level = 3 [set money money - ((300 / 5)  + 30) set moneySpent moneySpent + 90]

   [ifelse money >= 120 and bomb-tower-defense-level = 4 [set money money - ((300 / 5)  + 60) set moneySpent moneySpent + 120]

    [ifelse money >= 1000 and bomb-tower-defense-level = 5 [set money money - 1000 set moneySpent moneySpent + 1000]
      [set bomb-tower-defense-level bomb-tower-defense-level - 1]
   ]]]]
end

to bomb-tower-shot1
  if any? balloons in-radius 6
    [
      face max-one-of balloons in-radius 6[ traveltime ]
   hatch-bomb-tower-bullets 1
  [set label "" repeat 10
  [fd .3
  if any? balloons-here [set shape "fire" set size 2.75   ask other balloons in-radius 2.5
                                         [ set balloon-health balloon-health - .01 ]wait .02 die]]
  die
  ]]
end

to bomb-tower-shot2
  if any? balloons in-radius 6.4
    [
      face max-one-of balloons in-radius 6.4[ traveltime ]
   hatch-bomb-tower-bullets 1
  [set label "" repeat 10
  [fd .3
  if any? balloons-here [set shape "fire" set size 2.75   ask other balloons in-radius 2.75
                                         [ set balloon-health balloon-health - .011 ]wait .02 die]]
  die
  ]]
end

to bomb-tower-shot3
  if any? balloons in-radius 6.8
    [
      face max-one-of balloons in-radius 6.8[ traveltime ]
   hatch-bomb-tower-bullets 1
  [set label "" repeat (50 / 3)
  [fd .3
  if any? balloons-here [set shape "fire" set size 2.75   ask other balloons in-radius 2.75
                                         [ set balloon-health balloon-health - .012 ] wait .02 die]]
  die]]
end

to bomb-tower-shot4
  if any? balloons in-radius 7.2
    [
      face max-one-of balloons in-radius 7.2[ traveltime ]
  hatch-bomb-tower-bullets 1
 [set label "" repeat 20
  [fd .3
  if any? balloons-here [set shape "fire" set size 2.75   ask other balloons in-radius 2.75
                                         [ set balloon-health balloon-health - .013 ]wait .02 die]]
  die]]
end

to bomb-tower-shot5
   if any? balloons in-radius 7.6
    [
      face max-one-of balloons in-radius 7.6[ traveltime ]
   hatch-bomb-tower-bullets 1
 [set label "" repeat (70 / 3)
  [fd .3
  if any? balloons-here [set shape "fire" set size 5   ask other balloons in-radius 7
                                         [ set balloon-health balloon-health - .013 ]wait .02 die]]
  die]]
end

 to monkey-ace-defense
  fd .1 rt 1.5

       if monkey-ace-defense-level = 1  [monkey-ace-shot1]
       if monkey-ace-defense-level = 2 [monkey-ace-shot2 ]
      if monkey-ace-defense-level = 3 [monkey-ace-shot3 ]
      if monkey-ace-defense-level = 4 [monkey-ace-shot4 ]
      if monkey-ace-defense-level = 5 [monkey-ace-shot5 ]
 end


  to buy-monkey-ace
 if money >= 700
[  if mouse-inside? [create-monkey-aces 1
    [ set color 55 set size 2 setxy mouse-xcor mouse-ycor set monkey-ace-defense-level 1
      set heading 315 set moneySpent moneySpent + 700]]
  set money money - 700]
end

to monkey-ace-upgrade
 ask min-one-of monkey-aces [distancexy mouse-xcor mouse-ycor]
  [set monkey-ace-defense-level monkey-ace-defense-level + 1

    ifelse money >= 150 and monkey-ace-defense-level = 2 [set money money - 150 set moneySpent moneySpent + 150]

    [ifelse money >= 200 and monkey-ace-defense-level = 3 [set money money - 200 set moneySpent moneySpent + 200]

   [ifelse money >= 200 and monkey-ace-defense-level = 4 [set money money - 200 set moneySpent moneySpent + 200]

   [ifelse money >= 2500 and  monkey-ace-defense-level = 5 [set money money - 2500 set moneySpent moneySpent + 2500]
     [set monkey-ace-defense-level monkey-ace-defense-level - 1]
  ]]]]
end

to monkey-ace-tracker1
 repeat 45
  [fd .3
  if any? balloons-here [ask other balloons-here
    [ set balloon-health balloon-health - .04 ]die]]
  die
end


to monkey-ace-tracker2
 repeat 45
  [fd .3
  if any? balloons-here [ask other balloons-here
    [ set balloon-health balloon-health - .046 ]die]]
  die
end

to monkey-ace-tracker3
 repeat 45
  [fd .3
  if any? balloons-here [ask other balloons-here
    [ set balloon-health balloon-health - .052 ]die]]
  die
end

to monkey-ace-tracker4
 repeat 45
  [fd .3
  if any? balloons-here [ask other balloons-here
    [ set balloon-health balloon-health - .058 ]die]]
  die
end

to monkey-ace-tracker5
 repeat 45
  [set label "" fd .3
  if any? balloons-here [set size 2.5  set shape "fire"  ask other balloons in-radius 2.5
    [ set balloon-health balloon-health - .016]wait .005 die]]
  die
end

to monkey-ace-shot1
    hatch-monkey-ace-bullets 1 [set heading 0 set size 1 monkey-ace-tracker1]
    hatch-monkey-ace-bullets 1 [set heading 45 set size 1 monkey-ace-tracker1]
    hatch-monkey-ace-bullets 1 [set heading 90 set size 1 monkey-ace-tracker1]
    hatch-monkey-ace-bullets 1 [set heading 135 set size 1 monkey-ace-tracker1]
    hatch-monkey-ace-bullets 1 [set heading 180 set size 1 monkey-ace-tracker1]
    hatch-monkey-ace-bullets 1 [set heading 225 set size 1 monkey-ace-tracker1]
    hatch-monkey-ace-bullets 1 [set heading 270 set size 1 monkey-ace-tracker1]
    hatch-monkey-ace-bullets 1 [set heading 315 set size 1 monkey-ace-tracker1]
end

to monkey-ace-shot2
    hatch-monkey-ace-bullets 1 [set heading 0 set size 1 monkey-ace-tracker2]
    hatch-monkey-ace-bullets 1 [set heading 45 set size 1 monkey-ace-tracker2]
    hatch-monkey-ace-bullets 1 [set heading 90 set size 1 monkey-ace-tracker2]
    hatch-monkey-ace-bullets 1 [set heading 135 set size 1 monkey-ace-tracker2]
    hatch-monkey-ace-bullets 1 [set heading 180 set size 1 monkey-ace-tracker2]
    hatch-monkey-ace-bullets 1 [set heading 225 set size 1 monkey-ace-tracker2]
    hatch-monkey-ace-bullets 1 [set heading 270 set size 1 monkey-ace-tracker2]
    hatch-monkey-ace-bullets 1 [set heading 315 set size 1 monkey-ace-tracker2]
end

to monkey-ace-shot3
    hatch-monkey-ace-bullets 1 [set heading 0 set size 1 monkey-ace-tracker3]
    hatch-monkey-ace-bullets 1 [set heading 45 set size 1 monkey-ace-tracker3]
    hatch-monkey-ace-bullets 1 [set heading 90 set size 1 monkey-ace-tracker3]
    hatch-monkey-ace-bullets 1 [set heading 135 set size 1 monkey-ace-tracker3]
    hatch-monkey-ace-bullets 1 [set heading 180 set size 1 monkey-ace-tracker3]
    hatch-monkey-ace-bullets 1 [set heading 225 set size 1 monkey-ace-tracker3]
    hatch-monkey-ace-bullets 1 [set heading 270 set size 1 monkey-ace-tracker3]
    hatch-monkey-ace-bullets 1 [set heading 315 set size 1 monkey-ace-tracker3]
end


to monkey-ace-shot4
    hatch-monkey-ace-bullets 1 [set heading 0 set size 1 monkey-ace-tracker4]
    hatch-monkey-ace-bullets 1 [set heading 45 set size 1 monkey-ace-tracker4]
    hatch-monkey-ace-bullets 1 [set heading 90 set size 1 monkey-ace-tracker4]
    hatch-monkey-ace-bullets 1 [set heading 135 set size 1 monkey-ace-tracker4]
    hatch-monkey-ace-bullets 1 [set heading 180 set size 1 monkey-ace-tracker4]
    hatch-monkey-ace-bullets 1 [set heading 225 set size 1 monkey-ace-tracker4]
    hatch-monkey-ace-bullets 1 [set heading 270 set size 1 monkey-ace-tracker4]
    hatch-monkey-ace-bullets 1 [set heading 315 set size 1 monkey-ace-tracker4]
end

to monkey-ace-shot5
    hatch-monkey-ace-bullets 1 [set heading 0 set size 1 monkey-ace-tracker5]
    hatch-monkey-ace-bullets 1 [set heading 45 set size 1 monkey-ace-tracker5]
    hatch-monkey-ace-bullets 1 [set heading 90 set size 1 monkey-ace-tracker5]
    hatch-monkey-ace-bullets 1 [set heading 135 set size 1 monkey-ace-tracker5]
    hatch-monkey-ace-bullets 1 [set heading 180 set size 1 monkey-ace-tracker5]
    hatch-monkey-ace-bullets 1 [set heading 225 set size 1 monkey-ace-tracker5]
    hatch-monkey-ace-bullets 1 [set heading 270 set size 1 monkey-ace-tracker5]
    hatch-monkey-ace-bullets 1 [set heading 315 set size 1 monkey-ace-tracker5]
end

 to super-monkey-defense
       if super-monkey-defense-level = 1  [super-monkey-shot1]
       if super-monkey-defense-level = 2 [super-monkey-shot2 ]
     if super-monkey-defense-level = 3 [super-monkey-shot3 ]
      if super-monkey-defense-level = 4 [super-monkey-shot4 ]
    if super-monkey-defense-level = 5 [super-monkey-shot5 ]
 end

to buy-super-monkey
  if money >= 3000 and [ pcolor ] of patch mouse-xcor mouse-ycor != colorTrack
 [ if mouse-inside? [create-super-monkeys 1 [ set color 15 set size 1 setxy mouse-xcor mouse-ycor
      set super-monkey-defense-level 1 set moneySpent moneySpent + 3000]]
  set money money - 3000]
end

to super-monkey-upgrade
  ask min-one-of super-monkeys [distancexy mouse-xcor mouse-ycor]
  [set super-monkey-defense-level super-monkey-defense-level + 1

  ifelse money >= 500 and super-monkey-defense-level = 2 [set money money - 500 set moneySpent moneySpent + 500]

   [ifelse money >= 600 and super-monkey-defense-level = 3 [set money money - 600 set moneySpent moneySpent + 600]

  [ ifelse money >= 700 and super-monkey-defense-level = 4 [set money money - 700 set moneySpent moneySpent + 700]

  [ ifelse money >= 5000 and super-monkey-defense-level = 5 [set money money - 5000 set moneySpent moneySpent + 5000]
    [set super-monkey-defense-level super-monkey-defense-level - 1]
  ]]]]
end

to super-monkey-shot1
  if any? balloons in-radius 5
    [
      face max-one-of balloons in-radius 5[ traveltime ]
   hatch-super-monkey-bullets 20
  [repeat 10
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .012 ]die]]
  die
  ]]
end

to super-monkey-shot2
  if any? balloons in-radius 5.4
    [
     face max-one-of balloons in-radius 5.4  [ traveltime ]
   hatch-super-monkey-bullets 20
  [repeat 10
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .013 ]die]]
  die
  ]]
end

to super-monkey-shot3
  if any? balloons in-radius 5.8
    [
      face max-one-of balloons in-radius 5.8[ traveltime ]
   hatch-super-monkey-bullets 20
  [repeat 10
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .014 ]die]]
  die
  ]]
end

to super-monkey-shot4
  if any? balloons in-radius 6.2
    [
      face max-one-of balloons in-radius 6.2[ traveltime ]
   hatch-super-monkey-bullets 20
  [repeat 10
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .015 ]die]]
  die
  ]]
end

to super-monkey-shot5
  if any? balloons in-radius 12.4
    [
      face max-one-of balloons in-radius 12.4 [ traveltime ]
   hatch-super-monkey-bullets 30
  [repeat 67
  [fd .3
  if any? balloons-here [   ask other balloons-here
                                         [ set balloon-health balloon-health - .016 ]die]]
  die
  ]]
end

to sell
  ask min-one-of turtles [distancexy mouse-xcor mouse-ycor]
  [set money money + (moneySpent / 2) die]
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
645
466
8
8
25.0
1
10
1
1
1
0
0
0
1
-8
8
-8
8
0
0
1
ticks
30.0

BUTTON
17
12
174
62
New Game
newGame\nif sandbox [set money 100000 set health 100000]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
123
234
198
267
Go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
16
276
71
321
Health
health
17
1
11

CHOOSER
33
123
171
168
Maps
Maps
"map1" "map2" "map3"
2

CHOOSER
33
179
171
224
Levels
Levels
"level 1" "level 2" "level 3" "level 4" "level 5" "level 6" "level 7" "level 8" "level 9" "level 10"
9

BUTTON
665
40
793
73
Dart Monkey
buy-dart-monkey
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

BUTTON
665
79
823
112
Dart Monkey Upgrade
dart-monkey-upgrade\nask dart-monkeys\n [if [ pcolor ] of patch-here = 58 \n [set label-color black]\n set label dart-defense-level]
NIL
1
T
OBSERVER
NIL
F
NIL
NIL
1

BUTTON
668
118
780
151
Tack Shooter
buy-tack-shooter
NIL
1
T
OBSERVER
NIL
T
NIL
NIL
1

BUTTON
667
161
823
194
Tack Shooter Upgrade
tack-shooter-upgrade\nask tack-shooters \n[if [ pcolor ] of patch-here = 58 \n[set label-color black]\nset label tack-shooter-defense-level]
NIL
1
T
OBSERVER
NIL
Y
NIL
NIL
1

BUTTON
667
203
775
236
Bomb Tower
buy-bomb-tower
NIL
1
T
OBSERVER
NIL
B
NIL
NIL
1

BUTTON
667
246
831
279
Bomb Tower Upgrade
bomb-tower-upgrade\nask bomb-towers \n[if [ pcolor ] of patch-here = 58 \n[set label-color black]\nset label bomb-tower-defense-level]
NIL
1
T
OBSERVER
NIL
N
NIL
NIL
1

BUTTON
668
287
773
320
Monkey Ace
buy-monkey-ace
NIL
1
T
OBSERVER
NIL
A
NIL
NIL
1

BUTTON
667
328
829
361
Monkey Ace Upgrade
monkey-ace-upgrade\nask monkey-aces \n[if [ pcolor ] of patch-here = 58 \n[set label-color black]\nset label monkey-ace-defense-level]
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
666
368
784
401
Super Monkey
buy-super-monkey
NIL
1
T
OBSERVER
NIL
Q
NIL
NIL
1

BUTTON
665
408
839
441
Super Monkey Upgrade
super-monkey-upgrade\nask super-monkeys \n[if [ pcolor ] of patch-here = 58 \n[set label-color black]\nset label super-monkey-defense-level]
NIL
1
T
OBSERVER
NIL
W
NIL
NIL
1

TEXTBOX
719
12
779
36
Shop
20
0.0
1

MONITOR
101
277
158
322
Money
money
0
1
11

TEXTBOX
67
506
928
672
Bloons Tower Defense 4
70
0.0
0

TEXTBOX
316
609
602
647
Creators: Tomas Engquist, Alison Lee
15
0.0
1

BUTTON
17
382
151
444
Sell Defense
sell
NIL
1
T
OBSERVER
NIL
1
NIL
NIL
1

BUTTON
3
233
105
266
New Level
newLevel
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
872
10
931
34
Prices
20
0.0
1

TEXTBOX
881
46
923
65
100
15
0.0
1

TEXTBOX
882
125
919
143
300
15
0.0
1

TEXTBOX
882
208
924
226
300
15
0.0
1

TEXTBOX
885
294
918
312
700
15
0.0
1

TEXTBOX
880
377
926
395
2000
15
0.0
1

TEXTBOX
851
88
957
120
25, 50, 75, 2000
13
0.0
1

TEXTBOX
841
169
954
187
60, 90, 120, 600
13
0.0
1

TEXTBOX
849
253
967
285
60, 90, 120, 1000
13
0.0
1

TEXTBOX
840
335
984
367
150, 200, 250, 2500
13
0.0
1

TEXTBOX
843
415
974
433
500, 600, 700, 3000
13
0.0
1

TEXTBOX
687
459
960
543
* The first price after upgrade is the cost to upgrade to level 2, and second is the cost to upgrade to level 3 and so forth...
11
0.0
1

SWITCH
45
74
164
107
Sandbox
Sandbox
1
1
-1000

@#$#@#$#@
#Bloons Tower Defense 4
## About

This is a single player tower defense game based on Bloons Tower Defense 4. The player starts with 200 lives and $600 to spend on defenses and upgrades.
Each time a balloon reaches the end of the track, the player loses 1 life.
The game gets harder with each round.

## User controls / How to play

### How to start
* Choose a map from maps chooser. Then click the 'New Game' button.
### Going to the next level
* Choose the next level in the 'Levels' chooser after completing a level.
* Click the 'New Level' button, then click the 'go' button to start the level. (Do this even for the first level)
### How to Buy and Upgrade
* To buy a defense, place the mouse on the screen where you want the defense to be, and press the hotkey found on the buttons in the shop.
* To upgrade a defense, place the mouse over the defense you want to upgrade, and press the hotkey found on the buttons in the shop. This will upgrade it one level.
* To sell a defense, place the mouse over the defense you want to sell, press the hotkey, and it will add half of what you paid for to your money.

## Defense Information

### Dart Monkey
#### Description
- Aims and fires bullets one at a time at passing balloons
- Upgrading improves damage and range
- Unlock piercing bullets (bullets go through balloons) at level 5

### Tack Shooter
#### Description
- Fires bullets in 8 directions when balloons are in range
- Upgrading improves damage and range
- Unlock extra bullets (fires 16 bullets) at level 5

### Bomb Tower
#### Description
- Aims and fires exploding bullets at passing balloons
- Upgrading improves damage and range
- Unlock massive explosions at Level 5

### Monkey Ace
#### Description
- Aerial defense that flies in a circle
- Permanently shoots 8 bullets in all directions
- Upgrading improves damage
- Unlock exploding bullets at level 5

### Super Monkey
#### Description
- Aims and fires bullets and passing balloons
- Shoots 20X faster than a dart monkey
- Upgrading improves damage and range
- Unlock massive range and 1.5 speed at level 5

# Development Log

## 1/11/16
### Added Features
#### Alison
- Created 1 map

#### Tomas
- Created 1 cannon that could fire a single bullet

### Known Bugs
- Bullet did not know when to die and remained on the screen after it fired

## 1/12/16
### Added Feautures
#### Alison
- Attempted to make the balloons move along the track properly (balloonMotion). Tested a variety of methods for movement (repeat, loop, etc).

#### Tomas
- Attempted to keep bullets from passing through border

### Known Bugs
- Balloons wait for each other to move if we tell them to move a specific way (for example: telling them to fd 3 then rt 90 then fd 5)
- No good method for placing a cannon

## 1/13/16
### Added Feautres
#### Alison
- All balloons move properly and disappear (die) once the reach the end of the track. This was by using patch-at x y and the 'back' command
- Created a player health global variable and monitor.
- If the balloon reaches the end of the track, the player loses 1 life

#### Tomas
- Programmed defense to aim and fire multiple shots at passing balloons

### Known Bugs
- The balloons will only turn after moving back 1. Therefore the balloon movement throughout the map doesn't look smooth.
- Passing balloons did not die

## 1/14/16
### Added Feautures
#### Alison
- Changed the balloonMotion code so that the balloons can move more efficiently using patch-ahead.

#### Tomas
- Added turtles variables distance-traveled and balloon-health

### Known Bugs
- Balloons did not turn at certain bends in the maps.
- Balloons did not die
- No visible bullets

## 1/15/16
### Added features
#### Alison
- Fixed a few errors in balloonMotion. Works properly.
- Started fixing map code with a change in world size (the size is now 17 x 17) and patch size (25)

#### Tomas
- Got defense to start killing balloons
- Merged code with Alison

### Known Bugs
- All balloons were dying

## 1/16/16
### Added Features
#### Alison
- Finished 1st map change
- Created a second map

#### Tomas
- Fixed overkilling bug

### Known Bugs
- defense appeared to be missing when balloons were to the side

## 1/17/16
### Added Feautures
#### Alison
- Created a third map

#### Tomas
- tested basic defense for bugs
- added button to place a defense on the map

### Known bugs
- Defense missed balloons
- Defense obliterates hit balloons

## 1/18/16
### Added Features
#### Alison
- Made the createBalloons code.
- Balloons will spawn at a certain point depending on the map. All have their heading set at 180 (downwards).
- All die when they reach the end of the track (if the pxcor < -7)

#### Tomas
- Changed the mecanism for tracking down a balloon
### Known Bugs
-Defense missed balloons
-Defense obliterates hit balloons

## 1/19/16
### Added Features
#### Alison
- Created and started to work on levels.

#### Tomas
- fixed both bugs from the weekend
- added a button that placed defenses where the mouse is
- worked to murge updated codes

### Known bugs
- Defense missed balloons
- Defense obliterates hit balloons

## 1/20/16
### Added Features
#### Alison
- Continued to work on levels.
- Created some variables so that different levels will run each time you click 'Go'.

#### Tomas
- created breeds for basic-monkey and basic-monkey-bullet
- added basic-monkey variable defense-level
- created 5 upgrades for the basic-monkey defense
- created a button for upgrading basic-monkey-defenses

### Known bugs
- Balloons are slowed on the track

## 1/21/16
### Added Features
#### Alison
- Created variables end?, balloonsCreated, numDead and incorporated them into the createBalloons and balloonMotion code so that balloons will die when appropriate.
- balloonsCreated is the number of balloons that should be created in each level.
- numDead is the number of balloons that have been killed or that have reached the end of the track.

#### Tomas
- created new defense called tower (with appropriate breeds)
- created 5 upgrades for towers
- created buttons for placing towers and upgrading towers

### Known bugs
- Levels don't run.
- Program slows when there are too many defenses

## 1/21/16
### Added Features
#### Alison
- Created a money variable. $600 is available with each map and the player earns $1 with each balloon they pop. Money is awarded at the end of each level.

#### Tomas
- created new defense called tower (with appropriate breeds)
- created 5 upgrades for towers
- created buttons for placing towers and upgrading towers

### Known bugs
- Program slows when there are too many defenses.
- The money that is supposed to be added in each level does not get added if the player manages to kill all balloons.

## 1/22/16
### Added Features
#### Alison
- Created the 'New Level' button in order to fix Money problems and to fix a few other problems involving the number of balloons created each round.
- 'addLevelMoney?': 'lvlMoney' will be added to money when the level passes

#### Tomas
- Created new defense called bomb tower with 5 upgrades
- Created a button for placing bomb tower and upgrading bomb towers
- Created new defense called monkey ace (flying unit) with 5 upgrades
- Created a button for upgrading and placing a monkey ace

### Known bugs
- Program slows when there are too many defenses
- Defenses seem too strong
- Can upgrade to infinity but upgrades past 5 will not work.

## 1/23/16
### Added Features
#### Alison
- Worked on the cost of towers and upgrades.
- Created local upgrade variables concerning the cost of each upgrade. The cost will go up by $100 with each upgrade.
- Fixed bug by disallowing defenses to upgrade past level 5.
- 'Go' will not run if health is equal to (or less than) 0.
- Health will drop by 1, 2, 3, 4, or 5 depending on the health of the balloon.

#### Tomas
- Created a new defense called super monkey with 5 upgrades
- Changed the amount of damage each defense does
- Created a special ability unlocked at level 5 for each defense

### Known Bugs
- Money doesn't go up when a balloon is popped.

## 1/24/16
### Added Features
#### Alison
- Created variables 'originalBloonHealth' and 'lvlEvery' so the money will go up 'originalBloonHealth' amount when the balloon is popped (bug from yesterday was fixed), and so that the distances between the balloons will change, respectively.
- Created 5 more levels (there are 10 in total now).
- Fixed bug (discovered today) concerning the amount of money added at the end of the round if no balloons were popped.

#### Tomas
- created title
- tested code for bugs
- Created costs for buying and upgrading
- Created if statements to keep purchases in the money budget
- Created selling button

### Known Bugs
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

balloon
false
0
Circle -7500403 true true 73 0 152
Polygon -7500403 true true 219 104 205 133 185 165 174 190 165 210 165 225 150 225 147 119
Polygon -7500403 true true 79 103 95 133 115 165 126 190 135 210 135 225 150 225 154 120
Rectangle -6459832 true false 129 241 173 273
Line -16777216 false 135 225 135 240
Line -16777216 false 165 225 165 240
Line -16777216 false 150 225 150 240

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fire
false
0
Polygon -7500403 true true 151 286 134 282 103 282 59 248 40 210 32 157 37 108 68 146 71 109 83 72 111 27 127 55 148 11 167 41 180 112 195 57 217 91 226 126 227 203 256 156 256 201 238 263 213 278 183 281
Polygon -955883 true false 126 284 91 251 85 212 91 168 103 132 118 153 125 181 135 141 151 96 185 161 195 203 193 253 164 286
Polygon -2674135 true false 155 284 172 268 172 243 162 224 148 201 130 233 131 260 135 282

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

mortar pestle
false
0
Polygon -7500403 true true 60 150 30 150 30 165 45 165 45 195 60 225 90 255 150 270 210 255 240 225 255 195 255 165 270 165 270 150
Polygon -6459832 true false 75 150 30 105 15 105 15 90 45 60 60 60 60 75 150 150
Line -16777216 false 45 120 75 90
Line -16777216 false 105 150 125 128

orbit 6
true
0
Circle -7500403 true true 116 11 67
Circle -7500403 true true 26 176 67
Circle -7500403 true true 206 176 67
Circle -7500403 false true 45 45 210
Circle -7500403 true true 26 58 67
Circle -7500403 true true 206 58 67
Circle -7500403 true true 116 221 67

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

person soldier
false
0
Rectangle -7500403 true true 127 79 172 94
Polygon -10899396 true false 105 90 60 195 90 210 135 105
Polygon -10899396 true false 195 90 240 195 210 210 165 105
Circle -7500403 true true 110 5 80
Polygon -10899396 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Polygon -6459832 true false 120 90 105 90 180 195 180 165
Line -6459832 false 109 105 139 105
Line -6459832 false 122 125 151 117
Line -6459832 false 137 143 159 134
Line -6459832 false 158 179 181 158
Line -6459832 false 146 160 169 146
Rectangle -6459832 true false 120 193 180 201
Polygon -6459832 true false 122 4 107 16 102 39 105 53 148 34 192 27 189 17 172 2 145 0
Polygon -16777216 true false 183 90 240 15 247 22 193 90
Rectangle -6459832 true false 114 187 128 208
Rectangle -6459832 true false 177 187 191 208

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

pumpkin
false
0
Polygon -7500403 false true 148 30 107 33 74 44 33 58 15 105 0 150 30 240 105 285 135 285 150 270 165 285 195 285 255 255 300 150 268 62 225 43 196 36
Polygon -7500403 true true 33 58 0 150 30 240 105 285 135 285 150 270 165 285 195 285 255 255 300 150 268 62 226 43 194 36 148 32 105 35
Polygon -16777216 false false 108 40 75 57 42 101 32 177 79 253 124 285 133 285 147 268 122 222 103 176 107 131 122 86 140 52 154 42 193 66 204 101 216 158 212 209 188 256 164 278 163 283 196 285 234 255 257 199 268 137 251 84 229 52 191 41 163 38 151 41
Polygon -6459832 true false 133 50 171 50 167 32 155 15 146 2 117 10 126 23 130 33
Polygon -16777216 false false 117 10 127 26 129 35 132 49 170 49 168 32 154 14 145 1

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.2.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
