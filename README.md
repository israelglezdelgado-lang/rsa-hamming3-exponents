# rsa-hamming3-exponents

**Experimental generation and evaluation of RSA public exponents with Hamming weight equal to 3**  
**Generación y evaluación experimental de exponentes públicos RSA con peso de Hamming igual a 3**

---

# English

## Overview

This repository contains the material associated with an experimental cryptographic research project that investigates the use of **large RSA public exponents having exactly three bits set (Hamming weight = 3)**.

For decades, virtually every practical RSA implementation has adopted the public exponent **65537**, a Fermat prime with Hamming weight equal to two. This value provides an excellent compromise between computational efficiency, interoperability and security.

The purpose of this project is **not** to replace the standard exponent, but rather to experimentally study whether very large sparse public exponents can be generated efficiently, whether they satisfy the mathematical requirements imposed by RSA, and what practical consequences arise from their use.

The project includes:

- A Bash generator for Hamming-weight-3 prime exponents.
- Experimental methodology.
- Statistical observations.
- Mathematical discussion.
- Performance considerations.
- Interoperability analysis.
- A bilingual technical paper documenting the research.

This repository is intended for educational, academic and experimental purposes.

---

## Motivation

The research started from a simple observation.

Current RSA moduli commonly use sizes such as:

- 2048 bits
- 3072 bits
- 4096 bits

while the public exponent almost universally remains

```
65537
```

which occupies only 17 bits.

This naturally raises the question:

> Can RSA operate correctly with public exponents having thousands of bits while preserving a very low Hamming weight?

This repository attempts to answer that question experimentally.

---

## Repository contents

```
rsa-hamming3-exponents/
│
├── hamming3_primes.sh
├── README.md
├── documentation.html
└── LICENSE
```

---

## Generator

The Bash script

```
hamming3_primes.sh
```

generates every candidate of exactly **N bits** having:

- most significant bit = 1
- least significant bit = 1
- exactly one additional bit set

therefore producing numbers with

```
Hamming weight = 3
```

Every candidate is tested for primality using OpenSSL.

---

## Requirements

- Bash
- OpenSSL
- Linux, macOS or any Unix-like environment

---

## Usage

```
chmod +x hamming3_primes.sh

./hamming3_primes.sh 1024
```

Example:

```
./hamming3_primes.sh 4096
```

---

## Example output

```
Primo #1 encontrado:

Binary:
1000...000100...0001

Decimal:
1046...

...
```

(The actual output depends on the requested bit length.)

---

## Research conclusions

The experimental results indicate that:

- Large Hamming-weight-3 prime exponents can be generated reliably.
- They are mathematically valid RSA public exponents.
- RSA encryption, decryption, signing and verification work correctly with them.
- Their use significantly increases the computational cost of encryption and signature verification.
- They provide no currently known security advantage over the conventional exponent 65537.
- Compatibility with many existing software products is reduced because numerous implementations assume or expect conventional public exponents.

---

## Disclaimer

This project does **not** recommend replacing the conventional RSA public exponent.

Its purpose is solely to document an experimental investigation and provide reproducible research material.

---

## Citation

If this work contributes to your own research, academic publication or implementation, citations are appreciated.

---

## Author

**Israel González Delgado**

GitHub:

https://github.com/israelglezdelgado-lang

Email:

israelglezdelgado@gmail.com

---

# Español

## Descripción

Este repositorio contiene el material correspondiente a una investigación criptográfica experimental dedicada al estudio de **exponentes públicos RSA de gran tamaño con peso de Hamming igual a tres**.

Durante décadas prácticamente todas las implementaciones de RSA han utilizado como exponente público

```
65537
```

un primo de Fermat con peso de Hamming igual a dos.

El objetivo de este proyecto **no es sustituir dicho valor**, sino estudiar experimentalmente si exponentes mucho mayores, manteniendo un peso de Hamming muy bajo, pueden emplearse correctamente dentro del algoritmo RSA y cuáles son sus implicaciones prácticas.

El proyecto incluye:

- Un generador en Bash.
- Metodología experimental.
- Resultados estadísticos.
- Discusión matemática.
- Consideraciones de rendimiento.
- Análisis de interoperabilidad.
- Una disertación técnica bilingüe.

Este proyecto tiene fines exclusivamente académicos, experimentales y educativos.

---

## Motivación

La investigación parte de una observación sencilla.

Hoy en día los módulos RSA suelen tener tamaños como:

- 2048 bits
- 3072 bits
- 4096 bits

mientras que el exponente público continúa siendo

```
65537
```

que apenas ocupa 17 bits.

Esto conduce naturalmente a la siguiente pregunta:

> ¿Puede RSA funcionar correctamente utilizando exponentes públicos de miles de bits que mantengan un peso de Hamming muy reducido?

Este proyecto intenta responder esa pregunta mediante experimentación.

---

## Contenido del repositorio

```
rsa-hamming3-exponents/
│
├── hamming3_primes.sh
├── README.md
├── documentation.html
└── LICENSE
```

---

## El generador

El script

```
hamming3_primes.sh
```

genera todos los candidatos de exactamente **N bits** que cumplen:

- bit más significativo = 1
- bit menos significativo = 1
- un único bit adicional activado

obteniendo números con

```
Peso de Hamming = 3
```

Cada candidato es sometido posteriormente a una prueba de primalidad mediante OpenSSL.

---

## Requisitos

- Bash
- OpenSSL
- Linux, macOS o cualquier sistema tipo Unix

---

## Uso

```
chmod +x hamming3_primes.sh

./hamming3_primes.sh 1024
```

Ejemplo:

```
./hamming3_primes.sh 4096
```

---

## Resultados generales

Los experimentos muestran que:

- Es posible generar de forma sistemática exponentes primos de gran tamaño con peso de Hamming igual a tres.
- Dichos exponentes son matemáticamente válidos para RSA.
- Las operaciones de cifrado, descifrado, firma y verificación funcionan correctamente.
- El coste computacional aumenta de forma considerable.
- No existe evidencia pública de que proporcionen una ventaja de seguridad frente al valor estándar 65537.
- La interoperabilidad con numerosas aplicaciones disminuye debido a que muchas implementaciones esperan exponentes públicos convencionales.

---

## Aviso

Este proyecto **no pretende proponer un nuevo estándar para RSA**.

Su finalidad consiste únicamente en documentar una investigación experimental reproducible.

---

## Autor

**Israel González Delgado**

GitHub:

https://github.com/israelglezdelgado-lang

Correo electrónico:

israelglezdelgado@gmail.com

---

# License

MIT License

Copyright (c) 2026 Israel González Delgado

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.