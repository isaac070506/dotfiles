function fcompile
    # Verificamos que se haya pasado un argumento
    if count $argv > /dev/null
        # Obtenemos el nombre base sin la extensión .f90
        set -l basename (string replace -r '\.f90$' '' $argv[1])
        
        # Ejecutamos la compilación
        echo "Compilando $argv[1] -> $basename.x..."
        gfortran $argv[1] -o $basename.x
        
        # Opcional: Avisar si la compilación fue exitosa
        if test $status -eq 0
            echo "¡Listo! Ejecutable creado como: $basename.x"
        end
    else
        echo "Uso: fcompile archivo.f90"
    end
end
