library(lavaan)

freq75 <- readRDS("/Users/tobiaskoch/Dropbox/Projekte/Aktuelle Projekte/Manuel_Bohn/freq75.rds")
freq100 <- readRDS("/Users/tobiaskoch/Dropbox/Projekte/Aktuelle Projekte/Manuel_Bohn/freq100.rds")
freq125 <- readRDS("/Users/tobiaskoch/Dropbox/Projekte/Aktuelle Projekte/Manuel_Bohn/freq125.rds")
freq150 <- readRDS("/Users/tobiaskoch/Dropbox/Projekte/Aktuelle Projekte/Manuel_Bohn/freq150.rds")
freq175 <- readRDS("/Users/tobiaskoch/Dropbox/Projekte/Aktuelle Projekte/Manuel_Bohn/freq175.rds")
freq200 <- readRDS("/Users/tobiaskoch/Dropbox/Projekte/Aktuelle Projekte/Manuel_Bohn/freq200.rds")



summary(freq75, fit.measures=T)
modindices(freq75, minimum.value = 100)

# lhs op        rhs      mi    epc sepc.lv sepc.all sepc.nox
# 1            f =~     Abitur 117.753 -0.266  -0.271   -0.190   -0.190
# 3            f =~     Alltag 130.033  0.234   0.239    0.167    0.167
# 5            f =~    Appetit 333.866 -0.577  -0.588   -0.412   -0.412
# 6            f =~   Ausdauer 190.702  0.275   0.281    0.197    0.197
# 16           f =~     Formel 124.693 -0.291  -0.297   -0.208   -0.208
# 21           f =~  Hamburger 228.340 -0.398  -0.406   -0.285   -0.285
# 24           f =~ ignorieren 137.968 -0.262  -0.267   -0.187   -0.187
# 38           f =~   neidisch 129.024  0.234   0.239    0.167    0.167
# 39           f =~      Nelke 128.629 -0.261  -0.266   -0.186   -0.186
# 40           f =~      Niete 123.365 -0.257  -0.262   -0.183   -0.183
# 55           f =~   stricken 149.403 -0.280  -0.286   -0.200   -0.200
# 58           f =~     Tänzer 186.602 -0.372  -0.379   -0.266   -0.266
# 59           f =~    Telefon 168.722 -0.535  -0.546   -0.382   -0.382
# 63           f =~ verbessern 446.668  0.422   0.431    0.302    0.302
# 64           f =~   vermuten 105.702  0.207   0.211    0.147    0.147
# 65           f =~   vertraut 274.960  0.326   0.332    0.233    0.233
# 66           f =~   verwesen 108.000 -0.298  -0.304   -0.213   -0.213
# 67           f =~ verzichten 142.591  0.238   0.243    0.170    0.170
# 74           f =~  Erfahrung 393.718  0.381   0.389    0.272    0.272
# 151     Abitur ~~     Abitur 117.753  0.532   1.000    0.490    0.490
# 153     Alltag ~~     Alltag 130.033 -0.468  -1.000   -0.490   -0.490
# 155    Appetit ~~    Appetit 333.867  1.154   1.000    0.490    0.490
# 156   Ausdauer ~~   Ausdauer 190.702 -0.551  -1.000   -0.490   -0.490
# 166     Formel ~~     Formel 124.693  0.583   1.000    0.490    0.490
# 171  Hamburger ~~  Hamburger 228.341  0.797   1.000    0.490    0.490
# 174 ignorieren ~~ ignorieren 137.968  0.524   1.000    0.490    0.490
# 188   neidisch ~~   neidisch 129.024 -0.469  -1.000   -0.490   -0.490
# 189      Nelke ~~      Nelke 128.629  0.522   1.000    0.490    0.490
# 190      Niete ~~      Niete 123.365  0.513   1.000    0.490    0.490
# 205   stricken ~~   stricken 149.404  0.561   1.000    0.490    0.490
# 208     Tänzer ~~     Tänzer 186.602  0.744   1.000    0.490    0.490
# 209    Telefon ~~    Telefon 168.722  1.070   1.000    0.490    0.490
# 213 verbessern ~~ verbessern 446.668 -0.845  -1.000   -0.490   -0.490
# 214   vermuten ~~   vermuten 105.702 -0.413  -1.000   -0.490   -0.490
# 215   vertraut ~~   vertraut 274.960 -0.652  -1.000   -0.490   -0.490
# 216   verwesen ~~   verwesen 108.000  0.596   1.000    0.490    0.490
# 217 verzichten ~~ verzichten 142.591 -0.475  -1.000   -0.490   -0.490
# 224  Erfahrung ~~  Erfahrung 393.718 -0.762  -1.000   -0.490   -0.490

summary(freq100, fit.measures=T)
modindices(freq100, minimum.value = 100)

