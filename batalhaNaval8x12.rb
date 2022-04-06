require 'ruby2d'



set background: '#000000'
set width: 1200
set height: 600
set title: 'Batalha Naval'

som_fundo = Music.new('D:\Computação\jogoBatalhaNaval\RUBY\sons\gaviota.mp3')
som_fundo.volume = 50
som_fundo.loop = true
som_fundo.play

$acertos_do_player = 0
$erros_do_player = 0

#Player---------------------------------------------------------------------------------------------------------------
Image.new(
    'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\tela sprite.png',
    x:0,y:0,
    width: 1200, height: 600
)

caixa_navios = Image.new(
    'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\quadrado_de_baixo.png',
    x: 130, y: 332,
    width: 620, height: 185

)

class Submarino
    def initialize(xa, ya)
        @x = xa
        @y = ya
        @quantidade = 4
        @estaVertical = true
        @selecionado = true
        @mostrarQuant = [
            Image.new('IBMsprites\quantBarcos\0.png',x: @x + 35, y: @y),
            Image.new('IBMsprites\quantBarcos\1.png',x: @x + 35, y: @y),
            Image.new('IBMsprites\quantBarcos\2.png',x: @x + 35, y: @y),
            Image.new('IBMsprites\quantBarcos\3.png',x: @x + 35, y: @y),
            Image.new('IBMsprites\quantBarcos\4.png',x: @x + 35, y: @y),
        ]
        @mostrarQuant[0].remove()
        @mostrarQuant[1].remove()
        @mostrarQuant[2].remove()
        @mostrarQuant[3].remove()
    end

    def draw
        @vertical = Image.new(
            'IBMsprites\navios\submarino\submarino_vertical.png',
            x: @x, y: @y,
        )
        @horizontal = Image.new(
            'IBMsprites\navios\submarino\submarino_horizontal.png',
            x: @x - 30, y: @y+40,
        )
        @verticalReleased = Image.new(
            'IBMsprites\navios\submarino\submarino_vertical_released.png',
            x: @x, y: @y,
        )
        @horizontalReleased = Image.new(
            'IBMsprites\navios\submarino\submarino_horizontal_released.png',
            x: @x - 30, y: @y+40,
        )
        @horizontal.remove()
        @verticalReleased.remove()
        @horizontalReleased.remove()
    end

    def clicado(x,y)
        if @horizontal.contains?(x,y)
            true
        elsif @vertical.contains?(x,y)
            true
        elsif @verticalReleased.contains?(x,y)
            true
        elsif @horizontalReleased.contains?(x,y)
            true
        else
            false
        end
    end
    
    def definirSelecionado(opcao)
        @selecionado = opcao
    end

    def  mostrarQuant
        @mostrarQuant
    end

    def diminuirMostrarQuant
        @mostrarQuant[@quantidade].remove()
        @mostrarQuant[@quantidade-1].add()
    end

    def quantidade
        @quantidade
    end

    def diminuirQuant
        @quantidade -= 1
    end

    def selecionado
        @selecionado
    end

    def verticalReleased
        @verticalReleased
    end

    def horizontalReleased
        @horizontalReleased
    end

    def definirEstaVertical(flag)
        @estaVertical = flag
    end

    def estaVertical
        @estaVertical
    end

    def vertical
        @vertical
    end

    def horizontal
        @horizontal
    end

end

class Contratorpedeiro
    def initialize(xa, ya)
        @x = xa
        @y = ya
        @quantidade = 3
        @estaVertical = true
        @selecionado = false
        @mostrarQuant = [
            Image.new('IBMsprites\quantBarcos\0.png',x: @x + 35, y: @y),
            Image.new('IBMsprites\quantBarcos\1.png',x: @x + 35, y: @y),
            Image.new('IBMsprites\quantBarcos\2.png',x: @x + 35, y: @y),
            Image.new('IBMsprites\quantBarcos\3.png',x: @x + 35, y: @y),
        ]
        @mostrarQuant[0].remove()
        @mostrarQuant[1].remove()
        @mostrarQuant[2].remove()
    end

    def draw
        @vertical = Image.new(
            'IBMsprites\navios\contratorpedeiro\contratorpedeiro_vertical.png',
            x: @x, y: @y,
        )
        @horizontal = Image.new(
            'IBMsprites\navios\contratorpedeiro\contratorpedeiro_horizontal.png',
            x: @x - 24, y: @y+42,
        )
        @verticalReleased = Image.new(
            'IBMsprites\navios\contratorpedeiro\contratorpedeiro_vertical_released.png',
            x: @x, y: @y,
        )
        @horizontalReleased = Image.new(
            'IBMsprites\navios\contratorpedeiro\contratorpedeiro_horizontal_released.png',
            x: @x - 24, y: @y+42,
        )
        @horizontal.remove()
        @vertical.remove()
        @horizontalReleased.remove()
    end

    def clicado(x,y)
        if @horizontal.contains?(x,y)
            true
        elsif @vertical.contains?(x,y)
            true
        elsif @verticalReleased.contains?(x,y)
            true
        elsif @horizontalReleased.contains?(x,y)
            true
        else
            false
        end
    end

    def  mostrarQuant
        @mostrarQuant
    end

    def diminuirMostrarQuant
        @mostrarQuant[@quantidade].remove()
        @mostrarQuant[@quantidade-1].add()
    end

    def quantidade
        @quantidade
    end

    def diminuirQuant
        @quantidade -= 1
    end
    
    def definirSelecionado(opcao)
        @selecionado = opcao
    end

    def selecionado
        @selecionado
    end

    def verticalReleased
        @verticalReleased
    end

    def horizontalReleased
        @horizontalReleased
    end

    def definirEstaVertical(flag)
        @estaVertical = flag
    end

    def estaVertical
        @estaVertical
    end

    def vertical
        @vertical
    end

    def horizontal
        @horizontal
    end

end

class NavioTanque
    def initialize(xa, ya)
        @x = xa
        @y = ya
        @quantidade = 2
        @estaVertical = true
        @selecionado = false
        @mostrarQuant = [
            Image.new('IBMsprites\quantBarcos\0.png',x: @x + 37, y: @y),
            Image.new('IBMsprites\quantBarcos\1.png',x: @x + 37, y: @y),
            Image.new('IBMsprites\quantBarcos\2.png',x: @x + 37, y: @y),
        ]
        @mostrarQuant[0].remove()
        @mostrarQuant[1].remove()
    end

    def draw
        @vertical = Image.new(
            'IBMsprites\navios\tanque\navio_tanque_vertical.png',
            x: @x, y: @y,
        )
        @horizontal = Image.new(
            'IBMsprites\navios\tanque\navio_tanque_horizontal.png',
            x: @x - 24, y: @y  + 40,
        )
        @verticalReleased = Image.new(
            'IBMsprites\navios\tanque\navio_tanque_vertical_released.png',
            x: @x, y: @y,
        )
        @horizontalReleased = Image.new(
            'IBMsprites\navios\tanque\navio_tanque_horizontal_released.png',
            x: @x - 24, y: @y  + 40,
        )
        @horizontal.remove()
        @vertical.remove()
        @horizontalReleased.remove()
    end

    def clicado(x,y)
        if @horizontal.contains?(x,y)
            true
        elsif @vertical.contains?(x,y)
            true
        elsif @verticalReleased.contains?(x,y)
            true
        elsif @horizontalReleased.contains?(x,y)
            true
        else
            false
        end
    end

    def  mostrarQuant
        @mostrarQuant
    end

    def diminuirMostrarQuant
        @mostrarQuant[@quantidade].remove()
        @mostrarQuant[@quantidade-1].add()
    end

    def quantidade
        @quantidade
    end

    def diminuirQuant
        @quantidade -= 1
    end

    def selecionado
        @selecionado
    end

    def definirSelecionado(opcao)
        @selecionado = opcao
    end

    def verticalReleased
        @verticalReleased
    end

    def horizontalReleased
        @horizontalReleased
    end

    def definirEstaVertical(flag)
        @estaVertical = flag
    end

    def estaVertical
        @estaVertical
    end

    def vertical
        @vertical
    end

    def horizontal
        @horizontal
    end

end

