---
title: Cryptography – Exam Questions
author: Tim Herbstrith
date: 2020
bibliography: references.bib
linkReferences: true
link-citations: true
...

# Cryptography principles / Basic model for secrecy / Cryptosystem for secrecy

> Cryptography principles definitions, (non) examples. Basic cryptography
> concepts (primitive, protocol, cover time, etc.). Basic model for secrecy:
> (non)-examples. Cryptosystem for secrecy: definition, examples. Symmetric
> versus asymmetric cryptosystems.

## Cryptography principles

*  Confidentiality / secrecy:
    -  limit access to information
*  Data Integrity
    -  data was not altered (intentionally or accidentally)
    -  detection of alteration (not prevention)
*  Data origin authentication / message authentication
    -  confirms the origin of data with no temporal aspect to the **receiver**
    -  not necessarily an immediate source / not when
*  Entity authentication
    -  a given entity is involved and currently active
    -  e.g. log in at web service
*  Non-Repudiation
    -  a source of data cannot deny to a **third party** being at the origin

Data origin authentication $⇒$ Data integrity

Non-Repudiation $⇒$ Data origin authentication

Data origin authentication $≠$ Entity authentication

Secrecy $\nRightarrow$ Data origin authentication

## Different cryptographic concepts

*  Cryptography = **toolkit**
*  Cryptographic **primitive** = a basic tool in this toolkit
   -  Examples:
      Encryption, hash function, MAC (message authentication code),
      digital signature, etc.
*  Cryptographic **algorithm** = Cipher = a specification of a primitive
*  Cryptographic **protocol** = a way to choose primitives and use them
   for a security goal
*  Crypto**system** = implementation of primitives and the infrastructure

## Basic model of a cryptosystem