# lhs op          rhs      mi    epc sepc.lv sepc.all sepc.nox
# 1              f =~       Abitur 176.999 -0.278  -0.286   -0.199   -0.199
# 4              f =~       Alltag 200.601  0.248   0.256    0.178    0.178
# 7              f =~      Appetit 502.746 -0.619  -0.639   -0.444   -0.444
# 8              f =~     Ausdauer 236.172  0.261   0.270    0.188    0.188
# 14             f =~      betonen 144.593  0.217   0.224    0.156    0.156
# 17             f =~         Chor 122.803 -0.213  -0.220   -0.153   -0.153
# 20             f =~    Erfahrung 587.549  0.396   0.409    0.285    0.285
# 24             f =~       Formel 211.393 -0.323  -0.333   -0.232   -0.232
# 25             f =~       Gefühl 176.713  0.270   0.279    0.194    0.194
# 31             f =~    Hamburger 340.087 -0.423  -0.437   -0.304   -0.304
# 32             f =~       Hering 433.659 -0.406  -0.419   -0.291   -0.291
# 35             f =~   ignorieren 192.291 -0.265  -0.274   -0.190   -0.190
# 44             f =~ Mathematiker 400.586 -0.477  -0.493   -0.343   -0.343
# 45             f =~       melken 117.809 -0.229  -0.236   -0.165   -0.165
# 46             f =~     Mitglied 110.318  0.182   0.188    0.131    0.131
# 53             f =~     neidisch 190.548  0.244   0.252    0.175    0.175
# 54             f =~        Nelke 169.224 -0.255  -0.263   -0.183   -0.183
# 55             f =~        Niete 160.691 -0.249  -0.257   -0.179   -0.179
# 67             f =~    schneiden 129.534 -0.498  -0.513   -0.357   -0.357
# 73             f =~     stricken 207.299 -0.285  -0.294   -0.205   -0.205
# 76             f =~       Tänzer 286.682 -0.402  -0.414   -0.288   -0.288
# 78             f =~      Telefon 365.743 -0.669  -0.690   -0.480   -0.480
# 83             f =~   verbessern 565.833  0.410   0.423    0.295    0.295
# 85             f =~     vermuten 137.638  0.202   0.208    0.145    0.145
# 87             f =~     vertraut 410.807  0.338   0.349    0.243    0.243
# 88             f =~     verwesen 185.857 -0.332  -0.343   -0.239   -0.239
# 89             f =~   verzichten 188.188  0.234   0.241    0.168    0.168
# 94             f =~      Wirkung 297.233  0.299   0.308    0.214    0.214
# 100            f =~          Bus 120.522 -0.374  -0.386   -0.268   -0.268
# 201       Abitur ~~       Abitur 176.999  0.555   1.000    0.484    0.484
# 204       Alltag ~~       Alltag 200.600 -0.496  -1.000   -0.484   -0.484
# 207      Appetit ~~      Appetit 502.745  1.238   1.000    0.484    0.484
# 208     Ausdauer ~~     Ausdauer 236.171 -0.523  -1.000   -0.484   -0.484
# 214      betonen ~~      betonen 144.592 -0.435  -1.000   -0.484   -0.484
# 217         Chor ~~         Chor 122.803  0.426   1.000    0.484    0.484
# 220    Erfahrung ~~    Erfahrung 587.549 -0.793  -1.000   -0.484   -0.484
# 224       Formel ~~       Formel 211.394  0.646   1.000    0.484    0.484
# 225       Gefühl ~~       Gefühl 176.714 -0.540  -1.000   -0.484   -0.484
# 231    Hamburger ~~    Hamburger 340.086  0.846   1.000    0.484    0.484
# 232       Hering ~~       Hering 433.659  0.811   1.000    0.484    0.484
# 235   ignorieren ~~   ignorieren 192.292  0.530   1.000    0.484    0.484
# 244 Mathematiker ~~ Mathematiker 400.584  0.955   1.000    0.484    0.484
# 245       melken ~~       melken 117.810  0.458   1.000    0.484    0.484
# 246     Mitglied ~~     Mitglied 110.318 -0.365  -1.000   -0.484   -0.484
# 253     neidisch ~~     neidisch 190.547 -0.488  -1.000   -0.484   -0.484
# 254        Nelke ~~        Nelke 169.224  0.509   1.000    0.484    0.484
# 255        Niete ~~        Niete 160.691  0.498   1.000    0.484    0.484
# 267    schneiden ~~    schneiden 129.538  0.995   1.000    0.484    0.484
# 273     stricken ~~     stricken 207.299  0.570   1.000    0.484    0.484
# 276       Tänzer ~~       Tänzer 286.683  0.803   1.000    0.484    0.484
# 278      Telefon ~~      Telefon 365.753  1.338   1.000    0.484    0.484
# 283   verbessern ~~   verbessern 565.833 -0.821  -1.000   -0.484   -0.484
# 285     vermuten ~~     vermuten 137.638 -0.404  -1.000   -0.484   -0.484
# 287     vertraut ~~     vertraut 410.806 -0.677  -1.000   -0.484   -0.484
# 288     verwesen ~~     verwesen 185.859  0.664   1.000    0.484    0.484
# 289   verzichten ~~   verzichten 188.188 -0.468  -1.000   -0.484   -0.484
# 294      Wirkung ~~      Wirkung 297.233 -0.597  -1.000   -0.484   -0.484
# 300          Bus ~~          Bus 120.528  0.747   1.000    0.484    0.484


summary(freq125, fit.measures=T)
modindices(freq125, minimum.value = 100)


summary(freq150, fit.measures=T)
modindices(freq150, minimum.value = 100)

summary(freq175, fit.measures=T)
modindices(freq175, minimum.value = 100)


summary(freq200, fit.measures=T)
modindices(freq200, minimum.value = 100)