class PortaAvioes
    def initialize(xa, ya)
        @x = xa
        @y = ya
        @quantidade = 1
        @estaVertical = true
        @selecionado = false
        @mostrarQuant = [
            Image.new('IBMsprites\quantBarcos\0.png',x: @x + 40, y: @y + 20),
            Image.new('IBMsprites\quantBarcos\1.png',x: @x + 40, y: @y + 20),
        ]
        @mostrarQuant[0].remove()
    end

    def draw
        @vertical = Image.new(
            'IBMsprites\navios\portaavioes\porta_avioes_vertical.png',
            x: @x, y: @y,
        )
        @horizontal = Image.new(
            'IBMsprites\navios\portaavioes\porta_avioes_horizontal2.png',
            x: @x - 20, y: @y + 60,
        )
        @verticalReleased = Image.new(
            'IBMsprites\navios\portaavioes\porta_avioes_vertical_released.png',
            x: @x, y: @y,
        )
        @horizontalReleased = Image.new(
            'IBMsprites\navios\portaavioes\porta_avioes_horizontal_released.png',
            x: @x - 20, y: @y + 60,
        )
        @horizontal.remove()
        @vertical.remove()
        @horizontalReleased.remove()
    end

    def clicado(x,y)
        if @horizontal.contains?(x,y)
            true
        elsif @vertical.contains?(x,y)
            true
        elsif @verticalReleased.contains?(x,y)
            true
        elsif @horizontalReleased.contains?(x,y)
            true
        else
            false
        end
    end

    def  mostrarQuant
        @mostrarQuant
    end

    def diminuirMostrarQuant
        @mostrarQuant[@quantidade].remove()
        @mostrarQuant[@quantidade-1].add()
    end

    def quantidade
        @quantidade
    end

    def diminuirQuant
        @quantidade -= 1
    end

    def definirSelecionado(opcao)
        @selecionado = opcao
    end

    def selecionado
        @selecionado
    end

    def verticalReleased
        @verticalReleased
    end

    def horizontalReleased
        @horizontalReleased
    end


    def definirEstaVertical(flag)
        @estaVertical = flag
    end

    def estaVertical
        @estaVertical
    end

    def vertical
        @vertical
    end

    def horizontal
        @horizontal
    end

end

portaAvioesTemplate = PortaAvioes.new(580,342)
portaAvioesTemplate.draw
navioTanqueTemplate = NavioTanque.new(410,360)
navioTanqueTemplate.draw
contratorpedeiroTemplate = Contratorpedeiro.new(282, 360)
contratorpedeiroTemplate.draw
submarinoTemplate = Submarino.new(194, 360)
submarinoTemplate.draw


#x56
#y120


$fileira = 1
$x_quadrados = 15 + 120
$y_quadrados = 20 + 56 


class Explosao_barco
    def initialize(x,y)
        @x = x - 8
        @y = y - 42
    end

    def play_exp
     
        exp = Sprite.new(
            'IBMsprites\explosao_barco.png',
            x: @x,
            y: @y,
            clip_width: 32,
            time: 60,
        )

        exp.play
       
        
    end
end

class Explosao_agua
    def initialize(x,y)
        @x = x - 16
        @y = y - 16
    end

    def play_exp
        
        exp = Sprite.new(
            'D:\Computação\jogoBatalhaNaval\RUBY\sprites\explosão_água.png',
            x: @x,
            y: @y,
            clip_width: 32,
            time: 60,
          )
        exp.play
        
    end

end



class Quadrado_player
    def initialize
        @x = $x_quadrados
        @y = $y_quadrados
        $fileira += 1
        $x_quadrados += 32
        if $fileira == 13
            $x_quadrados = 15 + 120
            $y_quadrados += 32
            $fileira = 1
        end
    end

    def y
        @y
    end

    def x
        @x
    end

    def draw
        @imagem = Image.new('D:\Computação\jogoBatalhaNaval\RUBY\sprites\quadrado3.png',x: @x,y:@y,)
    end

    def imagem
        @imagem
    end
end

#142

$fileiraE = 1
$x_quadradosE = 545
$y_quadradosE = 20 + 56 


#Ligth Buton-----------------------------------------------------------------------------------------------------------

class Ligth_button

    def initialize(x,y)
        @x = x
        @y = y
        @desligado = Image.new('IBMsprites\turn_ligth_off.png',x: @x,y:@y,)
        @jogador =  Image.new('IBMsprites\turn_ligth_green.png',x: @x,y:@y,)
        @inimigo =  Image.new('IBMsprites\turn_ligth_red.png',x: @x,y:@y,)
        @jogador.remove()
        @inimigo.remove()
    end

    def turn_jogador
        @desligado.remove()
        @inimigo.remove()
        @jogador.add()
    end

    def turn_inimigo
        @desligado.remove()
        @jogador.remove()
        @inimigo.add()
    end

    def jogador
        @jogador
    end

    def y
        @y
    end

    def x
        @x
    end



end


# Inimigos -------------------------------------------------------------------------------------------------------------

class Quadrado_cobertura
    def initialize(x,y)
        @x = x
        @y = y
    end

    def y
        @y
    end

    def x
        @x
    end

    def draw
        @imagem = Image.new('IBMsprites\cobertura.png',x: @x,y:@y,)
    end

    def remove
        @imagem.remove()
    end

    def imagem
        @imagem
    end
end

class Quadrado_enemy
    def initialize
        @x = $x_quadradosE
        @y = $y_quadradosE
        $fileiraE += 1
        $x_quadradosE += 32
        if $fileiraE == 13
            $x_quadradosE = 545
            $y_quadradosE += 32
            $fileiraE = 1
        end
    end

    def y
        @y
    end

    def x
        @x
    end

    def draw
        @imagem = Image.new('D:\Computação\jogoBatalhaNaval\RUBY\sprites\quadrado3.png',x: @x,y:@y,)
    end

    def imagem
        @imagem
    end
end


$quadrados_enemy = Array.new(96){Quadrado_enemy.new}
$quadrados_enemy.each do |box|
    box.draw
end

#----------------------------------------------------------------------------------------------------------------------

$quadrados_player = Array.new(96){Quadrado_player.new}
$quadrados_player.each do |box|
    box.draw
end

startSound = Sound.new('D:\Computação\jogoBatalhaNaval\RUBY\sons\start.mp3')


