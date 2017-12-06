Feature: classify dna region
  As a bio informatics researcher
  I want to have a classifier that predict whether a DNA region is DMR(differentially-methylated region) or non-DMR
  so that I can use it to mark all DMRs in a given chromosome

  Scenario Outline: DMR classification
    When the classifier reads a <DNA region>
    Then it should predict <whether the region is a DMR>

    Examples:
      | DNA region                                                   | whether the region is a DMR |
      | AATGAAGCACAGAAAAGTATTAAAGTATTAAGTTTTCAGCATCTAATGAAACAAAGAACT | true                        |
      | TTAAGAAACAGATAAGAATTTTAACTCAGAACCTTAAGAAGAGTTGTTTCCCAAGCATGC | false                       |
      | ATTAAAGCACAAAGAGTTAAATAAAGCACAGAAAGTTAATGTTTAATAAAGCAAAGAGTT | true                        |
      | AATAAAGAGTTGTATTTCTCTAGTTCTTAATGAAGCACAGAAAAGTATTAAAGTATTAAG | true                        |
      | TTTTCAGCATCTAATGAAACAAAGAACTTTAAGAATTAGTTAAGAATTTTAGCTCAGAAC | false                       |
      | CTTAAGAAGTGTTGTTTCGCAAGCATGCATTAAAGCACAAAGAGTTAAATAAAGCACAGA | false                       |
      | TGTACTGAGAGTTGAAACATGAACATCCTGCAAATCAAATGACTTTTGAACTTCACCACA | true                        |
      | CTGACTCATCTTACATTTTTTACTCATATTTATCTCTTTACTATGAACTTCATTTAATTA | false                       |
