require 'ruby2d'

#x56
#y120

#850
#450
set background: '#000000'
set width: 1200
set height: 600
set title: 'Batalha Naval'

titulo = Image.new(
    'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\Titulo.png',
    x: 138, y: 50,

)

Image.new(
    'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\tela sprite.png',
    x:0,y:0,
    width: 1200, height: 600
)

menu_song = Music.new('D:\Computação\jogoBatalhaNaval\RUBY\sons\menu_drunken_sailor.mp3')
menu_song.volume = 50
menu_song.loop = true
menu_song.play

Botao_start = Image.new(
    'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botaoS.png',
    x: 445, y: 300,
    width:200 , height: 100
)

jogo_comecou = false
ativar8x12 = true
ativar10x15 = false


class Botao8x12
    def initialize
        @x = 165
        @y = 400
    end

    def draw
        @pressed = Image.new(
            'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botao8x12_press.png',
            x: @x, y: @y,
        )
        @released = Image.new(
            'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botao8x12_releas.png',
            x: @x, y: @y,
        )
        @released.remove()
    end

    def pressed
        @pressed
    end

    def released
        @released
    end
    
end

class Botao10x15
    def initialize
        @x = 715
        @y = 400
    end

    def draw
        @pressed = Image.new(
            'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botao10x15_press.png',
            x: @x, y: @y,
        )
        @released = Image.new(
            'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botao10x15_releas.png',
            x: @x, y: @y,
        )
        @pressed.remove()
    end

    def pressed
        @pressed
    end

    def released
        @released
    end
    
end


botao10x15 = Botao10x15.new
botao10x15.draw
botao8x12 = Botao8x12.new
botao8x12.draw

startSound = Sound.new('D:\Computação\jogoBatalhaNaval\RUBY\sons\start.mp3')
sizeChangeSound = Sound.new('D:\Computação\jogoBatalhaNaval\RUBY\sons\sizeChange.mp3')

navio_menu = Sprite.new(
    'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\navioMenu.png',
    x: 750,
    y: 260,
    width: 130,
    height: 130,
    clip_width: 32,
    time: 150,
    loop: true
)

navio_menu.play

on:mouse_down do |mouse_click|
    
    
        
  
    if Botao_start.contains? mouse_click.x,mouse_click.y
        startSound.play
        jogo_comecou = true
        sleep 0.4
        menu_song.stop

        if ativar8x12 == true
            exec( "ruby batalhaNaval8x12.rb" )
        else
            exec( "ruby batalhaNaval10x15.rb" )
        end
    end

    if botao10x15.released.contains? mouse_click.x,mouse_click.y
        botao10x15.released.remove()
        botao10x15.pressed.add()
        botao8x12.pressed.remove()
        botao8x12.released.add()
        ativar10x15 = true
        ativar8x12 = false
        startSound.play
    elsif botao8x12.released.contains? mouse_click.x,mouse_click.y
        botao8x12.released.remove()
        botao8x12.pressed.add()
        botao10x15.pressed.remove()
        botao10x15.released.add()
        ativar10x15 = false
        ativar8x12 = true
        startSound.play
    end      
    
    
 
end



show