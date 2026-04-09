final List<Map<String, String>> topics = [
  {
    'title': 'Superposition',
    'description': 'Qubits can exist in multiple states simultaneously.',
    'formula': 'ψ = α|0⟩ + β|1⟩',
    'note': 'Experiments on wavefunction interference confirm the possibility of superposition. For example, the double-slit experiment demonstrates wave-like behavior of particles (Nature Physics, 2015). However, alternative interpretations are discussed — such as decoherence theory (Zurek, 2003).',
    'example': '''
**Problem:**  
A qubit is in the state ψ = (3/5)|0⟩ + (4/5)|1⟩.  
What is the probability of measuring it in state |1⟩?

**Solution:**  
P = |⟨1|ψ⟩|² = |4/5|² = 16/25 = 64%
'''
  },
  {
    'title': 'Entanglement',
    'description': 'Entangled particles behave as a single system.',
    'formula': 'ψ = (|00⟩ + |11⟩) / √2',
    'note': 'Entanglement has been experimentally confirmed, including the work of Aspect et al. (1982) and later Bell test experiments. Debates over locality and realism still continue, with alternatives such as hidden variable theories (Einstein, Podolsky, Rosen, 1935).',
    'example': '''
**Problem:**  
Two qubits are in the Bell state (|01⟩ - |10⟩)/√2.  
If the first qubit is measured and found to be |0⟩, what is the state of the second qubit?

**Solution:**  
The combined state collapses to |01⟩ ⇒ the second qubit is |1⟩ with 100% probability.
'''
  },
  {
    'title': 'Measurement',
    'description': 'Measurement collapses the superposition.',
    'formula': 'ψ → |i⟩ with probability |⟨i|ψ⟩|²',
    'note': 'The classical interpretation involves wavefunction collapse (Bohr, 1928). Competing views include the many-worlds interpretation (Everett, 1957) and QBism (Fuchs et al., 2010), which treats measurement as subjective.',
    'example': '''
**Problem:**  
A system is in state ψ = √0.8|0⟩ + √0.2|1⟩.  
Find the most probable measurement outcome.

**Solution:**  
|0⟩ has probability 0.8 → most likely outcome is |0⟩.
'''
  },
  {
    'title': 'Tunneling',
    'description': 'Particles pass through potential barriers.',
    'formula': 'T ≈ e^{-2κa}, κ = √{2m(V - E)}/ħ',
    'note': 'Confirmed in alpha decay and scanning tunneling microscopy (STM, IBM, 1981). Quantum tunneling remains one of the paradoxical effects, discussed in the context of energy delay time.',
    'example': '''
**Problem:**  
An electron with energy E = 2 eV approaches a barrier of height V = 4 eV and width a = 0.5 nm.  
Estimate the tunneling probability.

**Solution:**  
Use T ≈ e^{-2κa}, where κ = √(2m(V − E))/ħ. Plug in values → result is ~10⁻³.
'''
  },
  {
    'title': 'Schrödinger\'s Cat',
    'description': 'A paradox illustrating superposition and observation.',
    'formula': 'ψ = (|alive⟩ + |dead⟩)/√2',
    'note': 'A thought experiment that highlights issues with classical interpretations of measurement. In recent years, macroscopic superpositions have been explored in superconducting systems (Science, 2020), sparking new debates.',
    'example': '''
**Problem:**  
Why can't we observe a macroscopic object like a cat in superposition?

**Solution:**  
Due to rapid decoherence from interaction with the environment, collapsing the superposition before observation.
'''
  },
  {
    'title': 'Heisenberg Uncertainty Principle',
    'description': 'It is impossible to precisely know both position and momentum of a particle.',
    'formula': 'Δx · Δp ≥ ħ / 2',
    'note': 'A fundamental limit, proven mathematically and experimentally confirmed. Extensions and generalizations are also discussed, such as the Ozawa uncertainty relation (Ozawa, 2003).',
    'example': '''
**Problem:**  
If the uncertainty in position is Δx = 1 nm, find the minimum uncertainty in momentum.

**Solution:**  
Δp ≥ ħ / (2Δx) = (1.05 × 10⁻³⁴) / (2 × 10⁻⁹) ≈ 5.3 × 10⁻²⁶ kg·m/s.
'''
  },
  {
    'title': 'Quantum Teleportation',
    'description': 'Transfer of quantum state between distant particles.',
    'formula': '|ψ⟩_C → |ψ⟩_B via EPR pair and classical channel',
    'note': 'Experimentally realized in 1997 (Bouwmeester et al., Nature). The technology has improved, though limitations are discussed, including the necessity of a classical communication channel.',
    'example': '''
**Problem:**  
Why can't quantum teleportation be used for faster-than-light communication?

**Solution:**  
Because classical information still needs to be transmitted to complete the teleportation process.
'''
  },
  {
    'title': 'Quantum Tunneling Time',
    'description': 'How long it takes a particle to tunnel through a barrier.',
    'formula': 'τ ≈ ħ / (E₂ - E₁)',
    'note': 'Despite tunneling being confirmed, the measurement of tunneling time remains unresolved (Science Advances, 2020). Competing models include phase time, delay time, and others.',
    'example': '''
**Problem:**  
Why is it difficult to define how long a particle spends in a barrier?

**Solution:**  
Because time is not an operator in quantum mechanics; different definitions (phase, dwell, Larmor time) yield different answers.
'''
  },
  {
    'title': 'Quantum Decoherence',
    'description': 'The loss of quantum properties due to interaction with the environment.',
    'formula': 'ρ → ρ_diag, where cross-terms vanish',
    'note': 'A key explanation for the quantum-to-classical transition. Supported by models (Zurek, Rev. Mod. Phys., 2003), although it does not fully resolve the measurement problem.',
    'example': '''
**Problem:**  
What happens to the interference pattern if a photon is observed in a double-slit experiment?

**Solution:**  
Interference vanishes due to decoherence: measurement causes loss of phase correlation between paths.
'''
  },
  {
    'title': 'Quantum Vacuum',
    'description': 'Even in empty space, particles constantly appear and disappear.',
    'formula': '⟨0|T{ϕ(x)ϕ(y)}|0⟩ ≠ 0',
    'note': 'Vacuum fluctuations are observed in the Casimir effect, Lamb shift, and virtual particles (Casimir, 1948). The vacuum’s role in mass generation and the structure of the universe is an active area of research.',
    'example': '''
**Problem:**  
What causes the Casimir force between two uncharged plates?

**Solution:**  
The restriction of vacuum fluctuations between the plates creates a net pressure pushing them together.
'''
  },
];