class BotaoStart
    def initialize
        @x = 782
        @y = 345
    end

    def draw
        @pressed = Image.new(
            'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botaoSpressed.png',
            x: @x, y: @y,
            width: 120, height: 40,
        )
        @released = Image.new(
            'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botaoS.png',
            x: @x, y: @y,
            width: 120, height: 40,
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

class Bomba
    def initialize(x,y)
        @x = x
        @y = y
        @imagem = Sprite.new(
            'IBMsprites\bomba.png',
            x: @x,
            y: @y,
            clip_width: 32,
            time: 60,
            loop: true
        )
        @imagem.play
    end

    def x
        @x
    end

    def y
        @y
    end

    def imagem
        @imagem
    end

    def remove
        @imagem.remove
    end
end

class BotaoAtomic
    def initialize
        @x = 782
        @y = 385
    end

    def draw
        @pressed = Image.new(
            'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botaoAtomicPress.png',
            x: @x, y: @y,
            width: 120, height: 40,
        )
        @released = Image.new(
            'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botaoAtomicReleas.png',
            x: @x, y: @y,
            width: 120, height: 40,
        )
        @pressed.remove()
    end

    def ligar
        @pressed.remove()
        @released.add
    end

    def desligar
        @released.remove()
        @pressed.add
    end

    def pressed
        @pressed
    end

    def released
        @released
    end
    
end

btRotate = Image.new(
'D:\Computação\jogoBatalhaNaval\RUBY\IBMsprites\botaoRotate.png',
x: 782, y: 430,
width: 120, height: 40,
)
  
bt_start = BotaoStart.new
bt_start.draw
bt_atomic = BotaoAtomic.new
bt_atomic.draw



def apagar_barco(barco)
    if barco.estaVertical == true
        barco.vertical.remove()
        barco.verticalReleased.add()
    else
        barco.horizontal.remove()
        barco.horizontalReleased.add()
    end
end

def roatacionar_barco(barco)
    if barco.estaVertical == true
        barco.vertical.remove()
        barco.horizontal.add()
        barco.definirEstaVertical(false)
    else
        barco.vertical.add()
        barco.horizontal.remove()
        barco.definirEstaVertical(true)
    end
end

def acender_barco(barco)
    if barco.estaVertical == true
        barco.verticalReleased.remove()
        barco.vertical.add()
    else
        barco.horizontalReleased.remove()
        barco.horizontal.add()
    end
end

$box_expl_player = []
qunt_box_expl_player = 0
box_expl_inimigo = []
qunt_box_expl_inimigo = 0

$error = Sound.new('sons\error.mp3')

def check_disponibilidade_posicionar_barco(quadrado, tipo, v_h)
    if v_h == "vertical"
        if tipo == "submarino"
            if $box_expl_player.include? quadrado + 12
                return false
            else
                return true
            end
        elsif tipo =="contratorpedeiro"
            if $box_expl_player.include? quadrado + 12
                return false
            elsif $box_expl_player.include? quadrado + 24
                return false
            else
                return true
            end
        elsif tipo == "tank"
            if $box_expl_player.include? quadrado + 12
                return false
            elsif $box_expl_player.include? quadrado + 24
                return false
            elsif $box_expl_player.include? quadrado + 36
                return false
            else
                return true
            end
        else
            if $box_expl_player.include? quadrado + 12
                return false
            elsif $box_expl_player.include? quadrado + 24
                return false
            elsif $box_expl_player.include? quadrado + 36
                return false
            elsif $box_expl_player.include? quadrado + 48
                return false
            else
                return true
            end
        end
    else
        if tipo == "submarino"
            if $box_expl_player.include? quadrado + 1
                return false
            else
                return true
            end
        elsif tipo =="contratorpedeiro"
            if $box_expl_player.include? quadrado + 1
                return false
            elsif $box_expl_player.include? quadrado + 2
                return false
            else
                return true
            end
        elsif tipo == "tank"
            if $box_expl_player.include? quadrado + 1
                return false
            elsif $box_expl_player.include? quadrado + 2
                return false
            elsif $box_expl_player.include? quadrado + 3
                return false
            else
                return true
            end
        else
            if $box_expl_player.include? quadrado + 1
                return false
            elsif $box_expl_player.include? quadrado + 2
                return false
            elsif $box_expl_player.include? quadrado + 3
                return false
            elsif $box_expl_player.include? quadrado + 4
                return false
            else
                return true
            end
        end
    end
end

def check_disponibilidade_outros_barcos(quadrado)

    if $box_expl_player.include? quadrado
        return false
    else
        return true
    end
end

def check_disponibilidade_solo(quadrado, tipo, v_h)

    submarino_horizontal_proibido = [12,24,36,48,60,72,84,96]
    submarino_vertical_proibido = [85,86,87,88,89,90,91,92,93,94,95,96]
    contraTorpedeiro_horizontal_proibido = [11,23,35,47,59,71,83,95]
    contraTorpedeiro_vertical_proibido = [73,74,75,76,77,78,79,80,81,82,83,84]
    navioTanque_horizontal_proibido = [10,22,34,46,58,70,82,94]
    navioTanque_vertical_proibido = [61,62,63,64,65,66,67,68,69,70,71,72]
    portAvioes_horizontal_proibido = [9,21,33,45,57,69,81,93]
    portAvioes_vertical_proibido = [49,50,51,52,53,54,55,56,57,58,59,60]

    if v_h == "vertical"
        if tipo == "submarino"
            if submarino_vertical_proibido.include? quadrado
                return false
            end
        end    
        if tipo == "contraTorpedeiro"
            if submarino_vertical_proibido.include? quadrado
                return false
            end
            if contraTorpedeiro_vertical_proibido.include? quadrado
                return false
            end
        end
        if tipo == "navioTanque"
            if submarino_vertical_proibido.include? quadrado
                return false
            end
            if contraTorpedeiro_vertical_proibido.include? quadrado
                return false
            end
            if navioTanque_vertical_proibido.include? quadrado
                return false
            end
        end
        if  tipo == "portaAvioes"
            if submarino_vertical_proibido.include? quadrado
                return false
            end
            if contraTorpedeiro_vertical_proibido.include? quadrado
                return false
            end
            if navioTanque_vertical_proibido.include? quadrado
                return false
            end
            if portAvioes_vertical_proibido.include? quadrado
                return false
            end
        end
    else
        if tipo == "submarino"
            if submarino_horizontal_proibido.include? quadrado
                return false
            end
        elsif tipo == "contraTorpedeiro"
            if submarino_horizontal_proibido.include? quadrado
                return false
            end
            if contraTorpedeiro_horizontal_proibido.include? quadrado
                return false
            end
        elsif tipo == "navioTanque"
            if submarino_horizontal_proibido.include? quadrado
                return false
            end
            if contraTorpedeiro_horizontal_proibido.include? quadrado
                return false
            end
            if navioTanque_horizontal_proibido.include? quadrado
                return false
            end
        else
            if submarino_horizontal_proibido.include? quadrado
                return false
            end
            if contraTorpedeiro_horizontal_proibido.include? quadrado
                return false
            end
            if navioTanque_horizontal_proibido.include? quadrado
                return false
            end
            if portAvioes_horizontal_proibido.include? quadrado
                return false
            end
        end
    end

    
    return true
end


class Barco_vermelho
    def initialize(x,y)
        @x = x
        @y = y
        @imagem = Image.new(
            'IBMsprites\acertou_barco.png',
            x: @x,
            y: @y,
        )
    end

    def x
        @x
    end

    def y
        @y
    end

    def imagem
        @imagem
    end

    def remove
        @imagem.remove()
    end
end


partida_inicio = false

$posicoes_submarinos = [["h",85],["v",58],["h",5],["v",3],["h",31]]
$posicoes_contra_torpedeiro=[["v",38],["h",10],["h",91],["v",35]]
$posicoes_navio_tanque=[["h",65],["h",18],["v",1]]
$posicoes_porta_avioes = [["h",41],["h",74],["v",48],["V",16]]
$quadrados_preenchidos = []

$quadrados_cobertura = []


#AQUI-------------------------------------------------------------------------------------------------------------------
$submarinos_colocados = [[],[],[],[]]
$contra_torpedeiros_colocados =[[],[],[]]
$tanques_colocados = [[],[]]
$porta_avioes = []

$quadrados_navios_acertados = []

def colocar_barcos_inimigo()


    #colocar submarinos
    for a in 0..3 do
        quant_submarinos = $posicoes_submarinos.length
        tirar_barco = rand 0..(quant_submarinos - 1)
        tupla_barco = $posicoes_submarinos.drop(tirar_barco)
        $posicoes_submarinos.delete_at(tirar_barco)
        x_barco = 0
        y_barco = 0
        $quadrados_preenchidos.push(tupla_barco[0][1])
        $submarinos_colocados[a].push(tupla_barco[0][1])
        quadrado = 0
        $quadrados_enemy.each do |box|
            quadrado+=1
            
            if tupla_barco[0][1] == quadrado
                x_barco = box.x
                y_barco = box.y
            end
        end
        if tupla_barco[0][0]=="h"
            
            Image.new(
                'IBMsprites\navios\submarino\submarino_horizontal.png',
                x: x_barco, y: y_barco,
            )
            $quadrados_preenchidos.push(tupla_barco[0][1]+1)
            $submarinos_colocados[a].push(tupla_barco[0][1] + 1)
        else
            Image.new(
                'IBMsprites\navios\submarino\submarino_vertical.png',
                x: x_barco, y: y_barco,
            )
            $quadrados_preenchidos.push(tupla_barco[0][1]+12)
            $submarinos_colocados[a].push(tupla_barco[0][1] + 12)
        end
    end

    
     #colocar contraTorpedeiros
     for a in 0..2 do
        quant_contra_torp = $posicoes_contra_torpedeiro.length
        tirar_barco = rand 0..(quant_contra_torp - 1)
        tupla_barco = $posicoes_contra_torpedeiro.drop(tirar_barco)
        $posicoes_contra_torpedeiro.delete_at(tirar_barco)
        x_barco = 0
        y_barco = 0
        $quadrados_preenchidos.push(tupla_barco[0][1])
        $contra_torpedeiros_colocados[a].push(tupla_barco[0][1])
        quadrado = 0
        $quadrados_enemy.each do |box|
            quadrado+=1
            
            if tupla_barco[0][1] == quadrado
                x_barco = box.x
                y_barco = box.y
            end
        end
        if tupla_barco[0][0]=="h"

            Image.new(
                'IBMsprites\navios\contratorpedeiro\contratorpedeiro_horizontal.png',
                x: x_barco, y: y_barco,
            )
            $quadrados_preenchidos.push(tupla_barco[0][1]+1)
            $quadrados_preenchidos.push(tupla_barco[0][1]+2)

            $contra_torpedeiros_colocados[a].push(tupla_barco[0][1] + 1)
            $contra_torpedeiros_colocados[a].push(tupla_barco[0][1] + 2)
        else
            Image.new(
                'IBMsprites\navios\contratorpedeiro\contratorpedeiro_vertical.png',
                x: x_barco, y: y_barco,
            )
            $quadrados_preenchidos.push(tupla_barco[0][1]+12)
            $quadrados_preenchidos.push(tupla_barco[0][1]+24)

            $contra_torpedeiros_colocados[a].push(tupla_barco[0][1] + 12)
            $contra_torpedeiros_colocados[a].push(tupla_barco[0][1] + 24)
        end
    end

    #colocar navios tanque
    for a in 0..1 do
        quant_tank = $posicoes_navio_tanque.length
        tirar_barco = rand 0..(quant_tank - 1)
        tupla_barco = $posicoes_navio_tanque.drop(tirar_barco)
        $posicoes_navio_tanque.delete_at(tirar_barco)
        x_barco = 0
        y_barco = 0
        $quadrados_preenchidos.push(tupla_barco[0][1])
        $tanques_colocados[a].push(tupla_barco[0][1])
        quadrado = 0
        $quadrados_enemy.each do |box|
            quadrado+=1
            
            if tupla_barco[0][1] == quadrado
                x_barco = box.x
                y_barco = box.y
            end
        end
        if tupla_barco[0][0]=="h"
            
            Image.new(
                'IBMsprites\navios\tanque\navio_tanque_horizontal.png',
                x: x_barco, y: y_barco,
            )
            $quadrados_preenchidos.push(tupla_barco[0][1]+1)
            $quadrados_preenchidos.push(tupla_barco[0][1]+2)
            $quadrados_preenchidos.push(tupla_barco[0][1]+3)

            $tanques_colocados[a].push(tupla_barco[0][1]+1)
            $tanques_colocados[a].push(tupla_barco[0][1]+2)
            $tanques_colocados[a].push(tupla_barco[0][1]+3)
        else
            Image.new(
                'IBMsprites\navios\tanque\navio_tanque_vertical.png',
                x: x_barco, y: y_barco,
            )
            $quadrados_preenchidos.push(tupla_barco[0][1]+12)
            $quadrados_preenchidos.push(tupla_barco[0][1]+24)
            $quadrados_preenchidos.push(tupla_barco[0][1]+36)

            $tanques_colocados[a].push(tupla_barco[0][1]+12)
            $tanques_colocados[a].push(tupla_barco[0][1]+24)
            $tanques_colocados[a].push(tupla_barco[0][1]+36)
        end
    end

    #colocar Portavioes
    quant_port_avioes = $posicoes_porta_avioes.length
    tirar_barco = rand 0..(quant_port_avioes - 1)
    tupla_barco = $posicoes_porta_avioes.drop(tirar_barco)
    $posicoes_porta_avioes.delete_at(tirar_barco)
    x_barco = 0
    y_barco = 0
    $quadrados_preenchidos.push(tupla_barco[0][1])
    $porta_avioes.push(tupla_barco[0][1])
    quadrado = 0
    $quadrados_enemy.each do |box|
        quadrado+=1
        
        if tupla_barco[0][1] == quadrado
            x_barco = box.x
            y_barco = box.y
        end
    end
    if tupla_barco[0][0]=="h"
        
        Image.new(
            'IBMsprites\navios\portaavioes\porta_avioes_horizontal2.png',
            x: x_barco, y: y_barco,
        )
        $quadrados_preenchidos.push(tupla_barco[0][1]+1)
        $quadrados_preenchidos.push(tupla_barco[0][1]+2)
        $quadrados_preenchidos.push(tupla_barco[0][1]+3)
        $quadrados_preenchidos.push(tupla_barco[0][1]+4)

        $porta_avioes.push(tupla_barco[0][1] + 1)
        $porta_avioes.push(tupla_barco[0][1] + 2)
        $porta_avioes.push(tupla_barco[0][1] + 3)
        $porta_avioes.push(tupla_barco[0][1] + 4)
    else
        Image.new(
            'IBMsprites\navios\portaavioes\porta_avioes_vertical.png',
            x: x_barco, y: y_barco,
        )
        $quadrados_preenchidos.push(tupla_barco[0][1]+12)
        $quadrados_preenchidos.push(tupla_barco[0][1]+24)
        $quadrados_preenchidos.push(tupla_barco[0][1]+36)
        $quadrados_preenchidos.push(tupla_barco[0][1]+48)

        $porta_avioes.push(tupla_barco[0][1] + 12)
        $porta_avioes.push(tupla_barco[0][1] + 24)
        $porta_avioes.push(tupla_barco[0][1] + 36)
        $porta_avioes.push(tupla_barco[0][1] + 48)
    end
#-------------

    $quadrados_preenchidos.each do |box|

        quad_preench = 0
        $quadrados_enemy.each do |box2|
            quad_preench += 1
            if box == quad_preench
                $quadrados_cobertura.push(Quadrado_cobertura.new(box2.x,box2.y))
            end
        end
    end

    $quadrados_cobertura.each do |box|
        box.draw
    end
end

$jogador_joga = true

$turn_botao = Ligth_button.new(910,345)
$tiros_jogador = 3


lista_bombas = []
posicoes_ja_jogadas = []
barcos_acertados = []


#OPA -----------------------------------------------------------------------------------------------------------------
$barcos_inimigos_destruidos = 0
$barcos_amigos_destruidos = 0

$porta_avioes_destruido = false
$fim_de_jogo = false
def checar_barco_inimigo_destruido

    #submarino_________________________________________________________________________________________________
    if $submarinos_colocados.length() > 0
        sub_pos_apag = 0
        apagar = -1
        $submarinos_colocados.each do |sub|
            acertados = 0
            sub.each do |pos|
                quadrado = 0
                $quadrados_enemy.each do |box|
                    quadrado += 1
                    if pos == quadrado
                        $quadrados_navios_acertados.each do |acertado|
                            if box.x == acertado.x && box.y == acertado.y
                                acertados+=1
                            end
                        end
                    end
                end
            end
            #quadrados_navios_acertados
            if acertados == 2
                sub.each do |pos|
                    quadrado = 0
                    $quadrados_enemy.each do |box|
                        quadrado += 1
                        if pos == quadrado
                            $quadrados_navios_acertados.each do |acertado|
                                if box.x == acertado.x && box.y == acertado.y

                                    acertado.remove
                                end
                            end
                            $quadrados_cobertura.each do |cob|
                                if box.x == cob.x && box.y == cob.y
                                    cob.remove

                                    apagar = sub_pos_apag

                                    exp = Explosao_barco.new(box.x,box.y)
                                    exp.play_exp
                                    
                                    splash= Sound.new('sons\explosion.mp3')
                                    splash.play


                                end
                            end
                        end
                    end
                end
            end
            sub_pos_apag += 1
        end

        if apagar != -1
            $submarinos_colocados.delete_at(apagar)
            $barcos_inimigos_destruidos +=1
        end
        
    end

    #contra-torpedeiro_________________________________________________________
    if $contra_torpedeiros_colocados.length() > 0
        contratorp_pos_apagar = 0
        apagar = -1
        $contra_torpedeiros_colocados.each do |sub|
            acertados = 0
            sub.each do |pos|
                quadrado = 0
                $quadrados_enemy.each do |box|
                    quadrado += 1
                    if pos == quadrado
                        $quadrados_navios_acertados.each do |acertado|
                            if box.x == acertado.x && box.y == acertado.y
                                acertados+=1
                            end
                        end
                    end
                end
            end
            #quadrados_navios_acertados
            if acertados == 3
                sub.each do |pos|
                    quadrado = 0
                    $quadrados_enemy.each do |box|
                        quadrado += 1
                        if pos == quadrado
                            $quadrados_navios_acertados.each do |acertado|
                                if box.x == acertado.x && box.y == acertado.y

                                    acertado.remove
                                end
                            end
                            $quadrados_cobertura.each do |cob|
                                if box.x == cob.x && box.y == cob.y
                                    cob.remove

                                    apagar = contratorp_pos_apagar

                                    exp = Explosao_barco.new(box.x,box.y)
                                    exp.play_exp
                                    
                                    splash= Sound.new('sons\explosion.mp3')
                                    splash.play


                                end
                            end
                        end
                    end
                end
            end
            contratorp_pos_apagar += 1
        end

        if apagar != -1
            $contra_torpedeiros_colocados.delete_at(apagar)
            $barcos_inimigos_destruidos +=1
        end
        
    end

    #navio_tanque_________________________________________________________
    if $tanques_colocados.length() > 0
        tank_pos_apagar = 0
        apagar = -1
        $tanques_colocados.each do |sub|
            acertados = 0
            sub.each do |pos|
                quadrado = 0
                $quadrados_enemy.each do |box|
                    quadrado += 1
                    if pos == quadrado
                        $quadrados_navios_acertados.each do |acertado|
                            if box.x == acertado.x && box.y == acertado.y
                                acertados+=1
                            end
                        end
                    end
                end
            end
            #quadrados_navios_acertados
            if acertados == 4
                sub.each do |pos|
                    quadrado = 0
                    $quadrados_enemy.each do |box|
                        quadrado += 1
                        if pos == quadrado
                            $quadrados_navios_acertados.each do |acertado|
                                if box.x == acertado.x && box.y == acertado.y

                                    acertado.remove
                                end
                            end
                            $quadrados_cobertura.each do |cob|
                                if box.x == cob.x && box.y == cob.y
                                    cob.remove

                                    apagar = tank_pos_apagar

                                    exp = Explosao_barco.new(box.x,box.y)
                                    exp.play_exp
                                    
                                    splash= Sound.new('sons\explosion.mp3')
                                    splash.play


                                end
                            end
                        end
                    end
                end
            end
            tank_pos_apagar += 1
        end

        if apagar != -1
            $tanques_colocados.delete_at(apagar)
            $barcos_inimigos_destruidos +=1
        end
        
    end

    #porta_Avioes_________________________________________________________
    if $porta_avioes_destruido == false
        acertados = 0
        $porta_avioes.each do |pos|
            quadrado = 0
            $quadrados_enemy.each do |box|
                quadrado += 1
                if pos == quadrado
                    $quadrados_navios_acertados.each do |acertado|
                        if box.x == acertado.x && box.y == acertado.y
                            acertados+=1
                        end
                    end
                end
            end
        end
        #quadrados_navios_acertados
        if acertados == 5
            $porta_avioes_destruido = true
            $porta_avioes.each do |pos|
                quadrado = 0
                $quadrados_enemy.each do |box|
                    quadrado += 1
                    if pos == quadrado
                        $quadrados_navios_acertados.each do |acertado|
                            if box.x == acertado.x && box.y == acertado.y

                                acertado.remove
                            end
                        end
                        $quadrados_cobertura.each do |cob|
                            if box.x == cob.x && box.y == cob.y
                                cob.remove

                                exp = Explosao_barco.new(box.x,box.y)
                                exp.play_exp
                                
                                splash= Sound.new('sons\explosion.mp3')
                                splash.play


                            end
                        end
                    end
                end
            end
            $barcos_inimigos_destruidos +=1
        end
    end

    if $barcos_inimigos_destruidos == 10
        $fim_de_jogo = true
        you_win = Sprite.new(
            'IBMsprites\youwin.png',
            x: 250,
            y: 50,
            clip_width: 600,
            time: 240,
            loop: true
        )
        you_win.z = 1
        you_win.play()
    end
    
    
end

$pimeira_serie_de_tiros = true

$tiros_ja_disparados = [] #---tiros
$tiros_inimigos_acertados = []
$quadrados_inimigos_acertados = []

#-----------------------------------------------------------------------------vex_do_computador



def tiros_aleatorios
    for a in 1..3 do
        tiro  = rand(1...96)
        while $tiros_ja_disparados.include? tiro
            tiro  = rand(1...96)
        end
        $tiros_ja_disparados.push(tiro)
        puts tiro
        
        quadrados = 0
        $quadrados_player.each do |quad|
            quadrados += 1
            if tiro == quadrados
                
                if $box_expl_player.include? tiro
                    $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                    $quadrados_inimigos_acertados.push(tiro)
                    $quadrados_inimigos_destruidos += 1
                    puts "     acertou"
                else
                    Image.new(
                        'IBMsprites\acertou_a_agua.png',
                        x: quad.x, y: quad.y,
                    )
                    puts "     errou"
                end
            end
        end

    end
    puts "Aleatórios________________________________________"
end

$andar_pelos_quadrados = 0
$primeiro_tiro = true


$quadrados_inimigos_destruidos = 0

$tiros_apeloes = [rand(1...3),rand(5...8)]
$checando_apelao = 0
$tiro_aleatorio = false

def tiro_apelao_inimigo
    atirar_no_quadrado = rand(1...96)
    while $tiros_ja_disparados.include? atirar_no_quadrado
        atirar_no_quadrado = rand(1...96)
    end

    quadrados = 0
    $quadrados_player.each do |quad|
        quadrados += 1
        if atirar_no_quadrado == quadrados
            $tiros_ja_disparados.push(atirar_no_quadrado)
            if $box_expl_player.include? atirar_no_quadrado
                $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                $quadrados_inimigos_acertados.push(atirar_no_quadrado)
                $quadrados_inimigos_destruidos +=1
            else
                Image.new(
                    'IBMsprites\acertou_a_agua.png',
                    x: quad.x, y: quad.y,
                )
            end 
        end
    end

    esquerda_proibida = [1,13,25,37,49,61,73,85]
    direita_proibida = [12,24,36,48,60,72,84,96]
    cima_proibido = [1,2,3,4,5,6,7,8,9,10,11,12]
    baixo_proibida = [85,86,87,88,89,90,91,92,93,94,95,96]
    
    if !(esquerda_proibida.include? atirar_no_quadrado)
        esqu = atirar_no_quadrado - 1
        if !($tiros_ja_disparados.include? esqu)
            quadrados = 0
            $quadrados_player.each do |quad|
                quadrados += 1
                if esqu == quadrados
                    $tiros_ja_disparados.push(esqu)
                    if $box_expl_player.include? esqu
                        $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                        $quadrados_inimigos_acertados.push(esqu)
                        $quadrados_inimigos_destruidos +=1
                    else
                        Image.new(
                            'IBMsprites\acertou_a_agua.png',
                            x: quad.x, y: quad.y,
                        )
                    end 
                end
            end
        end
    end
    if !(direita_proibida.include? atirar_no_quadrado)
        dire = atirar_no_quadrado + 1
        if !($tiros_ja_disparados.include? dire)
            quadrados = 0
            $quadrados_player.each do |quad|
                quadrados += 1
                if dire == quadrados
                    $tiros_ja_disparados.push(dire)
                    if $box_expl_player.include? dire
                        $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                        $quadrados_inimigos_acertados.push(dire)
                        $quadrados_inimigos_destruidos +=1
                    else
                        Image.new(
                            'IBMsprites\acertou_a_agua.png',
                            x: quad.x, y: quad.y,
                        )
                    end 
                end
            end
        end
    end
    if !(cima_proibido.include? atirar_no_quadrado)
        cima = atirar_no_quadrado+12
        if !($tiros_ja_disparados.include? cima)
            quadrados = 0
            $quadrados_player.each do |quad|
                quadrados += 1
                if cima == quadrados
                    $tiros_ja_disparados.push(cima)
                    if $box_expl_player.include? cima
                        $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                        $quadrados_inimigos_acertados.push(cima)
                        $quadrados_inimigos_destruidos +=1
                    else
                        Image.new(
                            'IBMsprites\acertou_a_agua.png',
                            x: quad.x, y: quad.y,
                        )
                    end 
                end
            end
        end
    end
    if !(baixo_proibida.include? atirar_no_quadrado)
        baixo = atirar_no_quadrado - 12
        if !($tiros_ja_disparados.include? baixo)
            quadrados = 0
            $quadrados_player.each do |quad|
                quadrados += 1
                if baixo == quadrados
                    $tiros_ja_disparados.push(baixo)
                    if $box_expl_player.include? baixo
                        $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                        $quadrados_inimigos_acertados.push(baixo)
                        $quadrados_inimigos_destruidos +=1
                    else
                        Image.new(
                            'IBMsprites\acertou_a_agua.png',
                            x: quad.x, y: quad.y,
                        )
                    end 
                end
            end
        end
    end
    if !(baixo_proibida.include? atirar_no_quadrado) &&  !(esquerda_proibida.include? atirar_no_quadrado)
        infesq = atirar_no_quadrado + 12 - 1
        if !($tiros_ja_disparados.include? infesq)
            quadrados = 0
            $quadrados_player.each do |quad|
                quadrados += 1
                if infesq == quadrados
                    $tiros_ja_disparados.push(infesq)
                    if $box_expl_player.include? infesq
                        $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                        $quadrados_inimigos_acertados.push(infesq)
                        $quadrados_inimigos_destruidos +=1
                    else
                        Image.new(
                            'IBMsprites\acertou_a_agua.png',
                            x: quad.x, y: quad.y,
                        )
                    end 
                end
            end
        end
    end
    if !(baixo_proibida.include? atirar_no_quadrado) &&  !(direita_proibida.include? atirar_no_quadrado)
        infdir = atirar_no_quadrado + 12 + 1
        if !($tiros_ja_disparados.include? infdir)
            quadrados = 0
            $quadrados_player.each do |quad|
                quadrados += 1
                if infdir == quadrados
                    $tiros_ja_disparados.push(infdir)
                    if $box_expl_player.include? infdir
                        $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                        $quadrados_inimigos_acertados.push(infdir)
                        $quadrados_inimigos_destruidos +=1
                    else
                        Image.new(
                            'IBMsprites\acertou_a_agua.png',
                            x: quad.x, y: quad.y,
                        )
                    end 
                end
            end
        end
    end 

    if !(cima_proibido.include? atirar_no_quadrado) && !(esquerda_proibida.include? atirar_no_quadrado)
        subesq = atirar_no_quadrado - 12 - 1
        if !($tiros_ja_disparados.include? subesq)
            quadrados = 0
            $quadrados_player.each do |quad|
                quadrados += 1
                if subesq == quadrados
                    $tiros_ja_disparados.push(subesq)
                    if $box_expl_player.include? subesq
                        $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                        $quadrados_inimigos_acertados.push(subesq)
                        $quadrados_inimigos_destruidos +=1
                    else
                        Image.new(
                            'IBMsprites\acertou_a_agua.png',
                            x: quad.x, y: quad.y,
                        )
                    end 
                end
            end
        end
    end

    if !(cima_proibido.include? atirar_no_quadrado) && !(direita_proibida.include? atirar_no_quadrado)
        subdir = atirar_no_quadrado - 12 + 1
        if !($tiros_ja_disparados.include? subdir)
            quadrados = 0
            $quadrados_player.each do |quad|
                quadrados += 1
                if subdir == quadrados
                    $tiros_ja_disparados.push(subdir)
                    if $box_expl_player.include? subdir
                        $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                        $quadrados_inimigos_acertados.push(subdir)
                        $quadrados_inimigos_destruidos +=1
                    else
                        Image.new(
                            'IBMsprites\acertou_a_agua.png',
                            x: quad.x, y: quad.y,
                        )
                    end 
                end
            end
        end
    end
end

$rodadas = 0

def vez_do_computador

    $rodadas += 1
    if  $rodadas == $tiros_apeloes[$checando_apelao]
        tiro_apelao_inimigo
        $checando_apelao+=1
    else
        if $primeiro_tiro == true
            tiros_aleatorios
            $primeiro_tiro = false
        else
            #$andar_pelos_quadrados == $quadrados_inimigos_acertados.length
            acertos = 0
            if ($quadrados_inimigos_acertados.length == 0) 
                tiros_aleatorios
            else
                quadrado_analise = $quadrados_inimigos_acertados[$andar_pelos_quadrados]
                escolher_direcao = ["esquerda","direita","cima","Baixo"]
                tiros_direcoes = []
    
                tiros_direcoes.push(escolher_direcao[rand(0...escolher_direcao.length)])
                escolher_direcao.delete(tiros_direcoes[0])
    
                tiros_direcoes.push(escolher_direcao[rand(0...escolher_direcao.length)])
                escolher_direcao.delete(tiros_direcoes[1])
                
                tiros_direcoes.push(escolher_direcao[rand(0...escolher_direcao.length)])
                escolher_direcao.delete(tiros_direcoes[2])
    
                tiros_direcoes.each do |direcao|
                    quadrado_atirar = quadrado_analise
                    if direcao == "esquerda"
                        puts "esquerda:"
                        quadrado_atirar -= 1
                        if quadrado_atirar == 0
                            quadrado_atirar = rand(1...96)
                        end
                        while ($tiros_ja_disparados.include? quadrado_atirar)
                            if quadrado_atirar < 1
                                quadrado_atirar = rand(1...96) + 1
                            end
                            quadrado_atirar -= 1
                            if quadrado_atirar == 0
                                quadrado_atirar = rand(1...96)
                            end
                        end
                        quadrados = 0
                        $quadrados_player.each do |quad|
                            quadrados += 1
                            if quadrado_atirar == quadrados
                                $tiros_ja_disparados.push(quadrado_atirar)
                                puts quadrado_atirar
                                if $box_expl_player.include? quadrado_atirar
                                    $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                                    $quadrados_inimigos_acertados.push(quadrado_atirar)
                                    $quadrados_inimigos_destruidos += 1
                                    acertos +=1
                                    puts "     acertou"
                                else
                                    Image.new(
                                        'IBMsprites\acertou_a_agua.png',
                                        x: quad.x, y: quad.y,
                                    )
                                    puts "     errou"
                                end
                            end
                        end
                        
                    
                    elsif direcao == "direita"
                        puts "direita:"
                        
    
                        quadrado_atirar += 1
                      
                        if quadrado_atirar > 96
                            puts quadrado_atirar
                            quadrado_atirar = rand(1...96)
                            puts "Numero aleatorio escolhido: "
                            puts quadrado_atirar
                        end
                        while ($tiros_ja_disparados.include? quadrado_atirar)
                            if (quadrado_atirar>96)
                                quadrado_atirar = rand(1...96) - 1
                            end
                            quadrado_atirar += 1
                            if quadrado_atirar == 96
                                quadrado_atirar = rand(1...96)
                            end
                        end
                        quadrados = 0
                        $quadrados_player.each do |quad|
                            quadrados += 1
                            if quadrado_atirar == quadrados
                                $tiros_ja_disparados.push(quadrado_atirar)
                                puts quadrado_atirar
                                if $box_expl_player.include? quadrado_atirar
                                    $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                                    $quadrados_inimigos_acertados.push(quadrado_atirar)
                                    acertos +=1
                                    $quadrados_inimigos_destruidos += 1
                                    puts "     acertou"
                                else
                                    Image.new(
                                        'IBMsprites\acertou_a_agua.png',
                                        x: quad.x, y: quad.y,
                                    )
                                    puts "     errou"
                                end
                            end
                        end
    
                    elsif direcao == "cima"
    
                        puts "cima: "
                        quadrado_atirar -=12 
                        # 2
                        if quadrado_atirar < 1
                            quadrado_atirar = rand(1...96)
                        end
                        while ($tiros_ja_disparados.include? quadrado_atirar)
                            if  quadrado_atirar<13
                                pos = rand(1...96) + 12
                            end
                            quadrado_atirar -= 12#1
                            if quadrado_atirar < 1
                                quadrado_atirar = rand(1...96)
                            end
                            
                        end
                        quadrados = 0
                        $quadrados_player.each do |quad|
                            quadrados += 1
                            if quadrado_atirar == quadrados
                                $tiros_ja_disparados.push(quadrado_atirar)
                                puts quadrado_atirar
                                if $box_expl_player.include? quadrado_atirar
                                    $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                                    $quadrados_inimigos_acertados.push(quadrado_atirar)
                                    acertos +=1
                                    $quadrados_inimigos_destruidos += 1
                                    puts "     acertou"
                                else
                                    Image.new(
                                        'IBMsprites\acertou_a_agua.png',
                                        x: quad.x, y: quad.y,
                                    )
                                    puts "     errou"
                                end
                            end
                        end
    
                    else
                        quadrado_atirar += 12
                        #85
                        puts "baixo: "
                        if quadrado_atirar > 96
                            quadrado_atirar = rand(1...96)
                        end
                        while ($tiros_ja_disparados.include? quadrado_atirar)
                            if  quadrado_atirar>84
                                pos = rand(1...96) - 12
                            end
                            quadrado_atirar += 12
                            if quadrado_atirar > 96
                                quadrado_atirar = rand(1...96)
                            end
                        end
                        quadrados = 0
                        $quadrados_player.each do |quad|
                            quadrados += 1
                            if quadrado_atirar == quadrados
                                $tiros_ja_disparados.push(quadrado_atirar)
                                puts quadrado_atirar
                                if $box_expl_player.include? quadrado_atirar
                                    $tiros_inimigos_acertados.push(Barco_vermelho.new(quad.x,quad.y))
                                    $quadrados_inimigos_acertados.push(quadrado_atirar)
                                    acertos +=1
                                    $quadrados_inimigos_destruidos += 1
                                    puts "     acertou"
                                else
                                    Image.new(
                                        'IBMsprites\acertou_a_agua.png',
                                        x: quad.x, y: quad.y,
                                    )
                                    puts "     errou"
                                end
                            end
                        end
    
                    end
                end
    
                puts $andar_pelos_quadrados
                if $andar_pelos_quadrados == ($quadrados_inimigos_acertados.length - 1) && acertos == 0
                    tiros_aleatorios
                    puts "Aleatórios________________________________________"
                else
                    $andar_pelos_quadrados += 1
                end
    
                puts "___________________________________________________________________"
                
    
            end
        end
        if $quadrados_inimigos_destruidos == 30
            $fim_de_jogo = true
            you_loose = Sprite.new(
                'IBMsprites\youloose.png',
                x: 250,
                y: 50,
                clip_width: 600,
                time: 240,
                loop: true
            )
            you_loose.z = 1
            you_loose.play
        end
    end
    $turn_botao.turn_jogador
    $jogador_joga = true
end

$atomic_pressionado = false
$tiros_atomicos = 2

on:mouse_down do |mouse_click|
    #Estamos aqui----------------------------------------------------------------------------------------------

    if $fim_de_jogo == true
        if mouse_click
            som_fundo.stop
            #-----------------------------------------------------------------------

            pontuacao_player = $acertos_do_player.to_f / $erros_do_player
            pontuacao_player *= 100

            fileobject = File.open("ranking.txt", "r"); 
            linhas = (fileobject.readlines)

            if linhas.length == 0
                fileobject.close(); 
                fileobjectEscrever = File.open("ranking.txt", "w"); 
                fileobjectEscrever.syswrite("Player 1 - %d \n"%[pontuacao_player]);
                fileobjectEscrever.close()
            else
                fileobject.close();
  
                valores = [] 
                players = [] 

                linhas.each do |linha|
                    players.push(linha.split[1].to_i)
                end
                player_atual = players.max() + 1
                linhas.push("Player %d - %d \n"%[player_atual,pontuacao_player])
                linhas.each do |linha|
                    valores.push(linha.split[-1].to_i)
                end
                
                for i in 1...(valores.length)
                    key_valor = valores[i]
                    key_linhas = linhas[i]
                    j = i - 1
                    while j>=0 and valores[j] < key_valor
                    valores[j+1] = valores[j]
                    linhas[j+1] = linhas[j]
                    j -= 1
                    end
                    valores[j+1] = key_valor
                    linhas[j+1] = key_linhas
                end
                
                
                

                fileobjectEscrever = File.open("ranking.txt", "w");
                linhas.each do |linha|
                    fileobjectEscrever.syswrite(linha);
                end
                fileobjectEscrever.close()
            
            end



            exec( "ruby BN_MAIN.rb" )
        end
    else
    
        if partida_inicio == true
            
            if $jogador_joga == true
                
                if bt_atomic.released.contains?(mouse_click.x,mouse_click.y)
                    if $tiros_atomicos > 0
                        bt_atomic.desligar
                        $atomic_pressionado = true
                        $tiros_atomicos -= 1
                    end
                end

                if $atomic_pressionado == true
                    quadrado = 0
                    quadrados_preencher = []
                    esquerda_proibidos = [1,13,25,37,49,61,73,85]
                    direita_proibidos = [12,24,36,48,60,72,84,96]
                    $quadrados_enemy.each do |box|
                        quadrado+=1
                        if box.imagem.contains?(mouse_click.x,mouse_click.y)
                            
                            if posicoes_ja_jogadas.include? quadrado
                                $error.play
                            else
                                quadrados_preencher.push(quadrado)
                                
                                posicoes_ja_jogadas.push(quadrado)

                                if quadrado - 1 > 0 && !(posicoes_ja_jogadas.include? (quadrado - 1))
                                    if !(esquerda_proibidos.include?quadrado)
                                        quadrados_preencher.push(quadrado - 1)
                                        posicoes_ja_jogadas.push(quadrado - 1)
                                    end
                                end
                                if quadrado + 1 > 0 && !(posicoes_ja_jogadas.include? (quadrado + 1))
                                    if !(direita_proibidos.include?quadrado)
                                        quadrados_preencher.push(quadrado+1)
                                        posicoes_ja_jogadas.push(quadrado + 1)
                                    end
                                end
                                if quadrado - 12 > 0 && !(posicoes_ja_jogadas.include? (quadrado - 12))
                                    quadrados_preencher.push(quadrado - 12)
                                    posicoes_ja_jogadas.push(quadrado - 12)
                                end
                                if (quadrado - 12) - 1 > 0 && !(posicoes_ja_jogadas.include? ((quadrado - 12) - 1))
                                    if !(esquerda_proibidos.include?quadrado)
                                        quadrados_preencher.push((quadrado - 12) - 1)
                                        posicoes_ja_jogadas.push((quadrado - 12) - 1)
                                    end
                                end
                                if (quadrado - 12) + 1 > 0 && !(posicoes_ja_jogadas.include? ((quadrado - 12) + 1))
                                    if !(direita_proibidos.include?quadrado)
                                        quadrados_preencher.push((quadrado - 12) + 1)
                                        posicoes_ja_jogadas.push((quadrado - 12) + 1)
                                    end
                                end
                                if quadrado + 12 <=96  && !(posicoes_ja_jogadas.include? (quadrado + 12))
                                    quadrados_preencher.push(quadrado + 12)
                                    posicoes_ja_jogadas.push(quadrado + 12)
                                end
                                if (quadrado + 12) - 1 <=96  && !(posicoes_ja_jogadas.include? ((quadrado + 12)-1))
                                    if !(esquerda_proibidos.include?quadrado)
                                        quadrados_preencher.push((quadrado + 12) - 1)
                                        posicoes_ja_jogadas.push((quadrado + 12) - 1)
                                    end
                                end
                                if (quadrado + 12) + 1 <=96  && !(posicoes_ja_jogadas.include? ((quadrado + 12)+1))
                                    if !(direita_proibidos.include?quadrado)
                                        quadrados_preencher.push((quadrado + 12) + 1)
                                        posicoes_ja_jogadas.push((quadrado + 12) + 1)
                                    end
                                end

                                if quadrados_preencher.length() > 0
                                    quadrados_preencher.each do |quad|
                                        quadrado = 0
                                        $quadrados_enemy.each do |box|
                                            quadrado+=1
                                            if quad == quadrado
                                                lista_bombas.push(Bomba.new(box.x,box.y))
                                            end
                                        end
                                    end 
                                end

                                quadrados_preencher = []
                            end
                            
                            
                            bt_atomic.ligar
                            $atomic_pressionado = false
                        end
                    end

                    if $turn_botao.jogador.contains?(mouse_click.x,mouse_click.y)
                        $jogador_joga = false
                        $turn_botao.turn_inimigo

                        lista_bombas.each do |bomb|
                            
                            acert_barco = false
                            $quadrados_cobertura.each do |cob|
                                if bomb.x == cob.x && bomb.y == cob.y
                                    $quadrados_navios_acertados.push(Barco_vermelho.new(bomb.x,bomb.y))
                                    $acertos_do_player += 1
                                    acert_barco = true                         
                                end
                            end
                            bomb.remove
                            if acert_barco == false
                                Image.new(
                                    'IBMsprites\acertou_a_agua.png',
                                    x: bomb.x, y: bomb.y,
                                )
                                $erros_do_player +=1
                            end
                        end
                        lista_bombas = []
                        checar_barco_inimigo_destruido
                        if $fim_de_jogo == false
                            vez_do_computador
                        end
                        
                    end
                
                
                else
                    if $tiros_jogador > 0
                        quadrado = 0
                        $quadrados_enemy.each do |box|
                            quadrado+=1
                            if box.imagem.contains?(mouse_click.x,mouse_click.y)

                                if posicoes_ja_jogadas.include? quadrado
                                    $error.play
                                else
                                    lista_bombas.push(Bomba.new(box.x,box.y))
                                    posicoes_ja_jogadas.push(quadrado)
                                    $tiros_jogador -= 1
                                end

                            end
                        end
                        
                    end
                    
                    if $turn_botao.jogador.contains?(mouse_click.x,mouse_click.y) 
                        $tiros_jogador = 3
                        $jogador_joga = false
                        $turn_botao.turn_inimigo

                        
                        lista_bombas.each do |bomb|
                            
                            acert_barco = false
                            $quadrados_cobertura.each do |cob|
                                if bomb.x == cob.x && bomb.y == cob.y
                                    $quadrados_navios_acertados.push(Barco_vermelho.new(bomb.x,bomb.y))
                                    acert_barco = true
                                    $acertos_do_player += 1                         
                                end
                            end
                            bomb.remove
                            if acert_barco == false
                                Image.new(
                                    'IBMsprites\acertou_a_agua.png',
                                    x: bomb.x, y: bomb.y,
                                )
                                $erros_do_player += 1
                            end
                        end
                        lista_bombas = []
                        checar_barco_inimigo_destruido
                        vez_do_computador
                    end
                end
                
            end
        
        else

            quadrado_jogador = 0
            $quadrados_player.each do |box|
                quadrado_jogador+=1
                if box.imagem.contains?(mouse_click.x,mouse_click.y)

                    if submarinoTemplate.selecionado == true
                        if submarinoTemplate.quantidade > 0
                            
                            
                            if submarinoTemplate.estaVertical == true
                                
                                if check_disponibilidade_solo(quadrado_jogador, "submarino", "vertical") and check_disponibilidade_outros_barcos(quadrado_jogador) and check_disponibilidade_posicionar_barco(quadrado_jogador, "submarino", "vertical")
                                    Image.new(
                                        'IBMsprites\navios\submarino\submarino_vertical.png',
                                        x: box.x, y: box.y,
                                    )
                                    $box_expl_player.push(quadrado_jogador)
                                    $box_expl_player.push(quadrado_jogador + 12)
                                    startSound.play
                                    submarinoTemplate.diminuirMostrarQuant
                                    submarinoTemplate.diminuirQuant
                                else
                                    $error.play()
                                end
                            else
                                if check_disponibilidade_solo(quadrado_jogador, "submarino", "horizontal") and check_disponibilidade_outros_barcos(quadrado_jogador) and check_disponibilidade_posicionar_barco(quadrado_jogador, "submarino", "horizontal")
                                    Image.new(
                                        'IBMsprites\navios\submarino\submarino_horizontal.png',
                                        x: box.x, y: box.y,
                                    )
                                    $box_expl_player.push(quadrado_jogador)
                                    $box_expl_player.push(quadrado_jogador + 1)
                                    startSound.play
                                    submarinoTemplate.diminuirMostrarQuant
                                    submarinoTemplate.diminuirQuant
                                else
                                    $error.play()
                                end
                            end
                        
                            
                        end
                        
                    elsif navioTanqueTemplate.selecionado == true
                        if navioTanqueTemplate.quantidade > 0
                            
                            if navioTanqueTemplate.estaVertical == true
                                if check_disponibilidade_solo(quadrado_jogador, "navioTanque", "vertical") and check_disponibilidade_outros_barcos( quadrado_jogador) and check_disponibilidade_posicionar_barco(quadrado_jogador, "tank", "vertical")
                                    Image.new(
                                        'IBMsprites\navios\tanque\navio_tanque_vertical.png',
                                        x: box.x, y: box.y,
                                    )
                                    $box_expl_player.push(quadrado_jogador)
                                    $box_expl_player.push(quadrado_jogador + 12)
                                    $box_expl_player.push(quadrado_jogador + 24)
                                    $box_expl_player.push(quadrado_jogador + 36)
                                    

                                    startSound.play
                                    navioTanqueTemplate.diminuirMostrarQuant
                                    navioTanqueTemplate.diminuirQuant
                                else
                                    $error.play()
                                end
                            else
                                if check_disponibilidade_solo(quadrado_jogador, "navioTanque", "horizontal") and check_disponibilidade_outros_barcos(quadrado_jogador) and check_disponibilidade_posicionar_barco(quadrado_jogador, "tank", "horizontal")
                                    Image.new(
                                        'IBMsprites\navios\tanque\navio_tanque_horizontal.png',
                                        x: box.x, y: box.y,
                                    )

                                    $box_expl_player.push( quadrado_jogador)
                                    
                                    $box_expl_player.push(quadrado_jogador + 1)
                                    
                                    $box_expl_player.push(quadrado_jogador + 2)
                                    
                                    $box_expl_player.push(quadrado_jogador + 3)
                                    

                                    startSound.play
                                    navioTanqueTemplate.diminuirMostrarQuant
                                    navioTanqueTemplate.diminuirQuant
                                else
                                    $error.play()
                                end
                            end
                            
                        end
                    elsif contratorpedeiroTemplate.selecionado == true
                        if contratorpedeiroTemplate.quantidade > 0
                        
                            if contratorpedeiroTemplate.estaVertical == true
                                if check_disponibilidade_solo(quadrado_jogador, "contraTorpedeiro", "vertical") and check_disponibilidade_outros_barcos( quadrado_jogador) and check_disponibilidade_posicionar_barco(quadrado_jogador, "contratorpedeiro", "vertical")
                                    Image.new(
                                        'IBMsprites\navios\contratorpedeiro\contratorpedeiro_vertical.png',
                                        x: box.x, y: box.y,
                                    )

                                    $box_expl_player.push( quadrado_jogador)
                                    
                                    $box_expl_player.push( quadrado_jogador + 12)
                                    
                                    $box_expl_player.push( quadrado_jogador + 24)
                                    

                                    startSound.play
                                    contratorpedeiroTemplate.diminuirMostrarQuant
                                    contratorpedeiroTemplate.diminuirQuant
                                else
                                    $error.play()
                                end
                            else
                                if check_disponibilidade_solo(quadrado_jogador, "contraTorpedeiro", "horizontal") and check_disponibilidade_outros_barcos(quadrado_jogador) and check_disponibilidade_posicionar_barco(quadrado_jogador, "contratorpedeiro", "horizontal")
                                    Image.new(
                                        'IBMsprites\navios\contratorpedeiro\contratorpedeiro_horizontal.png',
                                        x: box.x, y: box.y,
                                    )

                                    $box_expl_player.push( quadrado_jogador)
                                    $box_expl_player.push( quadrado_jogador + 1)
                                    $box_expl_player.push( quadrado_jogador + 2)


                                    startSound.play
                                    contratorpedeiroTemplate.diminuirMostrarQuant
                                    contratorpedeiroTemplate.diminuirQuant
                                else
                                    $error.play()
                                end
                            end
                            
                        end
                    else
                        if portaAvioesTemplate.quantidade > 0
                            
                            if portaAvioesTemplate.estaVertical == true
                                if check_disponibilidade_solo(quadrado_jogador, "portaAvioes", "vertical") and check_disponibilidade_outros_barcos(quadrado_jogador) and check_disponibilidade_posicionar_barco(quadrado_jogador, "portaAvioes", "vertical")
                                    Image.new(
                                        'IBMsprites\navios\portaAvioes\porta_avioes_vertical.png',
                                        x: box.x, y: box.y,
                                    )

                                    $box_expl_player.push( quadrado_jogador)
                                    $box_expl_player.push( quadrado_jogador + 12)
                                    $box_expl_player.push( quadrado_jogador + 24)
                                    $box_expl_player.push( quadrado_jogador + 36)
                                    $box_expl_player.push( quadrado_jogador + 48)

                                    startSound.play
                                    portaAvioesTemplate.diminuirMostrarQuant
                                    portaAvioesTemplate.diminuirQuant
                                else
                                    $error.play()
                                end
                            else
                                if check_disponibilidade_solo(quadrado_jogador, "portaAvioes", "horizontal") and check_disponibilidade_outros_barcos(quadrado_jogador) and check_disponibilidade_posicionar_barco(quadrado_jogador, "portaAvioes", "horizontal")
                                    Image.new(
                                        'IBMsprites\navios\portaavioes\porta_avioes_horizontal.png',
                                        x: box.x, y: box.y,
                                    )

                                    $box_expl_player.push( quadrado_jogador)
                                    $box_expl_player.push( quadrado_jogador + 1)
                                    $box_expl_player.push( quadrado_jogador + 2)
                                    $box_expl_player.push( quadrado_jogador + 3)
                                    $box_expl_player.push( quadrado_jogador + 4)

                                    startSound.play
                                    portaAvioesTemplate.diminuirMostrarQuant
                                    portaAvioesTemplate.diminuirQuant
                                else
                                    $error.play()
                                end
                            end
                            
                        end

                    end
                end
            end

            if bt_start.released.contains?(mouse_click.x,mouse_click.y)
                startSound.play
                bt_start.released.remove()
                bt_start.pressed.add()
                partida_inicio = true
                $turn_botao.turn_jogador
                colocar_barcos_inimigo()

                apagar_barco(submarinoTemplate)
                apagar_barco(navioTanqueTemplate)
                apagar_barco(contratorpedeiroTemplate)
                apagar_barco(portaAvioesTemplate)


            elsif btRotate.contains?(mouse_click.x,mouse_click.y)
                startSound.play
                if portaAvioesTemplate.selecionado == true
                    roatacionar_barco(portaAvioesTemplate)
                elsif submarinoTemplate.selecionado == true
                    roatacionar_barco(submarinoTemplate)
                elsif contratorpedeiroTemplate.selecionado == true
                    roatacionar_barco(contratorpedeiroTemplate)
                elsif navioTanqueTemplate.selecionado == true
                    roatacionar_barco(navioTanqueTemplate)
                end
            else
                if portaAvioesTemplate.clicado(mouse_click.x,mouse_click.y) == true
                    if portaAvioesTemplate.selecionado == false
                        startSound.play
                        acender_barco(portaAvioesTemplate)
                        apagar_barco(submarinoTemplate)
                        apagar_barco(contratorpedeiroTemplate)
                        apagar_barco(navioTanqueTemplate)

                    
                        submarinoTemplate.definirSelecionado(false)
                        portaAvioesTemplate.definirSelecionado(true)
                        contratorpedeiroTemplate.definirSelecionado(false)
                        navioTanqueTemplate.definirSelecionado(false)
                    end
                elsif submarinoTemplate.clicado(mouse_click.x,mouse_click.y) == true
                    if submarinoTemplate.selecionado == false
                        startSound.play
                        acender_barco(submarinoTemplate)
                        apagar_barco(portaAvioesTemplate)
                        apagar_barco(contratorpedeiroTemplate)
                        apagar_barco(navioTanqueTemplate)

                        submarinoTemplate.definirSelecionado(true)
                        portaAvioesTemplate.definirSelecionado(false)
                        contratorpedeiroTemplate.definirSelecionado(false)
                        navioTanqueTemplate.definirSelecionado(false)
                    end
                elsif contratorpedeiroTemplate.clicado(mouse_click.x,mouse_click.y) == true
                    startSound.play
                    if contratorpedeiroTemplate.selecionado == false
                        acender_barco(contratorpedeiroTemplate)
                        apagar_barco(portaAvioesTemplate)
                        apagar_barco(submarinoTemplate)
                        apagar_barco(navioTanqueTemplate)

                        submarinoTemplate.definirSelecionado(false)
                        portaAvioesTemplate.definirSelecionado(false)
                        contratorpedeiroTemplate.definirSelecionado(true)
                        navioTanqueTemplate.definirSelecionado(false)
                    end
                elsif navioTanqueTemplate.clicado(mouse_click.x,mouse_click.y) == true
                    startSound.play
                    if navioTanqueTemplate.selecionado == false
                        acender_barco(navioTanqueTemplate)
                        apagar_barco(portaAvioesTemplate)
                        apagar_barco(contratorpedeiroTemplate)
                        apagar_barco(submarinoTemplate)

                        submarinoTemplate.definirSelecionado(false)
                        portaAvioesTemplate.definirSelecionado(false)
                        contratorpedeiroTemplate.definirSelecionado(false)
                        navioTanqueTemplate.definirSelecionado(true)
                    end
                end
            end

        end
    end 

    

end

show