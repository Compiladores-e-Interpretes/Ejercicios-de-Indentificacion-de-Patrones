# Ejercicios de Identificación de Patrones (Lex/Flex)

Cada ejercicio está en su propia carpeta y contiene únicamente:
- Un archivo `.l` con el lexer
- Un `Makefile`

## Requisitos
- `flex` (o `lex`) y `gcc`

Nota: en macOS normalmente no hace falta ninguna librería extra.
Si al compilar tu instalación lo requiere, puedes probar:
- `make LIBS=-ll`
- o `make LIBS=-lfl` (si instalaste flex/libfl por brew)

## Cómo compilar y ejecutar

### 01 - Detector de Mayúsculas
Carpeta: `01-detector-mayusculas`

```bash
make
echo "Hola Mundo\nPrueba Importante" | ./detector_mayusculas
```

### 02 - Limpiador de Espacios
Carpeta: `02-limpiador-espacios`

```bash
make
printf "a\t\t b    c\n" | ./limpiador_espacios
```

### 03 - Validador de IPs
Carpeta: `03-validador-ips`

```bash
make
echo "192.168.0.1 999.1.2.3 10.0.0.256" | ./validador_ips
```

### 04 - Extractor de Enlaces Markdown
Carpeta: `04-extractor-enlaces-markdown`

```bash
make
echo "Visita [Google](https://google.com) y [Docs](https://example.com/docs)" | ./extractor_enlaces_markdown
```

### 05 - Analizador de Fechas
Carpeta: `05-analizador-fechas`

```bash
make
echo "15/15/2024 29/02/2024 31/04/2023" | ./analizador_fechas
```