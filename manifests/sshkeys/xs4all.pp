	add_ssh_key { xs4all_ssh_1:
		user	=> "xs4all",
		type	=> "ssh-rsa",
		key	=> "AAAAB3NzaC1yc2EAAAABIwAAAIEA8dDGdThW8WV/k6c+XIpZGcv9IsK067cgT88alOQtaMo/cxCpX2ESWo++RCAwc9SUWxjrsOvo3x6JWGoVOTdXq4SnBwqgX02zZGoL1DjZwfQxfF3zN/AC+uKZTqgX1RnbFfr571TO9laTnJ3dSu5pgElsBAOfURaVGz19ZhN98Ds=",
		name	=> "Carelsm@beechnut.xs4all.nl",
	}
	add_ssh_key { xs4all_ssh_2:
		user	=> "xs4all",
		type	=> "ssh-rsa",
		key	=> "AAAAB3NzaC1yc2EAAAABIwAAAIEAzq+/8IJputPveyQKOFufRTZREZ0uE/P7u0iYbdmMZFsdy56Wt6/Qvkzny/f9AKcHqFuwkDgvYIWtVeZNKa1aL1iWqyjbC9EQkVq37vEzmnWLJRk968W9owoFV8C1JE/iQd5/ZfoNUzcolxd2jTbuvdQ8LiDfEivfbOroi7KwfMs=",
		name	=> "maarten@macbook.carels.info",
	}
	add_ssh_key { xs4all_ssh_3:
		user	=> "xs4all",
		type	=> "ssh-rsa",
		key	=> "AAAAB3NzaC1yc2EAAAABIwAAAQEAnNQRiS9gShwU5a3t6WwHDk0QaS/XrBBUK2SOq4vmH42GLsc/qwyVp8PVFFD+xepMx7XpFmSSMiDZyGDy6sSgQJauTbkdAVTSkvR62/KaBrm2uChoeYZyBVkMmMjoG8LoOp2mPheKLSuMgKoV9XbUW0qi3ERBydQkXuSksZU7U/94Zt0QYkBMecgGh6TZrXKf5OxAamFT5a6p1X0DC5pb1bFKLDuHHPSojBFCWTYU4D9GCDank6GhTWn4JJ4SeJEjdPegy1WKfEzSeOIScRGhByIRAzjPv2LZChIGR80MLHgo0PKrLKJlQu3FzvQKFZEfq7iiznz0g1l0+9c6ezLyeQ==",
		name	=> "carelsm@netadmin.xs4all.nl",
	}
	add_ssh_key { xs4all_ssh_4:
		user	=> "xs4all",
		type	=> "ssh-rsa",
		key	=> "AAAAB3NzaC1yc2EAAAABIwAAAQEAo8iWoeIUYwU1/k7inCwSJQWNDIkQbIklefwmXG8U94Xr07zdQzvc4WCiPycTKTjEmEtc5KJTrPanwpX7ohPgNcWXiW4LS2ceDnXN+/EbZ4nF4MywfRebAX7Yd0IwdqESIX/hvfV9GzmoaaGo6/U4WDfTUsoRu71CUEuBY2jIygMhupvcrD8CbQD6PjkXAkgFKqXoP5CW2puv+MExGpLjJSwcdgjRi2O1SXyTo1eNSnWY7DqWCF6ptJDxWYeBP1LdmnevYLxSoCcJLNUB3m4+9/u+IhYZCZD2N+rScSfGYho66SJq+giQ/peL28gJ3cBK7gbw7T/ooQq6e/W2AV3Wnw==",
		name	=> "arndm@netadmin.xs4all.net",
	}
	add_ssh_key { xs4all_ssh_5:
		user	=> "xs4all",
		type	=> "ssh-dss",
		key	=> "AAAAB3NzaC1kc3MAAACBAO6y756diIRRmhXXepPypExQTDWTCcsC2BUc8OfM3KNY11hYcSu97ClSM66BVnbQnPDmEUH7M3dfKTpSgaQC0x8IqdD3kE4UJwcakqvvpUJ6cF4TPqlUlpPtFdlIcvGCLJpKGXTAJ/jO0wmfPjAmhxRii5H9BzWVhFPJ4nE8FyxTAAAAFQD2XsJYgLx95J/YxD8OIGiTsZjV7QAAAIAMvUl1zunvUYkqJZdSbfKzeN6nnkBl1PqkWxSJLy+L9XrSMyigTGrN7pc3MVnREwykYuC71W4Z8S++m8bT5s96bJ+YI6L5BDGUG7wYyw+Ej3omh7oCulEkSL4Tpd+HM8ovxOgkPV2AsNOTEUesRE5YxJTJpb33QmUpkhj8+7lg4AAAAIEAkJTIR+383NcOsIRDfIrS1tyUj4xrjFe8KHEFjpGd3J3YRCAFyyVnF+/iII717lycKmdTZi5rJPcdzjwEjlpF5Rwu/MSgh84KJeDlkyXjJEpt+jzWzjbcZaORmsNOUVzqMq64QRGoRXFzWBAePaIh2TvVkm4r0RCFfCRyEqyW1Dw=",
		name	=> "johnpc@lsd",
	}
	add_ssh_key { xs4all_ssh_6:
		user	=> "xs4all",
		type	=> "ssh-dss",
		key	=> "AAAAB3NzaC1kc3MAAACBAJg/z9qQA57r7lQEUeHscMotlasH8hKRQcBmyeFHd92ncY2pWOoDKtM62kd9xUWHxRMVhpWxwLpyzpddXENaLRl7gFtPz5gUXBSfcRANNzmaW9d+X+ydu8AcYR7VKNouAhkNaXXPVAFT66RW9l9sjzdHRYqP2CPhmQTpe1x/CHYDAAAAFQDCpLVt0WEaL+L8NUsYVKQqvXl4uwAAAIEAkRKhV39R2ElY1huvtBLkASEjRCGVYvmLVa8xcYrhVJuN2BVD0rBrK9zXDcY1j98miNvf2kfvi2JaANpaYNSr/C8R48rMeOAegj1X1bp+wQ1jxECBnhN2VhwIcZakGXlMDtmfoYkI7gbEpPGvCIAlS1B2fhsRCoJLFFbKcwRz90EAAACAXa2X4ByVZ1o3/2LImQdVEBRw8+8EhG/UhulrLksNa0Wnzpk4PrR1YUdWlvBnfG37/pcah7Tf4FSdL76ZGSclZGV+oHVjqtyhuJc0ZK36UJQ/GxGSbA3d2j39MIt1QiDlysOlzyR7dxXbQZ1jbv1d/K2DDNQ36y4MR99nFF6aUwA=",
		name	=> "john@pc.xs4all.nl",
	}
	add_ssh_key { xs4all_ssh_7:
		user	=> "xs4all",
		type	=> "ssh-dss",
		key	=> "AAAAB3NzaC1kc3MAAACBAL+cCWAag3ikC/WXp3WF95ek82JDLLR9Q2jCrbHBaWVoi8oq57sXVWPwZjPqF975E8dhWuZMmlKeV18h9lFEf4WZIadx0H1v9notCMGWXIjgDcPv/vtlC0GYAeaRIRVaZn2DmAgDYDeqvrD77F2wmXHChMYdNKES4Zr2lRCNNxiLAAAAFQCaArV2oqbWTZwQ/0uP3tKPG6EVLQAAAIBTC2pUOx44tNYoWMWV7F2ktiskxlKmayT8R1QAtcCB+w2PYiIYHpX0Qo4pYpP1gVpSx6FWgUkxf+eSfgbgaLsM9p4Xp/iKQZw38W3gTWYVHv/zTohBBvlZurMU4KFLFZonk9E/7CTVf4z7a+To07BXXIR34VfxB2kaMkSq8ODcfwAAAIEArf9ZF7R8WNNpA21Xl3P+R4dQq0CSSdewnSwZQRoxcRLyQO1g52K2fLno4FaJw9IGr8P2z5hDKycoOojsEpv12yX67drOW8wsn+d8A+XkuVNPF7ArObvYfwAxbcV7J8cw3E55PnWfJF9zcaP2WOoc9FtQ/TgWGrE4k3XSQtk45EU=",
		name	=> "kiersb@mescaline",
	}
	add_ssh_key { xs4all_ssh_8:
		user	=> "xs4all",
		type	=> "ssh-rsa",
		key	=> "AAAAB3NzaC1yc2EAAAABIwAAAgEAscnTkPWPZq1U4PtgJ7ObSPKNdTSNVYbV++3w5k37xmtOhMPZvf9aDzjBR8nymv7JzjPiW1yFnu2dg54tARPD8GpMxr6vCz8VbzbrXL5ROGMYKUGekHKjaZmm9rPf8HO5OHswBceycH3eaZe/uc3hPUVUiIWjeQMWuaK58Ktx+jUDLwVl44mL5ELGAlkq0G8f/NryEX6ymem2KdL+5Uzhv8eGBu74LFE6kj/OLZ2k2YX2XSvRZpObgVF+6X9nxvEpkzjpfnux1vnDVvtHpmbt1EY3H2xQwStMZrSSU9rMHHL+yZcmnW2QC+/CBs9XGIwQE1PnaDAnPR5qebNoCX4MC61i/IP12bwONaogAZb2En1j96Y2k8fjRLb2TKIFYuF3usvMwsRJwpmDxXzZb+V/p+KREoCAZisVi7YHS9uQKdUBcrFolGqmcm7/eGN0uP41jbaMEPVxRdqgrSIB6FevYQd01hsSXPQKyFy4r/9DP075f3Xg3LGof4qCemH5ID+e9g7sG8pwiFV/nDKuy8iKmfVqKsUDNmiCbc5EWIXAt+PPTPiJAHhswikGJkaRPeTGYiPvbt75JSBw+hiHla+bB+15vCNI8V0MSv/qo4KC4X3JnkMXPP31pXcVwC01BKW/OTT0mqIav/qAawjVMBqiD1xbMpYnxJ08R3BxFVRLd70=",
		name	=> "timr@netadmin.xs4all.net",
	}
	add_ssh_key { xs4all_ssh_9:
		user	=> "xs4all",
		type	=> "ssh-dss",
		key	=> "AAAAB3NzaC1kc3MAAACBAPfAC0eY0EgYTkUMQ8oxMGdMqJg1LU75+rcVV2kmPThZaZ8CqM//7zrAF7T2vZGl7/YAAZwD9uiXv/VceEXbVifzI94nPdcULhSv2UvBr6I6fP00yA0jZrMNYEjo34m1OpDLauwVv9djMXOqxL/8QCCdrY2xRyif64Z+k00Nh0e1AAAAFQCoGGhUPUQ08k14aP+iVZxBj582wwAAAIEAj+iPMJieyhex3BIv4ESyjVx3QnP1g+WTXEb1aj1WLCuE/QSZvmD4qQMO3HtGu5H3UROsxJUKSjsnRE33x1V4XWKAK0yuoJTFKxEgnrmg2URUpqhciMCqgC7nbIFCSpqWwR+Md6vms8hQJyDbfWVcjmh4VkCeaqnL6FNdecsJlqUAAACAGfND6IM304KZx3bQ2MMFUpBqvUDq+WG+FqAlhCYvERMuEIYPfdTKY7vzELVKH77GQKTPWgDU1i3pYhVmSiNvQj9debkyMpdGzPIL3mDf/WEvrXf44cdhx87tk7zB1f9vOxIKigR3UpSxMn4PO3on3rJMPlvTNJ34cfj+Evlq2wo=",
		name	=> "timo@timo-laptop",
	}
	add_ssh_key { xs4all_ssh_10:
		user	=> "xs4all",
		type	=> "ssh-rsa",
		key	=> "AAAAB3NzaC1yc2EAAAADAQABAAABAQDH1VWa24jtQ256NJ+Ya+vLc3iK+MJOhHJx3oXl1a9jB2MOCWhIkWS2K7LBPDEISWSj+uqQJGR9XpM7AU2+aLYyDiElsMCgWQKahK8bfQarinR+3G9B8F4tD0WN4EIenebLzpI07RrshHzOnjQo+W9yHtSrenR9qkDWkiy1BsnM2j8yZtCOTJBnoXmh2h6bSUIG1568m2fKr6lGfiKVr8Ds+cMcQNotBPuVNO1ZQmTQQdCZP9DGnlSBi7tagQTqlzgu1wsyPkk7Mf36rXqVRva8OXlng2WOLjIX0CVVolq1i5gvrwNtpR+SWoJLtRdc5++MBLn21Ks0Lz9HNYWlZaW/",
		name	=> "arndm@mabuntu",
	}
	add_ssh_key { xs4all_ssh_11:
		user	=> "xs4all",
		type	=> "ssh-dss",
		key	=> "AAAAB3NzaC1kc3MAAACBAJ2TUhpngeAKI9zb6HTZ2G3yUfVp9F0b6Jy1Kbj4V5O/yOeR0oIYs8sXp4uvcunOfKDQDJhRQN8AhQK/FAdT3vIGHdZyifKrlBOWexmN9edhXHV5bLR59uGnq2Lm+3TihKgTgjcpx6STFl9C0HdAtcAYvgnDz3FBOIETXJnyGhXbAAAAFQC2e0EM+cqc3Pn4XpPiFq3Cys0TGQAAAIB2Skwn/2Myt5MpiC9jLplu+ZApiiohp6NcV1ZMHzGjH53efb8bI/BOIxRcNKlU8rHr71x6UJLg0w+fcbo1jdmgspayTaj/mwQq9wpNfcajlmnQYVCdQ3Y1f16KVXjAVTgcZYDWKVt15RotY2fGRjWEVmJ5HaOqCiDvGrSEiKyflgAAAIEAmvdEH47gTTZWqtbEPrXupIMZWWVhLaXZaP3yrLDwhy/0KqurYT6jN1NMJ2jcM0QbkywwgdL3cQjtfVCwG8tKfPXjCCFXjvTksmfyx+r9+MJqWIyf/7sk/Kl1IVmi8y7sCPEUvm5cMiAuD/6VJbTXQYQHIphTbOxWg0b0vKPBV38=",
		name	=> "jcqschuu@shell1.office.xs4all.nl",
	}
	add_ssh_key { xs4all_ssh_12:
		user	=> "xs4all",
		type	=> "ssh-dss",
		key	=> "AAAAB3NzaC1kc3MAAACBAMROwonJ92paPJQkJEIVz0f/Kn7+U+Cp0o8cGmK0t3IUzOdks6z6QMmtvYpZCJBZKJP9PHiydUq17DE0NJmuzTHxrZKzAcklf3vOuViiG2OtphvrYjYMO9DljK+qY/5t7w/sLSjGRp/CobghcBr/TA/7vtS61s4uOQZkQ0+IcMKnAAAAFQCrxVJRkWcVx98y0uXA6UAYUIoylQAAAIBlJdVfbolpA2uzskZoAJt6DGEJh6jr9jFeVuuO6cYC0WkRJskGi9ZazwtDf49VBwa2/FUFahLoInxuaX8kaI6IozB0yLF6XzuTCeoAUBCRLXl0W28gfUebpMjANj5b662N7f77fxwrQV9dkx94CJJqOweD5f6MhmbxNFudaTFVVQAAAIBRLEAP5UCWsZJ03KE/soTLkU2LxC5Hk5ryQVHl+jiXhqSvTezUaKf8dIrmR+Aa8zsTzccQPDYwGnushk04fV4ASsSrSIYqn8WlPrcghH9XuzzK7cNGMs4/1F1h35ZchXkXBtIdKrZVdPjrmwf93LnVSolLSEBQc9oy39Pbf5YpKw==",
		name	=> "mikevs@xs4all.net",
	}
	add_ssh_key { xs4all_ssh_13:
		user	=> "xs4all",
		type	=> "ssh-dss",
		key	=> "AAAAB3NzaC1kc3MAAACBANmLy3/PuiImH81ufL9SiMACN7vumP1Q0QLHS5zOBAeh5Jdi2jMRKdR/M4vFe3KnrSH53j4INR/kCOqfpsMbdUG2HWNKbjp0UTbRQIsS4MOapSYx6ob4XRveJGH77yCgjmeuRR1OnbFzHTp4p8PvBnwv2muyBh7aA5f1q8Y3O2WBAAAAFQDZJM0i8iidyLhxS/1B6hsylC9lSQAAAIAlFwvhSXK7rGY2oNdLHRBWmKZ7SJLfObEZvnBSKSbzmPFK5wGLnTGMa2sMe6WAXnBaOZw1p9ZCur0VxMzrBpxde+EcbQ1b8Zni47QOUM+luz6We7CWboGpI+ZbJst6lwzl+CA4gGyK3QB2qIZHGwd+ooXGvDqNgQyKwIp322X7tQAAAIAqvBRhKigmTBy4wQ9bnc/wyoQa2kv/MvV5mlkVhIOhOyaSE7XPq48MIcDtSzuFPR86FDguibc4FKWFhkhs7CVs10iXXKyY0cUNejfMqvvOLundT3EU/r0wNMcuiw1xpbVChyKuXYIbTUHzqH9Wym9pI9KoyzisosodUI1Ab9ietg==",
		name	=> "remcovz@shell1.office.xs4all.nl",
	}
