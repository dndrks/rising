-- crow example 3
-- ii -> JF
--
-- connect JF via ii

m = require 'musicutil'

note = 1
scale = m.generate_scale(0,"minor",2)

function init()
  -- keep the line below only if you don't have a 
  -- powered busboard or teletype connected to your ii network
  crow.II.pullup(true)
  crow.II.jf.mode(1)
  screen.level(15)
  screen.aa(0)
  screen.line_width(1)
end

function redraw()
  screen.clear()
  screen.move(10,40)
  screen.text("note: "..note)
  screen.update()
end

function key(n,z)
  if n==2 and z==1 then
    note = note % (#scale) + 1
    crow.II.jf.play_note(scale[note]/12-1,math.random(5)+1)
    redraw()
  elseif n==3 and z==1 then
    note = math.random(#scale)
    crow.II.jf.play_note(scale[note]/12-1,math.random(5)+1)
    redraw()
  end
end 