![Basic model of a cryptosystem [@Martin2012]](./imgs/basic_model_for_secrecy.png){#fig:basic_model}

@Fig:basic_model depicts a sender who wishes to transfer some data to a receiver
in such a way that any party intercepting the transmitted data cannot determine
the content. *The interceptor must not know the decryption key.*

Secrecy can be provided by (combination of):

1. Cryptography (via encryption)
2. Steganography (via information hiding)
3. Access control (via software or hardware)

## Definition of Cryptosystem

**Cryptosystem** is a $5$-tuple $(\mathcal{P, C, K, E, D})$ satisfying:

* $\mathcal{P}$ is a finite set of possible **plaintexts**;
* $\mathcal{C}$ is a finite set of possible **ciphertexts**;
* $\mathcal{K}$, the keyspace, is a finite set of possible **keys**;
* $\mathcal{E} = \lbrace{E_k : k ∈ \mathcal{K}}\rbrace$ consists of **encryption
  functions** $E_k : \mathcal{P → C}$;
* $\mathcal{D} = \lbrace{D_k : k ∈ \mathcal{K}}\rbrace$ consists of **decryption
  functions** $D_k : \mathcal{C → P}$;
* For all $e ∈ \mathcal{K}$ there exists $d ∈ \mathcal{K}$ such that for all
  plaintexts $p ∈ \mathcal{P}$ we have:
  $$D_d(E_e(p)) = p$$

The cryptosystem is

*  **symmetric** if $e = d$ and
*  **public-key** if $d$ cannot be derived from $e$ in a computationally
   feasible way

## Cover time

**Cover time** = the time for which a plaintext must be kept secret.

# Attacks on encryption algorithms

> Main attacks on encryption algorithms. Passive versus active attacks.
> Keys: length, size. Brute-force attack: assumptions, estimates on key lengths.

## Targets of attacks

*  A practical method of determining the **decryption key** is found.
*  A weakness in the encryption algorithm leads to a **plaintext**.

## Passive vs active attacks

*  The main type of **passive attack** is unauthorised access to data.
*  An **active attack** involves either data being changed in some way, or a
   process being conducted on the data.

## Key lengths and sizes

*  **Length** of the key = number of bites it takes to represent the key
*  **Size** of the keyspace = number of possible different decryption keys

## Assumptions

*  All keys from the keyspace are equally likely to be selected
*  The correct decryption key is identified as soon as it is tested

## Estimates on key length

If Size = $n = 2k$, then, on average, one needs $∼ 2k − 1$ attempts to find the
correct decryption key:

$$\mathbb{E}[X] = \sum_{i = 1}^n i \frac{1}{n} =
   \frac{n \; (n - 1)}{2} = \frac{2^k + 1}{2} ∼ 2^{k - 1}$$


# Examples of symmetric cryptosystems

> Examples of symmetric cryptosystems: Caesar and Substitution ciphers. The
> letter frequency analysis. Monoalphabetic and polyalphabetic cyphers.
> Vigenère cipher. If the given key of a Vigenère Cipher has repeated letters,
> does it make it any easier to break?

# Computational complexity

> Computational complexity of basic mathematical operations and of the
> exhaustive key search attack. Complexity classes of algorithms.

# Three types of security

> Three types of security. Perfect secrecy: definition, examples, equivalent
> formulations (with proof). Perfect secrecy: Shannon’s Theorem (with proof).

# RSA cryptosystem{#sec:rsa}

> RSA cryptosystem: definition, examples, correctness (encryption and decryption
> are inverse operations). Parameter generation, its complexity. Main attacks.

# One-way functions

> One-way function, with trapdoor. Theorem: RSA keys vs Factoring (formulation
> and sketch of proof).

# Hash functions

> Hash function: definition, types of resistance, (non)-examples. Optimal
> asymmetric encryption padding.

# Discrete logarithm problem

> Discrete logarithm problem. The DLP assumption. The DLP in (Z/(p-1)Z, +) Is
> breaking the ECC cryptosystem equivalent to solving the DLP?

# ElGamal cryptosystem

> ElGamal cryptosystem and parameter generation: definition, correctness
> (encryption and decryption are inverse operations). Theorem: ElGamal keys
>  versus DLP (with proof).

# Elliptic curves

> Elliptic curve: definition, singularities, normal forms, tangents.
> Theorem: intersection of E with a projective line (with proof).

# Group structure on elliptic curves

> Group structure on the elliptic curve over the algebraic closure,
> geometrically: definition and theorem (with proof).

# Cayley-Bacharach’s theorem

> Cayley-Bacharach’s theorem (with proof).

# Associativity

> Associativity (sketch of proof).

# Elliptic curves over finite fields

> Elliptic curves over finite fields: theorems (without proof) and examples.
> Check that for a prime q, each natural number in the Hasse interval occurs as
> the order of the el@liptic curve group over the field of q elements.

# Diffie-Hellman key agreement protocol

> Diffie-Hellman key agreement: protocol, attacks. The DHP problem. The ECDHE.

# Digital signature scheme

> Digital Signature Scheme. RSA signature algorithm. Attacks: definitions and
> examples.

To ensure the **non-repudiation** of data

## Definition

**Signature scheme** is a $5$-tuple $(\mathcal{P , A, K, S , V})$, satisfying:

*  $\mathcal{P}$ is a finite set of possible **messages**;
*  $\mathcal{A}$ is a finite set of possible **signatures**;
*  $\mathcal{K}$, the keyspace, is a finite set of possible **keys**;
*  $\mathcal{S} = \lbrace{sig_k : k ∈ \mathcal{K}}\rbrace$ consists of
   polynomial signing algorithms $sig_k : \mathcal{P → A}$;
*  $\mathcal{V} = \lbrace{ver_k : k ∈ \mathcal{K}}\rbrace$ consists of
   polynomial verification algorithms
   $ver_k : \mathcal{P × A} → \lbrace\mathtt{true, false}\rbrace$;
   $$∀x ∈ \mathcal{P}, ∀y ∈ A: ver_k (x, y) =
     \begin{cases}
     \mathtt{true},   & \text{if } y = sig_k(x)\\
     \mathtt{false},  & \text{otherwise}
     \end{cases}$$

A pair $(x,y)$ with $x ∈ \mathcal{P}$, $y ∈ \mathcal{A}$ is called a
**signed message**.

## RSA signature algorithm

| Public-key cryptosystem | Digital Signature |
| ----------------------- | ----------------- |
| Encrypt with $E_k$      | Sign with $D_k$   |
| Decrypt with $D_k$      | Verify with $E_k$ |

**RSA signature scheme** is a $5$-tuple $(\mathcal{P , A, K, S , V})$ such that:

*  $n = pq$, where $p, q$ are primes,
*  $\mathcal{P = A} = ℤ/nℤ$, and
*  $\mathcal{K} = \lbrace{(n,p,q,d,e) : de = 1 \mod ϕ(n)}\rbrace$
*  For $k = (n,p,q,d,e)$, we define
   $$sigk(x)=x^d \mod n \quad \text{and}$$
   $$ver_k (x, y) =
     \begin{cases}
     \mathtt{true},   & \text{if } x = y^e \mod n\\
     \mathtt{false},  & \text{otherwise}.
     \end{cases}$$

* Public-key is **$(n, e)$** and private-key is **$(p, q, d)$**.

**Note:** By the defintion of DSS we should have:

$$\begin{aligned}
ver_k(x, y) = \mathtt{true} & ⇔ y = sig_k(x) = x^d \mod n\\
& ⇔ x = y^e \mod n
\end{aligned}$$

Since $de = 1 \mod ϕ(n)$, we have $de = tϕ(n) + 1$ for some $t ∈ ℤ$. If
$x ∈ (ℤ / nℤ)^*$, then
$$\begin{aligned}
(x^e)^d &= x^{t ϕ(n) + 1} \mod n = (x^{ϕ(n)})^t x \mod n =\\
& \underset{|(ℤ / nℤ)^*| = ϕ(n)}{=} 1^t x \mod n = x \mod n
\end{aligned}$$

If $x \not\in (ℤ / nℤ)^*$, we know that $x \equiv 0 \mod p$ or
$x \equiv 0 \mod q$ and uses Fermat's little theorem and the Chinese remainder
theorem as in @sec:rsa.

## Attacks on DSS

*  **Key-only:** The attacker knows the public verification key, hence, verk .
*  **Known message:** The attacker knows some messages (not selected
   by him) and their signatures.
*  **Chosen message:** The attacker knows some messages (selected by him) and
  their signatures.

## Goals of attacks on DSS

* **Total break:** The attacker determines Alice’s private key, hence, $sig_k$.
* **Selective forgery:** With a non-negligible probability, the attacker creates
  a valid signature on a message chosen by someone else.
* **Existential forgery:** Forge a signature for some message (without the
  ability to do this for any message).
* **Universal forgery:** Forge signatures of any message.

## Examples of attacks

1. *Existential forgery using key-only attack* is always possible: Choose an
   arbitrary signature $y$, then compute the message $x$ given by
   $x := E_k (y)$.\
   $⇒$ use **redundancy** or **hashing**.

2. *Universal forgery under a chosen message attack* is possible, if one-way
   function with trapdoor is multiplicative (e.g. RSA $(xy)^e = x^e \cdot y^e$).
   To sign $x = x_1 x_2$ trick Alice into signing $x_1, x_2$ to obtain
   $y_1, y_2$ and compute $(x, y) = (x, y_1 y_2)$.

# DSS with hashing

> DSS with hashing. Hash functions from block ciphers: definition and example,
> with proof (the example where $(x, y) → a^x b^y$).

*DSS + Hashing = Hash-then-sign*

## Definition

**DSS with hashing** is a DSS $5$-tuple $(\mathcal{P , A, K, S , V})$ such that:

* $\mathcal{P} = \lbrace{0,1}\rbrace^∗$ and
* $\mathcal{A} = \lbrace{0, 1}\rbrace^l$ for some $l ∈ N$;
* $h: \mathcal{P → A}$ a public **hash function** given by a polynomial
 algorithm;
* $sig_k(x) = f_k^{−1}(h(x))$, where $f_k : A → A$ is a one-way function with
  trapdoor.
* $∀x ∈ P, ∀y ∈ A: ver_k (x, y) =
  \begin{cases}
  \mathtt{true},   & \text{if } f_k(y) = h(x)\\
  \mathtt{false},  & \text{otherwise}.
  \end{cases}$

To avoid the attacks $h$ must be a one-way **non-multiplicative** function.
$h$ is **collision resistant** if it is infeasible to find $x_1 ≠ x_2$ with
$h(x_1) = h(x_2)$.

A **block cipher** encodes blocks of bits at a time (e.g. Vigenère, Feistel).

## Definition

**Hash functions from block ciphers:**

Let $\mathcal{P = K = C} = \lbrace{0, 1}\rbrace^l$ for some $l ∈ ℕ$ and $E$ be
a block cipher:
$$E : \mathcal{P × K → C}, \quad (x, e) ↦ E_e(x).$$

Define $h(x_1,...,x_r) ∈ \lbrace{0,1}\rbrace^l$ with
$x_i ∈ \lbrace{0,1}\rbrace^l$ recursively (on $r$), by $h(∅) = 0$, and
$$h(x_1,...,x_r) = E_{e_h}(x_r) + e_h,
\text{where } e_h = h(x_1,...,x_{r−1}).$$

SHA-1 is an example of such a hash function.

# DSS and Public-key cryptosystems

> DSS and Public-key cryptosystem: sign-then-encrypt versus encrypt-versus-sign.

# ElGamal variant of DSS (Definition)

> ElGamal variant of DSS: definition and correctness. Security assumptions.
> Example of misuse (with proof).

# ElGamal variant of DSS (Misuse)

> ElGamal variant of DSS: example of misuse (with proof). ECDSA: definition and
> correctness.

# Digital currency

> Digital currency: definition and security requirements. Distributed
> ledgers. Blockchain. Security assumptions underlying the generation of the
> bitcoin address.

# Bitcoin transactions

> Bitcoin transaction and its verification. Merkle tree. Bitcoin mining.

# Bit generators

> Bit generator. Linear feedback shift register: definition, periods, security.
> RSA bit generator.

# Distinguisher and next bit predictors

> Distinguisher. Next bit predictor. Yao’s theorem (sketch of proof).

# Error-correcting codes and expander graphs

> Error-correcting codes and expander graphs

# Probabilistic pidgeonhole principle

> Describe the probabilistic pidgeonhole principle and explain, with examples,
> why it is relevant in cryptography (i.e hash functions, birthday paradox etc).

# Attacks on cryptosystems relying on structural weaknesses

> Describe a variety of attacks that rely on structural weaknesses in respective
> cryptosystems (for instance, known message attacks for multiplicative systems,
> or weaknesses of El Gamal under weak random choices).

# Shanks algorithm

> Describe Shanks algorithm, give examples of its use and outline how to use
> Shanks Algorithm to compute the order of an elliptic curve of prime order in
> combination with Hasse’s bound.

## References
